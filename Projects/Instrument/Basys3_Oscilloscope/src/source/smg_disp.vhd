library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity smg_disp is
port(
clk50mhz:in std_logic;
keycount:in std_logic_vector(15 downto 0);
ledouta: OUT	STD_LOGIC_VECTOR(11 downto 0)
);
end smg_disp;

architecture Behavioral of smg_disp is
signal cnt:integer range 0 to 9999;
signal count_in_g:std_logic_vector(3 downto 0);
signal count_in_s:std_logic_vector(3 downto 0);
signal count_in_b:std_logic_vector(3 downto 0);
signal count_in_q:std_logic_vector(3 downto 0);
SIGNAL	leda	: STD_LOGIC_VECTOR(11 downto 0);
begin
process(clk50mhz)
begin
 if(clk50mhz'event and clk50mhz='1')then
  if(cnt>=9999)then cnt<=0;
  else cnt<=cnt+1;
  end if;
 end if;
end process;

count_in_g<=keycount(3 downto 0);
count_in_s<=keycount(7 downto 4);
count_in_b<=keycount(11 downto 8);
count_in_q<=keycount(15 downto 12);

process(count_in_g,count_in_s,count_in_b,count_in_q,cnt)
begin
if(0<=cnt and cnt<=2499)then
case count_in_q is
 when "0000"=>
				  leda <="011100000011";
				 
 when "0001"=>
				 leda <="011110011111";
				 	
 when "0010"=> leda <="011100100101";
					
 when "0011"=>leda <="011100001101";
				
 when "0100"=> leda <="011110011001";
				 
 when "0101"=>leda <="011101001001";
				 						 
 when "0110"=> leda <="011101000001";
				 
when "0111"=>leda <="011100011111";
				 
 when "1000"=> leda <="011100000001";
				 
 when "1001"=>leda <="011100001001";
				 
when others=>leda <="011100000011";				 		 
end case;	
elsif(2499<cnt and cnt<=4999)then
case count_in_b is
 when "0000"=>
				  leda <="101100000011";
				 
 when "0001"=>
				 leda <="101110011111";
				 	
 when "0010"=> leda <="101100100101";
					
 when "0011"=>leda <="101100001101";
				
 when "0100"=> leda <="101110011001";
				 
 when "0101"=>leda <="101101001001";
				 						 
 when "0110"=> leda <="101101000001";
				 
when "0111"=>leda <="101100011111";
				 
 when "1000"=> leda <="101100000001";
				 
 when "1001"=>leda <="101100001001";
				 
when others=>leda <="101100000011";				 		 
end case;	
elsif(4999<cnt and cnt<=7499)then 
 case count_in_s is
 when "0000"=>
				 leda <="110100000011";
			
 when "0001"=>
				  leda<="110110011111";
				
 when "0010"=>leda <="110100100101";
				 
 when "0011"=>leda <="110100001101";
				 
 when "0100"=>leda <="110110011001";
				 	
 when "0101"=>leda <="110101001001";
									 
 when "0110"=>leda <="110101000001";
				 	
 when "0111"=> leda <="110100011111";
				 
 when "1000"=> leda <="110100000001";
				 	
 when "1001"=> leda <="110100001001";
					
when others=> leda <="110100000011";
						 
end case;	
elsif(7499<cnt and cnt<=9999)then
case count_in_g is
 when "0000"=>
				  leda <="111000000011";
				 
 when "0001"=>
				 leda <="111010011111";
				 	
 when "0010"=> leda <="111000100101";
					
 when "0011"=>leda <="111000001101";
				
 when "0100"=> leda <="111010011001";
				 
 when "0101"=>leda <="111001001001";
				 						 
 when "0110"=> leda <="111001000001";
				 
when "0111"=>leda <="111000011111";
				 
 when "1000"=> leda <="111000000001";
				 
 when "1001"=>leda <="111000001001";
				 
when others=>leda <="111000000011";				 		 
end case;	
  
end if;
 end process;
 ledouta <= leda ;
end Behavioral;
