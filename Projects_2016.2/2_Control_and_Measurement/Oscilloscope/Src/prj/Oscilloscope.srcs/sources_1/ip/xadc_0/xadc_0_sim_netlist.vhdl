-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Tue Nov 01 08:30:05 2016
-- Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               e:/Github/xupsh/Basys3-Git/Projects_2016.2/2_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/xadc_0/xadc_0_sim_netlist.vhdl
-- Design      : xadc_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xadc_0_xadc_wiz_0 is
  port (
    daddr_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dclk_in : in STD_LOGIC;
    den_in : in STD_LOGIC;
    di_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dwe_in : in STD_LOGIC;
    reset_in : in STD_LOGIC;
    vauxp6 : in STD_LOGIC;
    vauxn6 : in STD_LOGIC;
    vauxp7 : in STD_LOGIC;
    vauxn7 : in STD_LOGIC;
    vauxp14 : in STD_LOGIC;
    vauxn14 : in STD_LOGIC;
    vauxp15 : in STD_LOGIC;
    vauxn15 : in STD_LOGIC;
    busy_out : out STD_LOGIC;
    channel_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    do_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drdy_out : out STD_LOGIC;
    eoc_out : out STD_LOGIC;
    eos_out : out STD_LOGIC;
    ot_out : out STD_LOGIC;
    vccaux_alarm_out : out STD_LOGIC;
    vccint_alarm_out : out STD_LOGIC;
    user_temp_alarm_out : out STD_LOGIC;
    alarm_out : out STD_LOGIC;
    vp_in : in STD_LOGIC;
    vn_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of xadc_0_xadc_wiz_0 : entity is "xadc_wiz_0";
end xadc_0_xadc_wiz_0;

architecture STRUCTURE of xadc_0_xadc_wiz_0 is
  signal NLW_inst_JTAGBUSY_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_JTAGLOCKED_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_JTAGMODIFIED_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ALM_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 3 );
  signal NLW_inst_MUXADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of inst : label is "PRIMITIVE";
