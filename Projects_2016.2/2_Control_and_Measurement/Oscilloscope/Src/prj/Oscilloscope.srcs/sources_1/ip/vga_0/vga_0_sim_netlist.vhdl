-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Tue Nov 01 08:26:02 2016
-- Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               e:/Github/xupsh/Basys3-Git/Projects_2016.2/2_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/vga_0/vga_0_sim_netlist.vhdl
-- Design      : vga_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity vga_0_vga is
  port (
    vga_hsync : out STD_LOGIC;
    vga_vsync : out STD_LOGIC;
    vga_h_cnt : out STD_LOGIC_VECTOR ( 9 downto 0 );
    vga_valid : out STD_LOGIC;
    vga_v_cnt : out STD_LOGIC_VECTOR ( 8 downto 0 );
    vga_pclk : in STD_LOGIC;
    vga_rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of vga_0_vga : entity is "vga";
end vga_0_vga;

architecture STRUCTURE of vga_0_vga is
  signal hsync_i_2_n_0 : STD_LOGIC;
  signal line_cnt : STD_LOGIC;
  signal \line_cnt[2]_i_2_n_0\ : STD_LOGIC;
  signal \line_cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal \line_cnt[6]_i_2_n_0\ : STD_LOGIC;
  signal \line_cnt[7]_i_1_n_0\ : STD_LOGIC;
  signal \line_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \line_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \line_cnt[9]_i_3_n_0\ : STD_LOGIC;
  signal \line_cnt[9]_i_4_n_0\ : STD_LOGIC;
  signal \line_cnt[9]_i_5_n_0\ : STD_LOGIC;
  signal \line_cnt[9]_i_6_n_0\ : STD_LOGIC;
  signal \line_cnt_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC;
  signal \pixel_cnt[0]_i_2_n_0\ : STD_LOGIC;
  signal \pixel_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \pixel_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \pixel_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \pixel_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \pixel_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \pixel_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \pixel_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \pixel_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \pixel_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \pixel_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal pixel_cnt_reg : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \pixel_cnt_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \pixel_cnt_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \pixel_cnt_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \pixel_cnt_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \pixel_cnt_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \pixel_cnt_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \pixel_cnt_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \pixel_cnt_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \pixel_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \pixel_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \pixel_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \pixel_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \pixel_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \pixel_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \pixel_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \pixel_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \pixel_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \pixel_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \pixel_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \pixel_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal vga_valid_INST_0_i_1_n_0 : STD_LOGIC;
  signal vsync_i_1_n_0 : STD_LOGIC;
  signal vsync_i_2_n_0 : STD_LOGIC;
  signal vsync_i_3_n_0 : STD_LOGIC;
  signal \NLW_pixel_cnt_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_pixel_cnt_reg[8]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \line_cnt[3]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \line_cnt[6]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \line_cnt[9]_i_5\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \line_cnt[9]_i_6\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \vga_h_cnt[0]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \vga_h_cnt[1]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \vga_h_cnt[5]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \vga_h_cnt[6]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \vga_h_cnt[7]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \vga_h_cnt[8]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \vga_h_cnt[9]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \vga_v_cnt[5]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \vga_v_cnt[6]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \vga_v_cnt[7]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \vga_v_cnt[8]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of vga_valid_INST_0_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of vsync_i_2 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of vsync_i_3 : label is "soft_lutpair7";
begin
hsync_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EBBBBBBBBBBBBBBB"
    )
        port map (
      I0 => hsync_i_2_n_0,
      I1 => pixel_cnt_reg(4),
      I2 => pixel_cnt_reg(3),
      I3 => pixel_cnt_reg(2),
      I4 => pixel_cnt_reg(1),
      I5 => pixel_cnt_reg(0),
      O => \p_0_in__0\
    );
hsync_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBFFFFFFFFFFFF"
    )
        port map (
      I0 => pixel_cnt_reg(8),
      I1 => pixel_cnt_reg(5),
      I2 => pixel_cnt_reg(6),
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(9),
      I5 => pixel_cnt_reg(7),
      O => hsync_i_2_n_0
    );
hsync_reg: unisim.vcomponents.FDPE
     port map (
      C => vga_pclk,
      CE => '1',
      D => \p_0_in__0\,
      PRE => vga_rst,
      Q => vga_hsync
    );
