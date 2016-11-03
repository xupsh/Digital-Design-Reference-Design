`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2016 04:11:52 PM
// Design Name: 
// Module Name: taxi
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module taxi(
input clk100,
input rst,
input temp_stop,
input completion,
input check_total,
output [12:0] result,
output reg [4:0] led,
output led11
    );
     
     //SW0 -- temporary stop
     //SW1 -- load fee for one trip
     //SW2 -- display total revenue
     //SW3 -- reset
     
    //variable declaration 
    reg clk1=0;
    reg [31:0] cnt=0;
    
    reg [12:0] result_temp;
    reg [5:0] timecnt=0;    //for counting 1 min
    reg [12:0] wait_time=0;//for storing time

    reg load_flag = 0;    //used for clearing distance after loaded to total revenue
    reg [12:0] subtotal=0;//fee for single trip
    reg [12:0] total=0;   //total revenue
    
            
    //1Hz clock
    always@(posedge clk100 or posedge rst)
    begin
        if (rst)
        begin
            cnt<=0;
            clk1<=0;
        end    
        else
            if (cnt==49999999) 
            begin
                cnt<=0;
                clk1<=~clk1;
            end
            else
            cnt<=cnt+1;
    end
    
    reg [31:0] distance=0;
    assign led11 = clk1;
  
    //states declaration
    parameter init  = 6'b000001,
               moving = 6'b000010,
               waiting = 6'b000100,
               load = 6'b001000,
               finish = 6'b010000,
               finish2 = 6'b100000;
    //-------------Internal Variables---------------------------
    reg [5:0] state;        // Seq part of the FSM
    reg [5:0] next_state;   // combo part of FSM
    //----------fsm------------------------
    always @ (*)
    begin
     next_state = 6'b000001;
     case(state)
       init :   if (check_total == 1'b1) begin
                    next_state = finish2;
                  end else if (temp_stop == 1'b1) begin
                    next_state= waiting;
                  end else begin
                    next_state = moving;
                  end
                  
       moving : if (completion == 1'b1) begin
                    next_state = load;
                  end else if (check_total == 1'b1)begin
                    next_state = finish2;
                  end else if (temp_stop == 1'b1) begin
                    next_state = waiting;
                  end else begin
                    next_state = moving;
                  end

       waiting : if (completion == 1'b1) begin
                    next_state = load;
                  end else if (check_total == 1'b1)begin
                    next_state = finish2;
                  end else if (temp_stop == 1'b0) begin
                    next_state = moving;
                  end else begin
                    next_state = waiting;
                  end

       load : if (completion == 1'b0) begin
                      next_state = finish;
                    end else 
                      next_state = load;
       finish : if (check_total == 1'b1) begin
                    next_state = finish2;
                  end else begin
                    next_state = init;
                  end      
       finish2 : if (check_total == 1'b0) begin
                    next_state = init;
                  end else begin
                    next_state = finish2;
                  end                                  
       default : next_state = init;
      endcase
    end    

    //----------Seq Logic-----------------------------
    always @ (posedge clk100)
    begin 
      if (rst) begin
        state <=   init;
      end else begin
        state <=   next_state;
      end
    end
    //----------Output Logic-----------------------------
    // led is used for indicating states
    always @ (posedge clk100)
    begin 
    if (rst == 1'b1) begin
      result_temp <= 13'd0;
    end
    else begin
      case(state)
        init : begin
                      result_temp <= 13'd0;
                      led = 5'b00001;
                   end
       moving : begin
                       result_temp <= distance[12:0];
                       led = 5'b00010;
                    end
       waiting : begin
                       result_temp <= wait_time;
                       led = 5'b00100;
                    end
       load : begin
                       result_temp <= subtotal;
                       led = 5'b01000;
                    end          
       finish2 : begin
                       result_temp <= total;
                       led = 5'b10000;
                    end          
       default : begin
                        result_temp <= 13'd9999;
                        led = 5'b11111;
                      end
      endcase
    end
    end // End Of Block OUTPUT_LOGIC

    //distance module. distance increase by 100 m/sec, works in "moving" state
    always@(posedge clk1 or posedge rst or posedge load_flag)
    begin
        if (load_flag || rst)
            distance<=0;
        else if (state == moving)
        begin
            distance <= distance + 100; 
        end
        else if (state == init)
        begin
            distance <= 0;   
        end
        else 
            distance<=distance;
    end 
 

    //wait time module. wait_time++ per min, works in "waiting" state
    always@(posedge clk1 or posedge rst or posedge load_flag)
        begin
            if (load_flag || rst)
                wait_time<=0;   
            else if (state == waiting)
                if(timecnt==59)
                begin
                    wait_time <= wait_time + 1'b1;
                    timecnt<=0;
                end
                else 
                    timecnt<=timecnt+1;
            else if (state == init)
            begin
                wait_time <= 0;   
            end
            else 
                wait_time<=wait_time;
        end      

    //fee calculation, rounded to whole number
    //within 3km $10, 3-10km $2.4/km, beyond 10km $3.6/km
    //during temporary stop (eg red light), $0.5/km, 
    always@(posedge clk100 or posedge rst)
    begin
        if (rst)
        begin
            subtotal=0;
        end
        else 
            if (state == load)
            begin
                if (distance <= 3000)                     
                begin
                    subtotal = 10 + wait_time/2;
                end
                else if (distance > 3000 && distance <= 10000)
                begin
                    subtotal = (distance-3000)*24/10000 + 10 + wait_time/2;
                end
                else if (distance > 10000)
                begin
                    subtotal = 10 + ( 168000 + (distance-10000)*36 )/10000 + wait_time/2;    
                end
                else 
                    subtotal = subtotal;                    
            end
            else if (state == moving)
            begin
                 subtotal=0;
            end
            else
                 subtotal = subtotal;
    end       
    
    //total revenue, calculated at "finish" state
    always@(posedge clk100 or posedge rst)
    begin
        if (rst)
            total<=0;
        else 
            if (state == finish)
            begin
                total <= total + subtotal;
                load_flag <=1;
            end
            else 
            begin
                total <= total;
                load_flag<=0;
            end
    end  
    

assign result = result_temp;    
    
endmodule