begin
inst: unisim.vcomponents.XADC
    generic map(
      INIT_40 => X"9000",
      INIT_41 => X"21F0",
      INIT_42 => X"0400",
      INIT_43 => X"0000",
      INIT_44 => X"0000",
      INIT_45 => X"0000",
      INIT_46 => X"0000",
      INIT_47 => X"0000",
      INIT_48 => X"4701",
      INIT_49 => X"C0C0",
      INIT_4A => X"0000",
      INIT_4B => X"0000",
      INIT_4C => X"0000",
      INIT_4D => X"0000",
      INIT_4E => X"0000",
      INIT_4F => X"0000",
      INIT_50 => X"B5ED",
      INIT_51 => X"57E4",
      INIT_52 => X"A147",
      INIT_53 => X"CA33",
      INIT_54 => X"A93A",
      INIT_55 => X"52C6",
      INIT_56 => X"9555",
      INIT_57 => X"AE4E",
      INIT_58 => X"5999",
      INIT_59 => X"0000",
      INIT_5A => X"0000",
      INIT_5B => X"0000",
      INIT_5C => X"5111",
      INIT_5D => X"0000",
      INIT_5E => X"0000",
      INIT_5F => X"0000",
      IS_CONVSTCLK_INVERTED => '0',
      IS_DCLK_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SIM_MONITOR_FILE => "c:/zhenyul/Xilinx_Proj_Feb/B3_Git/Measurement/Oscilloscope/Oscilloscope.srcs/sources_1/ip/xadc_0/ip/xadc_wiz_0/xadc_wiz_0/simulation/functional/design.txt"
    )
        port map (
      ALM(7) => alarm_out,
      ALM(6 downto 3) => NLW_inst_ALM_UNCONNECTED(6 downto 3),
      ALM(2) => vccaux_alarm_out,
      ALM(1) => vccint_alarm_out,
      ALM(0) => user_temp_alarm_out,
      BUSY => busy_out,
      CHANNEL(4 downto 0) => channel_out(4 downto 0),
      CONVST => '0',
      CONVSTCLK => '0',
      DADDR(6 downto 0) => daddr_in(6 downto 0),
      DCLK => dclk_in,
      DEN => den_in,
      DI(15 downto 0) => di_in(15 downto 0),
      DO(15 downto 0) => do_out(15 downto 0),
      DRDY => drdy_out,
      DWE => dwe_in,
      EOC => eoc_out,
      EOS => eos_out,
      JTAGBUSY => NLW_inst_JTAGBUSY_UNCONNECTED,
      JTAGLOCKED => NLW_inst_JTAGLOCKED_UNCONNECTED,
      JTAGMODIFIED => NLW_inst_JTAGMODIFIED_UNCONNECTED,
      MUXADDR(4 downto 0) => NLW_inst_MUXADDR_UNCONNECTED(4 downto 0),
      OT => ot_out,
      RESET => reset_in,
      VAUXN(15) => vauxn15,
      VAUXN(14) => vauxn14,
      VAUXN(13 downto 8) => B"000000",
      VAUXN(7) => vauxn7,
      VAUXN(6) => vauxn6,
      VAUXN(5 downto 0) => B"000000",
      VAUXP(15) => vauxp15,
      VAUXP(14) => vauxp14,
      VAUXP(13 downto 8) => B"000000",
      VAUXP(7) => vauxp7,
      VAUXP(6) => vauxp6,
      VAUXP(5 downto 0) => B"000000",
      VN => vn_in,
      VP => vp_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xadc_0_xadc is
  port (
    temperature_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_6 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_7 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_14 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_15 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rst : in STD_LOGIC;
    clk100 : in STD_LOGIC;
    vauxp6 : in STD_LOGIC;
    vauxn6 : in STD_LOGIC;
    vauxp7 : in STD_LOGIC;
    vauxn7 : in STD_LOGIC;
    vauxp14 : in STD_LOGIC;
    vauxn14 : in STD_LOGIC;
    vauxp15 : in STD_LOGIC;
    vauxn15 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of xadc_0_xadc : entity is "xadc";
end xadc_0_xadc;

architecture STRUCTURE of xadc_0_xadc is
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[4]_i_3_n_0\ : STD_LOGIC;
  signal \MEASURED_AUX0[15]_i_1_n_0\ : STD_LOGIC;
  signal \MEASURED_AUX1[15]_i_1_n_0\ : STD_LOGIC;
  signal \MEASURED_AUX2[15]_i_1_n_0\ : STD_LOGIC;
  signal \MEASURED_AUX2[15]_i_2_n_0\ : STD_LOGIC;
  signal MEASURED_AUX3 : STD_LOGIC;
  signal \MEASURED_AUX3[15]_i_1_n_0\ : STD_LOGIC;
  signal \MEASURED_AUX3[15]_i_2_n_0\ : STD_LOGIC;
  signal \MEASURED_TEMP[15]_i_1_n_0\ : STD_LOGIC;
  signal \MEASURED_TEMP[15]_i_2_n_0\ : STD_LOGIC;
  signal busy : STD_LOGIC;
  signal \daddr[0]_i_1_n_0\ : STD_LOGIC;
  signal \daddr[1]_i_1_n_0\ : STD_LOGIC;
  signal \daddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \daddr[4]_i_1_n_0\ : STD_LOGIC;
  signal \daddr[6]_i_1_n_0\ : STD_LOGIC;
  signal \daddr[6]_i_2_n_0\ : STD_LOGIC;
  signal \daddr_reg_n_0_[0]\ : STD_LOGIC;
  signal \daddr_reg_n_0_[1]\ : STD_LOGIC;
  signal \daddr_reg_n_0_[2]\ : STD_LOGIC;
  signal \daddr_reg_n_0_[4]\ : STD_LOGIC;
  signal \daddr_reg_n_0_[6]\ : STD_LOGIC;
  signal dclk_bufg : STD_LOGIC;
  signal den_reg : STD_LOGIC;
  signal \den_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \den_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \den_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \den_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \den_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \den_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal di_drp : STD_LOGIC;
  signal \di_drp_reg_n_0_[0]\ : STD_LOGIC;
  signal \di_drp_reg_n_0_[1]\ : STD_LOGIC;
  signal \di_drp_reg_n_0_[2]\ : STD_LOGIC;
  signal \di_drp_reg_n_0_[3]\ : STD_LOGIC;
  signal \di_drp_reg_n_0_[4]\ : STD_LOGIC;
  signal \di_drp_reg_n_0_[5]\ : STD_LOGIC;
  signal \di_drp_reg_n_0_[6]\ : STD_LOGIC;
  signal \di_drp_reg_n_0_[7]\ : STD_LOGIC;
  signal \di_drp_reg_n_0_[8]\ : STD_LOGIC;
  signal \di_drp_reg_n_0_[9]\ : STD_LOGIC;
  signal do_drp : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal drdy : STD_LOGIC;
  signal dwe_reg : STD_LOGIC;
  signal \dwe_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \dwe_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \dwe_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \dwe_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \dwe_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal eos : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of state : signal is "yes";
  signal NLW_u_xadc_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_u_xadc_eoc_out_UNCONNECTED : STD_LOGIC;
  signal NLW_u_xadc_ot_out_UNCONNECTED : STD_LOGIC;
  signal NLW_u_xadc_user_temp_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_u_xadc_vccaux_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_u_xadc_vccint_alarm_out_UNCONNECTED : STD_LOGIC;
  signal NLW_u_xadc_channel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_state_reg[0]\ : label is "yes";
  attribute KEEP of \FSM_sequential_state_reg[1]\ : label is "yes";
  attribute KEEP of \FSM_sequential_state_reg[2]\ : label is "yes";
  attribute KEEP of \FSM_sequential_state_reg[3]\ : label is "yes";
  attribute KEEP of \FSM_sequential_state_reg[4]\ : label is "yes";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of i_bufg : label is "PRIMITIVE";
begin
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001100F0F0F5"
    )
        port map (
      I0 => state(1),
      I1 => eos,
      I2 => drdy,
      I3 => \FSM_sequential_state[4]_i_3_n_0\,
      I4 => state(4),
      I5 => state(0),
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"030C030C030C33C8"
    )
        port map (
      I0 => eos,
      I1 => state(0),
      I2 => state(4),
      I3 => state(1),
      I4 => state(2),
      I5 => state(3),
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"006C"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      I3 => state(4),
      O => \FSM_sequential_state[2]_i_1_n_0\
    );
\FSM_sequential_state[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000078F0"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(3),
      I3 => state(0),
      I4 => state(4),
      O => \FSM_sequential_state[3]_i_1_n_0\
    );
\FSM_sequential_state[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"333033FF33FF33DD"
    )
        port map (
      I0 => busy,
      I1 => state(4),
      I2 => eos,
      I3 => \FSM_sequential_state[4]_i_3_n_0\,
      I4 => state(1),
      I5 => state(0),
      O => \FSM_sequential_state[4]_i_1_n_0\
    );
\FSM_sequential_state[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000057A0000000"
    )
        port map (
      I0 => state(1),
      I1 => drdy,
      I2 => state(0),
      I3 => state(2),
      I4 => state(3),
      I5 => state(4),
      O => \FSM_sequential_state[4]_i_2_n_0\
    );
\FSM_sequential_state[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => state(2),
      I1 => state(3),
      O => \FSM_sequential_state[4]_i_3_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \FSM_sequential_state[4]_i_1_n_0\,
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => state(0),
      R => rst
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \FSM_sequential_state[4]_i_1_n_0\,
      D => \FSM_sequential_state[1]_i_1_n_0\,
      Q => state(1),
      R => rst
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \FSM_sequential_state[4]_i_1_n_0\,
      D => \FSM_sequential_state[2]_i_1_n_0\,
      Q => state(2),
      R => rst
    );
\FSM_sequential_state_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \FSM_sequential_state[4]_i_1_n_0\,
      D => \FSM_sequential_state[3]_i_1_n_0\,
      Q => state(3),
      R => rst
    );