\line_cnt[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055555557"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => \line_cnt_reg__0\(8),
      I2 => \line_cnt_reg__0\(5),
      I3 => \line_cnt_reg__0\(7),
      I4 => vsync_i_2_n_0,
      I5 => \line_cnt_reg__0\(0),
      O => p_0_in(0)
    );
\line_cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"005D5D00"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => vsync_i_3_n_0,
      I2 => vsync_i_2_n_0,
      I3 => \line_cnt_reg__0\(0),
      I4 => \line_cnt_reg__0\(1),
      O => p_0_in(1)
    );
\line_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055555557"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => \line_cnt_reg__0\(8),
      I2 => \line_cnt_reg__0\(5),
      I3 => \line_cnt_reg__0\(7),
      I4 => vsync_i_2_n_0,
      I5 => \line_cnt[2]_i_2_n_0\,
      O => p_0_in(2)
    );
\line_cnt[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"95"
    )
        port map (
      I0 => \line_cnt_reg__0\(2),
      I1 => \line_cnt_reg__0\(0),
      I2 => \line_cnt_reg__0\(1),
      O => \line_cnt[2]_i_2_n_0\
    );
\line_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055555557"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => \line_cnt_reg__0\(8),
      I2 => \line_cnt_reg__0\(5),
      I3 => \line_cnt_reg__0\(7),
      I4 => vsync_i_2_n_0,
      I5 => \line_cnt[3]_i_2_n_0\,
      O => p_0_in(3)
    );
\line_cnt[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9555"
    )
        port map (
      I0 => \line_cnt_reg__0\(3),
      I1 => \line_cnt_reg__0\(2),
      I2 => \line_cnt_reg__0\(1),
      I3 => \line_cnt_reg__0\(0),
      O => \line_cnt[3]_i_2_n_0\
    );
\line_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F070008"
    )
        port map (
      I0 => \line_cnt_reg__0\(1),
      I1 => \line_cnt_reg__0\(0),
      I2 => \line_cnt_reg__0\(9),
      I3 => \line_cnt[6]_i_2_n_0\,
      I4 => \line_cnt_reg__0\(4),
      O => p_0_in(4)
    );
\line_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555000000005557"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => \line_cnt_reg__0\(8),
      I2 => \line_cnt_reg__0\(7),
      I3 => vsync_i_2_n_0,
      I4 => \line_cnt[9]_i_6_n_0\,
      I5 => \line_cnt_reg__0\(5),
      O => p_0_in(5)
    );
\line_cnt[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000055555D550000"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => vsync_i_3_n_0,
      I2 => \line_cnt_reg__0\(4),
      I3 => \line_cnt[6]_i_2_n_0\,
      I4 => \line_cnt[8]_i_3_n_0\,
      I5 => \line_cnt_reg__0\(6),
      O => p_0_in(6)
    );
\line_cnt[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \line_cnt_reg__0\(2),
      I1 => \line_cnt_reg__0\(3),
      O => \line_cnt[6]_i_2_n_0\
    );
\line_cnt[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0078007878780078"
    )
        port map (
      I0 => \line_cnt[8]_i_3_n_0\,
      I1 => \line_cnt_reg__0\(6),
      I2 => \line_cnt_reg__0\(7),
      I3 => \line_cnt_reg__0\(9),
      I4 => vsync_i_3_n_0,
      I5 => vsync_i_2_n_0,
      O => \line_cnt[7]_i_1_n_0\
    );
\line_cnt[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5D005D5D005D0000"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => vsync_i_3_n_0,
      I2 => vsync_i_2_n_0,
      I3 => \line_cnt[8]_i_2_n_0\,
      I4 => \line_cnt[8]_i_3_n_0\,
      I5 => \line_cnt_reg__0\(8),
      O => p_0_in(8)
    );
\line_cnt[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \line_cnt_reg__0\(6),
      I1 => \line_cnt_reg__0\(7),
      O => \line_cnt[8]_i_2_n_0\
    );
\line_cnt[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \line_cnt_reg__0\(5),
      I1 => \line_cnt_reg__0\(4),
      I2 => \line_cnt_reg__0\(3),
      I3 => \line_cnt_reg__0\(2),
      I4 => \line_cnt_reg__0\(0),
      I5 => \line_cnt_reg__0\(1),
      O => \line_cnt[8]_i_3_n_0\
    );