\FSM_sequential_state_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \FSM_sequential_state[4]_i_1_n_0\,
      D => \FSM_sequential_state[4]_i_2_n_0\,
      Q => state(4),
      R => rst
    );
\MEASURED_AUX0[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000020000000"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(3),
      I3 => drdy,
      I4 => \MEASURED_TEMP[15]_i_2_n_0\,
      I5 => rst,
      O => \MEASURED_AUX0[15]_i_1_n_0\
    );
\MEASURED_AUX0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(0),
      Q => aux_out_14(0),
      R => '0'
    );
\MEASURED_AUX0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(10),
      Q => aux_out_14(10),
      R => '0'
    );
\MEASURED_AUX0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(11),
      Q => aux_out_14(11),
      R => '0'
    );
\MEASURED_AUX0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(12),
      Q => aux_out_14(12),
      R => '0'
    );
\MEASURED_AUX0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(13),
      Q => aux_out_14(13),
      R => '0'
    );
\MEASURED_AUX0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(14),
      Q => aux_out_14(14),
      R => '0'
    );
\MEASURED_AUX0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(15),
      Q => aux_out_14(15),
      R => '0'
    );
\MEASURED_AUX0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(1),
      Q => aux_out_14(1),
      R => '0'
    );
\MEASURED_AUX0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(2),
      Q => aux_out_14(2),
      R => '0'
    );
\MEASURED_AUX0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(3),
      Q => aux_out_14(3),
      R => '0'
    );
\MEASURED_AUX0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(4),
      Q => aux_out_14(4),
      R => '0'
    );
\MEASURED_AUX0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(5),
      Q => aux_out_14(5),
      R => '0'
    );
\MEASURED_AUX0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(6),
      Q => aux_out_14(6),
      R => '0'
    );
\MEASURED_AUX0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(7),
      Q => aux_out_14(7),
      R => '0'
    );
\MEASURED_AUX0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(8),
      Q => aux_out_14(8),
      R => '0'
    );
\MEASURED_AUX0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX0[15]_i_1_n_0\,
      D => do_drp(9),
      Q => aux_out_14(9),
      R => '0'
    );
\MEASURED_AUX1[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(3),
      I3 => drdy,
      I4 => \MEASURED_TEMP[15]_i_2_n_0\,
      I5 => rst,
      O => \MEASURED_AUX1[15]_i_1_n_0\
    );
\MEASURED_AUX1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(0),
      Q => aux_out_15(0),
      R => '0'
    );
\MEASURED_AUX1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(10),
      Q => aux_out_15(10),
      R => '0'
    );
\MEASURED_AUX1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(11),
      Q => aux_out_15(11),
      R => '0'
    );
\MEASURED_AUX1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(12),
      Q => aux_out_15(12),
      R => '0'
    );
\MEASURED_AUX1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(13),
      Q => aux_out_15(13),
      R => '0'
    );
\MEASURED_AUX1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(14),
      Q => aux_out_15(14),
      R => '0'
    );
\MEASURED_AUX1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(15),
      Q => aux_out_15(15),
      R => '0'
    );
\MEASURED_AUX1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(1),
      Q => aux_out_15(1),
      R => '0'
    );
\MEASURED_AUX1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(2),
      Q => aux_out_15(2),
      R => '0'
    );
\MEASURED_AUX1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(3),
      Q => aux_out_15(3),
      R => '0'
    );
\MEASURED_AUX1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(4),
      Q => aux_out_15(4),
      R => '0'
    );
\MEASURED_AUX1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(5),
      Q => aux_out_15(5),
      R => '0'
    );
\MEASURED_AUX1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(6),
      Q => aux_out_15(6),
      R => '0'
    );
\MEASURED_AUX1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(7),
      Q => aux_out_15(7),
      R => '0'
    );
\MEASURED_AUX1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(8),
      Q => aux_out_15(8),
      R => '0'
    );
\MEASURED_AUX1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX1[15]_i_1_n_0\,
      D => do_drp(9),
      Q => aux_out_15(9),
      R => '0'
    );
\MEASURED_AUX2[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => state(4),
      I1 => \MEASURED_AUX2[15]_i_2_n_0\,
      I2 => drdy,
      I3 => state(0),
      I4 => rst,
      O => \MEASURED_AUX2[15]_i_1_n_0\
    );
\MEASURED_AUX2[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(1),
      O => \MEASURED_AUX2[15]_i_2_n_0\
    );
\MEASURED_AUX2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(0),
      Q => aux_out_6(0),
      R => '0'
    );
\MEASURED_AUX2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(10),
      Q => aux_out_6(10),
      R => '0'
    );
\MEASURED_AUX2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(11),
      Q => aux_out_6(11),
      R => '0'
    );
\MEASURED_AUX2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(12),
      Q => aux_out_6(12),
      R => '0'
    );