\line_cnt[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \line_cnt[9]_i_3_n_0\,
      I1 => \line_cnt[9]_i_4_n_0\,
      I2 => pixel_cnt_reg(9),
      I3 => pixel_cnt_reg(8),
      O => line_cnt
    );
\line_cnt[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"222200F0"
    )
        port map (
      I0 => vsync_i_3_n_0,
      I1 => vsync_i_2_n_0,
      I2 => \line_cnt[9]_i_5_n_0\,
      I3 => \line_cnt[9]_i_6_n_0\,
      I4 => \line_cnt_reg__0\(9),
      O => p_0_in(9)
    );
\line_cnt[9]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => pixel_cnt_reg(10),
      I1 => pixel_cnt_reg(7),
      I2 => pixel_cnt_reg(5),
      I3 => pixel_cnt_reg(6),
      O => \line_cnt[9]_i_3_n_0\
    );
\line_cnt[9]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => pixel_cnt_reg(4),
      I1 => pixel_cnt_reg(3),
      I2 => pixel_cnt_reg(2),
      I3 => pixel_cnt_reg(1),
      I4 => pixel_cnt_reg(0),
      O => \line_cnt[9]_i_4_n_0\
    );
\line_cnt[9]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \line_cnt_reg__0\(8),
      I1 => \line_cnt_reg__0\(7),
      I2 => \line_cnt_reg__0\(6),
      I3 => \line_cnt_reg__0\(5),
      O => \line_cnt[9]_i_5_n_0\
    );
\line_cnt[9]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \line_cnt_reg__0\(1),
      I1 => \line_cnt_reg__0\(0),
      I2 => \line_cnt_reg__0\(2),
      I3 => \line_cnt_reg__0\(3),
      I4 => \line_cnt_reg__0\(4),
      O => \line_cnt[9]_i_6_n_0\
    );
\line_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => line_cnt,
      CLR => vga_rst,
      D => p_0_in(0),
      Q => \line_cnt_reg__0\(0)
    );
\line_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => line_cnt,
      CLR => vga_rst,
      D => p_0_in(1),
      Q => \line_cnt_reg__0\(1)
    );
\line_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => line_cnt,
      CLR => vga_rst,
      D => p_0_in(2),
      Q => \line_cnt_reg__0\(2)
    );
\line_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => line_cnt,
      CLR => vga_rst,
      D => p_0_in(3),
      Q => \line_cnt_reg__0\(3)
    );
\line_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => line_cnt,
      CLR => vga_rst,
      D => p_0_in(4),
      Q => \line_cnt_reg__0\(4)
    );
\line_cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => line_cnt,
      CLR => vga_rst,
      D => p_0_in(5),
      Q => \line_cnt_reg__0\(5)
    );
\line_cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => line_cnt,
      CLR => vga_rst,
      D => p_0_in(6),
      Q => \line_cnt_reg__0\(6)
    );
\line_cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => line_cnt,
      CLR => vga_rst,
      D => \line_cnt[7]_i_1_n_0\,
      Q => \line_cnt_reg__0\(7)
    );
\line_cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => line_cnt,
      CLR => vga_rst,
      D => p_0_in(8),
      Q => \line_cnt_reg__0\(8)
    );
\line_cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => line_cnt,
      CLR => vga_rst,
      D => p_0_in(9),
      Q => \line_cnt_reg__0\(9)
    );
\pixel_cnt[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080808AA08AA08AA"
    )
        port map (
      I0 => pixel_cnt_reg(0),
      I1 => \line_cnt[9]_i_3_n_0\,
      I2 => \line_cnt[9]_i_4_n_0\,
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      I5 => pixel_cnt_reg(9),
      O => \pixel_cnt[0]_i_2_n_0\
    );
\pixel_cnt[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080808AA08AA08AA"
    )
        port map (
      I0 => pixel_cnt_reg(3),
      I1 => \line_cnt[9]_i_3_n_0\,
      I2 => \line_cnt[9]_i_4_n_0\,
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      I5 => pixel_cnt_reg(9),
      O => \pixel_cnt[0]_i_3_n_0\
    );