\MEASURED_AUX2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(13),
      Q => aux_out_6(13),
      R => '0'
    );
\MEASURED_AUX2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(14),
      Q => aux_out_6(14),
      R => '0'
    );
\MEASURED_AUX2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(15),
      Q => aux_out_6(15),
      R => '0'
    );
\MEASURED_AUX2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(1),
      Q => aux_out_6(1),
      R => '0'
    );
\MEASURED_AUX2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(2),
      Q => aux_out_6(2),
      R => '0'
    );
\MEASURED_AUX2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(3),
      Q => aux_out_6(3),
      R => '0'
    );
\MEASURED_AUX2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(4),
      Q => aux_out_6(4),
      R => '0'
    );
\MEASURED_AUX2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(5),
      Q => aux_out_6(5),
      R => '0'
    );
\MEASURED_AUX2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(6),
      Q => aux_out_6(6),
      R => '0'
    );
\MEASURED_AUX2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(7),
      Q => aux_out_6(7),
      R => '0'
    );
\MEASURED_AUX2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(8),
      Q => aux_out_6(8),
      R => '0'
    );
\MEASURED_AUX2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX2[15]_i_1_n_0\,
      D => do_drp(9),
      Q => aux_out_6(9),
      R => '0'
    );
\MEASURED_AUX3[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \MEASURED_AUX3[15]_i_2_n_0\,
      I1 => drdy,
      I2 => state(1),
      I3 => rst,
      O => \MEASURED_AUX3[15]_i_1_n_0\
    );
\MEASURED_AUX3[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => state(3),
      I3 => state(4),
      O => \MEASURED_AUX3[15]_i_2_n_0\
    );
\MEASURED_AUX3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(0),
      Q => aux_out_7(0),
      R => '0'
    );
\MEASURED_AUX3_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(10),
      Q => aux_out_7(10),
      R => '0'
    );
\MEASURED_AUX3_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(11),
      Q => aux_out_7(11),
      R => '0'
    );
\MEASURED_AUX3_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(12),
      Q => aux_out_7(12),
      R => '0'
    );
\MEASURED_AUX3_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(13),
      Q => aux_out_7(13),
      R => '0'
    );
\MEASURED_AUX3_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(14),
      Q => aux_out_7(14),
      R => '0'
    );
\MEASURED_AUX3_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(15),
      Q => aux_out_7(15),
      R => '0'
    );
\MEASURED_AUX3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(1),
      Q => aux_out_7(1),
      R => '0'
    );
\MEASURED_AUX3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(2),
      Q => aux_out_7(2),
      R => '0'
    );
\MEASURED_AUX3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(3),
      Q => aux_out_7(3),
      R => '0'
    );
\MEASURED_AUX3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(4),
      Q => aux_out_7(4),
      R => '0'
    );
\MEASURED_AUX3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(5),
      Q => aux_out_7(5),
      R => '0'
    );
\MEASURED_AUX3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(6),
      Q => aux_out_7(6),
      R => '0'
    );
\MEASURED_AUX3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(7),
      Q => aux_out_7(7),
      R => '0'
    );
\MEASURED_AUX3_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(8),
      Q => aux_out_7(8),
      R => '0'
    );
\MEASURED_AUX3_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_AUX3[15]_i_1_n_0\,
      D => do_drp(9),
      Q => aux_out_7(9),
      R => '0'
    );
\MEASURED_TEMP[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000002000000"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(3),
      I3 => drdy,
      I4 => \MEASURED_TEMP[15]_i_2_n_0\,
      I5 => rst,
      O => \MEASURED_TEMP[15]_i_1_n_0\
    );
\MEASURED_TEMP[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => state(0),
      I1 => state(4),
      O => \MEASURED_TEMP[15]_i_2_n_0\
    );
\MEASURED_TEMP_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(0),
      Q => temperature_out(0),
      R => '0'
    );
\MEASURED_TEMP_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(10),
      Q => temperature_out(10),
      R => '0'
    );
\MEASURED_TEMP_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(11),
      Q => temperature_out(11),
      R => '0'
    );
\MEASURED_TEMP_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(12),
      Q => temperature_out(12),
      R => '0'
    );
\MEASURED_TEMP_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(13),
      Q => temperature_out(13),
      R => '0'
    );