\pixel_cnt[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080808AA08AA08AA"
    )
        port map (
      I0 => pixel_cnt_reg(2),
      I1 => \line_cnt[9]_i_3_n_0\,
      I2 => \line_cnt[9]_i_4_n_0\,
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      I5 => pixel_cnt_reg(9),
      O => \pixel_cnt[0]_i_4_n_0\
    );
\pixel_cnt[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080808AA08AA08AA"
    )
        port map (
      I0 => pixel_cnt_reg(1),
      I1 => \line_cnt[9]_i_3_n_0\,
      I2 => \line_cnt[9]_i_4_n_0\,
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      I5 => pixel_cnt_reg(9),
      O => \pixel_cnt[0]_i_5_n_0\
    );
\pixel_cnt[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0404045504550455"
    )
        port map (
      I0 => pixel_cnt_reg(0),
      I1 => \line_cnt[9]_i_3_n_0\,
      I2 => \line_cnt[9]_i_4_n_0\,
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      I5 => pixel_cnt_reg(9),
      O => \pixel_cnt[0]_i_6_n_0\
    );
\pixel_cnt[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080808AA08AA08AA"
    )
        port map (
      I0 => pixel_cnt_reg(7),
      I1 => \line_cnt[9]_i_3_n_0\,
      I2 => \line_cnt[9]_i_4_n_0\,
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      I5 => pixel_cnt_reg(9),
      O => \pixel_cnt[4]_i_2_n_0\
    );
\pixel_cnt[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080808AA08AA08AA"
    )
        port map (
      I0 => pixel_cnt_reg(6),
      I1 => \line_cnt[9]_i_3_n_0\,
      I2 => \line_cnt[9]_i_4_n_0\,
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      I5 => pixel_cnt_reg(9),
      O => \pixel_cnt[4]_i_3_n_0\
    );
\pixel_cnt[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080808AA08AA08AA"
    )
        port map (
      I0 => pixel_cnt_reg(5),
      I1 => \line_cnt[9]_i_3_n_0\,
      I2 => \line_cnt[9]_i_4_n_0\,
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      I5 => pixel_cnt_reg(9),
      O => \pixel_cnt[4]_i_4_n_0\
    );
\pixel_cnt[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080808AA08AA08AA"
    )
        port map (
      I0 => pixel_cnt_reg(4),
      I1 => \line_cnt[9]_i_3_n_0\,
      I2 => \line_cnt[9]_i_4_n_0\,
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      I5 => pixel_cnt_reg(9),
      O => \pixel_cnt[4]_i_5_n_0\
    );
\pixel_cnt[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"222F0000"
    )
        port map (
      I0 => \line_cnt[9]_i_3_n_0\,
      I1 => \line_cnt[9]_i_4_n_0\,
      I2 => pixel_cnt_reg(10),
      I3 => pixel_cnt_reg(8),
      I4 => pixel_cnt_reg(9),
      O => \pixel_cnt[8]_i_2_n_0\
    );
\pixel_cnt[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22002F00"
    )
        port map (
      I0 => \line_cnt[9]_i_3_n_0\,
      I1 => \line_cnt[9]_i_4_n_0\,
      I2 => pixel_cnt_reg(10),
      I3 => pixel_cnt_reg(8),
      I4 => pixel_cnt_reg(9),
      O => \pixel_cnt[8]_i_3_n_0\
    );
\pixel_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => '1',
      CLR => vga_rst,
      D => \pixel_cnt_reg[0]_i_1_n_7\,
      Q => pixel_cnt_reg(0)
    );
\pixel_cnt_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \pixel_cnt_reg[0]_i_1_n_0\,
      CO(2) => \pixel_cnt_reg[0]_i_1_n_1\,
      CO(1) => \pixel_cnt_reg[0]_i_1_n_2\,
      CO(0) => \pixel_cnt_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \pixel_cnt[0]_i_2_n_0\,
      O(3) => \pixel_cnt_reg[0]_i_1_n_4\,
      O(2) => \pixel_cnt_reg[0]_i_1_n_5\,
      O(1) => \pixel_cnt_reg[0]_i_1_n_6\,
      O(0) => \pixel_cnt_reg[0]_i_1_n_7\,
      S(3) => \pixel_cnt[0]_i_3_n_0\,
      S(2) => \pixel_cnt[0]_i_4_n_0\,
      S(1) => \pixel_cnt[0]_i_5_n_0\,
      S(0) => \pixel_cnt[0]_i_6_n_0\
    );