\MEASURED_TEMP_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(14),
      Q => temperature_out(14),
      R => '0'
    );
\MEASURED_TEMP_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(15),
      Q => temperature_out(15),
      R => '0'
    );
\MEASURED_TEMP_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(1),
      Q => temperature_out(1),
      R => '0'
    );
\MEASURED_TEMP_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(2),
      Q => temperature_out(2),
      R => '0'
    );
\MEASURED_TEMP_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(3),
      Q => temperature_out(3),
      R => '0'
    );
\MEASURED_TEMP_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(4),
      Q => temperature_out(4),
      R => '0'
    );
\MEASURED_TEMP_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(5),
      Q => temperature_out(5),
      R => '0'
    );
\MEASURED_TEMP_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(6),
      Q => temperature_out(6),
      R => '0'
    );
\MEASURED_TEMP_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(7),
      Q => temperature_out(7),
      R => '0'
    );
\MEASURED_TEMP_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(8),
      Q => temperature_out(8),
      R => '0'
    );
\MEASURED_TEMP_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \MEASURED_TEMP[15]_i_1_n_0\,
      D => do_drp(9),
      Q => temperature_out(9),
      R => '0'
    );
\daddr[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"010C"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(1),
      I3 => state(4),
      O => \daddr[0]_i_1_n_0\
    );
\daddr[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3006"
    )
        port map (
      I0 => state(3),
      I1 => state(4),
      I2 => state(1),
      I3 => state(2),
      O => \daddr[1]_i_1_n_0\
    );
\daddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01AA"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(1),
      I3 => state(4),
      O => \daddr[2]_i_1_n_0\
    );
\daddr[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01A8"
    )
        port map (
      I0 => state(3),
      I1 => state(2),
      I2 => state(1),
      I3 => state(4),
      O => \daddr[4]_i_1_n_0\
    );
\daddr[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF3E03"
    )
        port map (
      I0 => eos,
      I1 => \MEASURED_AUX2[15]_i_2_n_0\,
      I2 => state(4),
      I3 => state(0),
      I4 => MEASURED_AUX3,
      I5 => rst,
      O => \daddr[6]_i_1_n_0\
    );
\daddr[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(3),
      I3 => state(4),
      O => \daddr[6]_i_2_n_0\
    );
\daddr[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => state(1),
      I1 => drdy,
      I2 => state(4),
      I3 => state(3),
      I4 => state(2),
      I5 => state(0),
      O => MEASURED_AUX3
    );
\daddr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \daddr[6]_i_1_n_0\,
      D => \daddr[0]_i_1_n_0\,
      Q => \daddr_reg_n_0_[0]\,
      R => '0'
    );
\daddr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \daddr[6]_i_1_n_0\,
      D => \daddr[1]_i_1_n_0\,
      Q => \daddr_reg_n_0_[1]\,
      R => '0'
    );
\daddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \daddr[6]_i_1_n_0\,
      D => \daddr[2]_i_1_n_0\,
      Q => \daddr_reg_n_0_[2]\,
      R => '0'
    );
\daddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \daddr[6]_i_1_n_0\,
      D => \daddr[4]_i_1_n_0\,
      Q => \daddr_reg_n_0_[4]\,
      R => '0'
    );
\daddr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => \daddr[6]_i_1_n_0\,
      D => \daddr[6]_i_2_n_0\,
      Q => \daddr_reg_n_0_[6]\,
      R => '0'
    );
\den_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F88FFFF8F880000"
    )
        port map (
      I0 => p_0_in,
      I1 => \den_reg[0]_i_2_n_0\,
      I2 => \MEASURED_AUX2[15]_i_2_n_0\,
      I3 => \den_reg[0]_i_3_n_0\,
      I4 => den_reg,
      I5 => \den_reg_reg_n_0_[0]\,
      O => \den_reg[0]_i_1_n_0\
    );
\den_reg[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000333E"
    )
        port map (
      I0 => state(1),
      I1 => state(4),
      I2 => state(3),
      I3 => state(2),
      I4 => state(0),
      O => \den_reg[0]_i_2_n_0\
    );
\den_reg[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => state(4),
      I1 => state(0),
      I2 => eos,
      I3 => p_0_in,
      O => \den_reg[0]_i_3_n_0\
    );