\pixel_cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => '1',
      CLR => vga_rst,
      D => \pixel_cnt_reg[8]_i_1_n_1\,
      Q => pixel_cnt_reg(10)
    );
\pixel_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => '1',
      CLR => vga_rst,
      D => \pixel_cnt_reg[0]_i_1_n_6\,
      Q => pixel_cnt_reg(1)
    );
\pixel_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => '1',
      CLR => vga_rst,
      D => \pixel_cnt_reg[0]_i_1_n_5\,
      Q => pixel_cnt_reg(2)
    );
\pixel_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => '1',
      CLR => vga_rst,
      D => \pixel_cnt_reg[0]_i_1_n_4\,
      Q => pixel_cnt_reg(3)
    );
\pixel_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => '1',
      CLR => vga_rst,
      D => \pixel_cnt_reg[4]_i_1_n_7\,
      Q => pixel_cnt_reg(4)
    );
\pixel_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pixel_cnt_reg[0]_i_1_n_0\,
      CO(3) => \pixel_cnt_reg[4]_i_1_n_0\,
      CO(2) => \pixel_cnt_reg[4]_i_1_n_1\,
      CO(1) => \pixel_cnt_reg[4]_i_1_n_2\,
      CO(0) => \pixel_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pixel_cnt_reg[4]_i_1_n_4\,
      O(2) => \pixel_cnt_reg[4]_i_1_n_5\,
      O(1) => \pixel_cnt_reg[4]_i_1_n_6\,
      O(0) => \pixel_cnt_reg[4]_i_1_n_7\,
      S(3) => \pixel_cnt[4]_i_2_n_0\,
      S(2) => \pixel_cnt[4]_i_3_n_0\,
      S(1) => \pixel_cnt[4]_i_4_n_0\,
      S(0) => \pixel_cnt[4]_i_5_n_0\
    );
\pixel_cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => '1',
      CLR => vga_rst,
      D => \pixel_cnt_reg[4]_i_1_n_6\,
      Q => pixel_cnt_reg(5)
    );
\pixel_cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => '1',
      CLR => vga_rst,
      D => \pixel_cnt_reg[4]_i_1_n_5\,
      Q => pixel_cnt_reg(6)
    );
\pixel_cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => '1',
      CLR => vga_rst,
      D => \pixel_cnt_reg[4]_i_1_n_4\,
      Q => pixel_cnt_reg(7)
    );
\pixel_cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => '1',
      CLR => vga_rst,
      D => \pixel_cnt_reg[8]_i_1_n_7\,
      Q => pixel_cnt_reg(8)
    );
\pixel_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pixel_cnt_reg[4]_i_1_n_0\,
      CO(3) => \NLW_pixel_cnt_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pixel_cnt_reg[8]_i_1_n_1\,
      CO(1) => \NLW_pixel_cnt_reg[8]_i_1_CO_UNCONNECTED\(1),
      CO(0) => \pixel_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_pixel_cnt_reg[8]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \pixel_cnt_reg[8]_i_1_n_6\,
      O(0) => \pixel_cnt_reg[8]_i_1_n_7\,
      S(3 downto 2) => B"01",
      S(1) => \pixel_cnt[8]_i_2_n_0\,
      S(0) => \pixel_cnt[8]_i_3_n_0\
    );
\pixel_cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => vga_pclk,
      CE => '1',
      CLR => vga_rst,
      D => \pixel_cnt_reg[8]_i_1_n_6\,
      Q => pixel_cnt_reg(9)
    );
\vga_h_cnt[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0022002A"
    )
        port map (
      I0 => pixel_cnt_reg(0),
      I1 => pixel_cnt_reg(9),
      I2 => pixel_cnt_reg(7),
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      O => vga_h_cnt(0)
    );
\vga_h_cnt[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0022002A"
    )
        port map (
      I0 => pixel_cnt_reg(1),
      I1 => pixel_cnt_reg(9),
      I2 => pixel_cnt_reg(7),
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      O => vga_h_cnt(1)
    );
\vga_h_cnt[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0022002A"
    )
        port map (
      I0 => pixel_cnt_reg(2),
      I1 => pixel_cnt_reg(9),
      I2 => pixel_cnt_reg(7),
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      O => vga_h_cnt(2)
    );
\vga_h_cnt[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0022002A"
    )
        port map (
      I0 => pixel_cnt_reg(3),
      I1 => pixel_cnt_reg(9),
      I2 => pixel_cnt_reg(7),
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      O => vga_h_cnt(3)
    );
\vga_h_cnt[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0022002A"
    )
        port map (
      I0 => pixel_cnt_reg(4),
      I1 => pixel_cnt_reg(9),
      I2 => pixel_cnt_reg(7),
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      O => vga_h_cnt(4)
    );
\vga_h_cnt[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0022002A"
    )
        port map (
      I0 => pixel_cnt_reg(5),
      I1 => pixel_cnt_reg(9),
      I2 => pixel_cnt_reg(7),
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      O => vga_h_cnt(5)
    );
\vga_h_cnt[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0022002A"
    )
        port map (
      I0 => pixel_cnt_reg(6),
      I1 => pixel_cnt_reg(9),
      I2 => pixel_cnt_reg(7),
      I3 => pixel_cnt_reg(10),
      I4 => pixel_cnt_reg(8),
      O => vga_h_cnt(6)
    );
\vga_h_cnt[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => pixel_cnt_reg(9),
      I1 => pixel_cnt_reg(7),
      I2 => pixel_cnt_reg(10),
      O => vga_h_cnt(7)
    );
\vga_h_cnt[8]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => pixel_cnt_reg(9),
      I1 => pixel_cnt_reg(10),
      I2 => pixel_cnt_reg(8),
      O => vga_h_cnt(8)
    );
\vga_h_cnt[9]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => pixel_cnt_reg(9),
      I1 => pixel_cnt_reg(7),
      I2 => pixel_cnt_reg(10),
      I3 => pixel_cnt_reg(8),
      O => vga_h_cnt(9)
    );
\vga_v_cnt[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0222222222222222"
    )
        port map (
      I0 => \line_cnt_reg__0\(0),
      I1 => \line_cnt_reg__0\(9),
      I2 => \line_cnt_reg__0\(8),
      I3 => \line_cnt_reg__0\(7),
      I4 => \line_cnt_reg__0\(6),
      I5 => \line_cnt_reg__0\(5),
      O => vga_v_cnt(0)
    );
\vga_v_cnt[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0222222222222222"
    )
        port map (
      I0 => \line_cnt_reg__0\(1),
      I1 => \line_cnt_reg__0\(9),
      I2 => \line_cnt_reg__0\(8),
      I3 => \line_cnt_reg__0\(7),
      I4 => \line_cnt_reg__0\(6),
      I5 => \line_cnt_reg__0\(5),
      O => vga_v_cnt(1)
    );
\vga_v_cnt[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0222222222222222"
    )
        port map (
      I0 => \line_cnt_reg__0\(2),
      I1 => \line_cnt_reg__0\(9),
      I2 => \line_cnt_reg__0\(8),
      I3 => \line_cnt_reg__0\(7),
      I4 => \line_cnt_reg__0\(6),
      I5 => \line_cnt_reg__0\(5),
      O => vga_v_cnt(2)
    );
\vga_v_cnt[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0222222222222222"
    )
        port map (
      I0 => \line_cnt_reg__0\(3),
      I1 => \line_cnt_reg__0\(9),
      I2 => \line_cnt_reg__0\(8),
      I3 => \line_cnt_reg__0\(7),
      I4 => \line_cnt_reg__0\(6),
      I5 => \line_cnt_reg__0\(5),
      O => vga_v_cnt(3)
    );
\vga_v_cnt[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0222222222222222"
    )
        port map (
      I0 => \line_cnt_reg__0\(4),
      I1 => \line_cnt_reg__0\(9),
      I2 => \line_cnt_reg__0\(8),
      I3 => \line_cnt_reg__0\(7),
      I4 => \line_cnt_reg__0\(6),
      I5 => \line_cnt_reg__0\(5),
      O => vga_v_cnt(4)
    );
\vga_v_cnt[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"15550000"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => \line_cnt_reg__0\(8),
      I2 => \line_cnt_reg__0\(7),
      I3 => \line_cnt_reg__0\(6),
      I4 => \line_cnt_reg__0\(5),
      O => vga_v_cnt(5)
    );