\den_reg[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => p_0_in,
      I1 => den_reg,
      I2 => \den_reg[1]_i_3_n_0\,
      I3 => rst,
      O => \den_reg[1]_i_1_n_0\
    );
\den_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0003FFFF00055557"
    )
        port map (
      I0 => drdy,
      I1 => state(1),
      I2 => state(2),
      I3 => state(3),
      I4 => state(4),
      I5 => state(0),
      O => den_reg
    );
\den_reg[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0003FFFE00000003"
    )
        port map (
      I0 => eos,
      I1 => state(3),
      I2 => state(2),
      I3 => state(1),
      I4 => state(4),
      I5 => state(0),
      O => \den_reg[1]_i_3_n_0\
    );
\den_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => '1',
      D => \den_reg[0]_i_1_n_0\,
      Q => \den_reg_reg_n_0_[0]\,
      R => rst
    );
\den_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => '1',
      D => \den_reg[1]_i_1_n_0\,
      Q => p_0_in,
      R => '0'
    );
\di_drp[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => eos,
      I1 => state(0),
      I2 => state(4),
      I3 => state(1),
      I4 => state(2),
      I5 => state(3),
      O => di_drp
    );
\di_drp_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => di_drp,
      D => do_drp(0),
      Q => \di_drp_reg_n_0_[0]\,
      R => rst
    );
\di_drp_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => di_drp,
      D => do_drp(1),
      Q => \di_drp_reg_n_0_[1]\,
      R => rst
    );
\di_drp_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => di_drp,
      D => do_drp(2),
      Q => \di_drp_reg_n_0_[2]\,
      R => rst
    );
\di_drp_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => di_drp,
      D => do_drp(3),
      Q => \di_drp_reg_n_0_[3]\,
      R => rst
    );
\di_drp_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => di_drp,
      D => do_drp(4),
      Q => \di_drp_reg_n_0_[4]\,
      R => rst
    );
\di_drp_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => di_drp,
      D => do_drp(5),
      Q => \di_drp_reg_n_0_[5]\,
      R => rst
    );
\di_drp_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => di_drp,
      D => do_drp(6),
      Q => \di_drp_reg_n_0_[6]\,
      R => rst
    );
\di_drp_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => di_drp,
      D => do_drp(7),
      Q => \di_drp_reg_n_0_[7]\,
      R => rst
    );
\di_drp_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => di_drp,
      D => do_drp(8),
      Q => \di_drp_reg_n_0_[8]\,
      R => rst
    );
\di_drp_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => di_drp,
      D => do_drp(9),
      Q => \di_drp_reg_n_0_[9]\,
      R => rst
    );
\dwe_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \dwe_reg_reg_n_0_[0]\,
      I1 => dwe_reg,
      I2 => \dwe_reg[0]_i_2_n_0\,
      I3 => rst,
      O => \dwe_reg[0]_i_1_n_0\
    );
\dwe_reg[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00004444000CCCCC"
    )
        port map (
      I0 => eos,
      I1 => \dwe_reg_reg_n_0_[1]\,
      I2 => state(2),
      I3 => state(3),
      I4 => state(4),
      I5 => state(0),
      O => \dwe_reg[0]_i_2_n_0\
    );
\dwe_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000022222E22"
    )
        port map (
      I0 => \dwe_reg_reg_n_0_[1]\,
      I1 => dwe_reg,
      I2 => \MEASURED_AUX2[15]_i_2_n_0\,
      I3 => eos,
      I4 => state(4),
      I5 => rst,
      O => \dwe_reg[1]_i_1_n_0\
    );
\dwe_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010100035554"
    )
        port map (
      I0 => drdy,
      I1 => state(3),
      I2 => state(2),
      I3 => state(1),
      I4 => state(0),
      I5 => state(4),
      O => dwe_reg
    );
\dwe_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => '1',
      D => \dwe_reg[0]_i_1_n_0\,
      Q => \dwe_reg_reg_n_0_[0]\,
      R => '0'
    );
\dwe_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dclk_bufg,
      CE => '1',
      D => \dwe_reg[1]_i_1_n_0\,
      Q => \dwe_reg_reg_n_0_[1]\,
      R => '0'
    );
i_bufg: unisim.vcomponents.BUFG
     port map (
      I => clk100,
      O => dclk_bufg
    );
u_xadc: entity work.xadc_0_xadc_wiz_0
     port map (
      alarm_out => NLW_u_xadc_alarm_out_UNCONNECTED,
      busy_out => busy,
      channel_out(4 downto 0) => NLW_u_xadc_channel_out_UNCONNECTED(4 downto 0),
      daddr_in(6) => \daddr_reg_n_0_[6]\,
      daddr_in(5) => '0',
      daddr_in(4) => \daddr_reg_n_0_[4]\,
      daddr_in(3) => '0',
      daddr_in(2) => \daddr_reg_n_0_[2]\,
      daddr_in(1) => \daddr_reg_n_0_[1]\,
      daddr_in(0) => \daddr_reg_n_0_[0]\,
      dclk_in => dclk_bufg,
      den_in => \den_reg_reg_n_0_[0]\,
      di_in(15 downto 10) => B"000000",
      di_in(9) => \di_drp_reg_n_0_[9]\,
      di_in(8) => \di_drp_reg_n_0_[8]\,
      di_in(7) => \di_drp_reg_n_0_[7]\,
      di_in(6) => \di_drp_reg_n_0_[6]\,
      di_in(5) => \di_drp_reg_n_0_[5]\,
      di_in(4) => \di_drp_reg_n_0_[4]\,
      di_in(3) => \di_drp_reg_n_0_[3]\,
      di_in(2) => \di_drp_reg_n_0_[2]\,
      di_in(1) => \di_drp_reg_n_0_[1]\,
      di_in(0) => \di_drp_reg_n_0_[0]\,
      do_out(15 downto 0) => do_drp(15 downto 0),
      drdy_out => drdy,
      dwe_in => \dwe_reg_reg_n_0_[0]\,
      eoc_out => NLW_u_xadc_eoc_out_UNCONNECTED,
      eos_out => eos,
      ot_out => NLW_u_xadc_ot_out_UNCONNECTED,
      reset_in => rst,
      user_temp_alarm_out => NLW_u_xadc_user_temp_alarm_out_UNCONNECTED,
      vauxn14 => vauxn14,
      vauxn15 => vauxn15,
      vauxn6 => vauxn6,
      vauxn7 => vauxn7,
      vauxp14 => vauxp14,
      vauxp15 => vauxp15,
      vauxp6 => vauxp6,
      vauxp7 => vauxp7,
      vccaux_alarm_out => NLW_u_xadc_vccaux_alarm_out_UNCONNECTED,
      vccint_alarm_out => NLW_u_xadc_vccint_alarm_out_UNCONNECTED,
      vn_in => '0',
      vp_in => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xadc_0 is
  port (
    clk100 : in STD_LOGIC;
    rst : in STD_LOGIC;
    vauxp6 : in STD_LOGIC;
    vauxn6 : in STD_LOGIC;
    vauxp7 : in STD_LOGIC;
    vauxn7 : in STD_LOGIC;
    vauxp14 : in STD_LOGIC;
    vauxn14 : in STD_LOGIC;
    vauxp15 : in STD_LOGIC;
    vauxn15 : in STD_LOGIC;
    temperature_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_6 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_7 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_14 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    aux_out_15 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of xadc_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of xadc_0 : entity is "xadc_0,xadc,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of xadc_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of xadc_0 : entity is "xadc,Vivado 2014.4";
end xadc_0;

architecture STRUCTURE of xadc_0 is
begin
inst: entity work.xadc_0_xadc
     port map (
      aux_out_14(15 downto 0) => aux_out_14(15 downto 0),
      aux_out_15(15 downto 0) => aux_out_15(15 downto 0),
      aux_out_6(15 downto 0) => aux_out_6(15 downto 0),
      aux_out_7(15 downto 0) => aux_out_7(15 downto 0),
      clk100 => clk100,
      rst => rst,
      temperature_out(15 downto 0) => temperature_out(15 downto 0),
      vauxn14 => vauxn14,
      vauxn15 => vauxn15,
      vauxn6 => vauxn6,
      vauxn7 => vauxn7,
      vauxp14 => vauxp14,
      vauxp15 => vauxp15,
      vauxp6 => vauxp6,
      vauxp7 => vauxp7
    );
end STRUCTURE;