\vga_v_cnt[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"15005500"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => \line_cnt_reg__0\(8),
      I2 => \line_cnt_reg__0\(7),
      I3 => \line_cnt_reg__0\(6),
      I4 => \line_cnt_reg__0\(5),
      O => vga_v_cnt(6)
    );
\vga_v_cnt[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10505050"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => \line_cnt_reg__0\(8),
      I2 => \line_cnt_reg__0\(7),
      I3 => \line_cnt_reg__0\(6),
      I4 => \line_cnt_reg__0\(5),
      O => vga_v_cnt(7)
    );
\vga_v_cnt[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04444444"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => \line_cnt_reg__0\(8),
      I2 => \line_cnt_reg__0\(7),
      I3 => \line_cnt_reg__0\(6),
      I4 => \line_cnt_reg__0\(5),
      O => vga_v_cnt(8)
    );
vga_valid_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000015555555"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => \line_cnt_reg__0\(8),
      I2 => \line_cnt_reg__0\(7),
      I3 => \line_cnt_reg__0\(6),
      I4 => \line_cnt_reg__0\(5),
      I5 => vga_valid_INST_0_i_1_n_0,
      O => vga_valid
    );
vga_valid_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FECC"
    )
        port map (
      I0 => pixel_cnt_reg(8),
      I1 => pixel_cnt_reg(10),
      I2 => pixel_cnt_reg(7),
      I3 => pixel_cnt_reg(9),
      O => vga_valid_INST_0_i_1_n_0
    );
vsync_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD5FFFF"
    )
        port map (
      I0 => \line_cnt_reg__0\(9),
      I1 => \line_cnt_reg__0\(1),
      I2 => \line_cnt_reg__0\(3),
      I3 => vsync_i_2_n_0,
      I4 => vsync_i_3_n_0,
      O => vsync_i_1_n_0
    );
vsync_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF8"
    )
        port map (
      I0 => \line_cnt_reg__0\(3),
      I1 => \line_cnt_reg__0\(2),
      I2 => \line_cnt_reg__0\(6),
      I3 => \line_cnt_reg__0\(4),
      O => vsync_i_2_n_0
    );
vsync_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \line_cnt_reg__0\(7),
      I1 => \line_cnt_reg__0\(5),
      I2 => \line_cnt_reg__0\(8),
      O => vsync_i_3_n_0
    );
vsync_reg: unisim.vcomponents.FDPE
     port map (
      C => vga_pclk,
      CE => '1',
      D => vsync_i_1_n_0,
      PRE => vga_rst,
      Q => vga_vsync
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity vga_0 is
  port (
    vga_pclk : in STD_LOGIC;
    vga_rst : in STD_LOGIC;
    vga_hsync : out STD_LOGIC;
    vga_vsync : out STD_LOGIC;
    vga_valid : out STD_LOGIC;
    vga_h_cnt : out STD_LOGIC_VECTOR ( 11 downto 0 );
    vga_v_cnt : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of vga_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of vga_0 : entity is "vga_0,vga,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of vga_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of vga_0 : entity is "vga,Vivado 2016.2";
end vga_0;

architecture STRUCTURE of vga_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^vga_h_cnt\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^vga_v_cnt\ : STD_LOGIC_VECTOR ( 8 downto 0 );
begin
  vga_h_cnt(11) <= \<const0>\;
  vga_h_cnt(10) <= \<const0>\;
  vga_h_cnt(9 downto 0) <= \^vga_h_cnt\(9 downto 0);
  vga_v_cnt(10) <= \<const0>\;
  vga_v_cnt(9) <= \<const0>\;
  vga_v_cnt(8 downto 0) <= \^vga_v_cnt\(8 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.vga_0_vga
     port map (
      vga_h_cnt(9 downto 0) => \^vga_h_cnt\(9 downto 0),
      vga_hsync => vga_hsync,
      vga_pclk => vga_pclk,
      vga_rst => vga_rst,
      vga_v_cnt(8 downto 0) => \^vga_v_cnt\(8 downto 0),
      vga_valid => vga_valid,
      vga_vsync => vga_vsync
    );
end STRUCTURE;
