-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Tue Nov 01 08:21:43 2016
-- Host        : XSHZHEHENGT30 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               e:/Github/xupsh/Basys3-Git/Projects_2016.2/2_Control_and_Measurement/Oscilloscope/Src/prj/Oscilloscope.srcs/sources_1/ip/debounce_0/debounce_0_sim_netlist.vhdl
-- Design      : debounce_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity debounce_0_debounce is
  port (
    o : out STD_LOGIC;
    i : in STD_LOGIC;
    clr : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of debounce_0_debounce : entity is "debounce";
end debounce_0_debounce;

architecture STRUCTURE of debounce_0_debounce is
  signal cclk : STD_LOGIC;
  signal cclk_i_1_n_0 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal delay1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal delay2 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal delay3 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt[4]_i_1\ : label is "soft_lutpair0";
begin
cclk_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clear,
      I1 => cclk,
      O => cclk_i_1_n_0
    );
cclk_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => cclk_i_1_n_0,
      Q => cclk,
      R => '0'
    );
\cnt0_inferred__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFEFEAAAAAAAA"
    )
        port map (
      I0 => \cnt_reg__0\(5),
      I1 => \cnt_reg__0\(2),
      I2 => \cnt_reg__0\(3),
      I3 => \cnt_reg__0\(1),
      I4 => \cnt_reg__0\(0),
      I5 => \cnt_reg__0\(4),
      O => clear
    );
\cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \cnt_reg__0\(0),
      O => p_0_in(0)
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \cnt_reg__0\(0),
      I1 => \cnt_reg__0\(1),
      O => p_0_in(1)
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \cnt_reg__0\(0),
      I1 => \cnt_reg__0\(1),
      I2 => \cnt_reg__0\(2),
      O => \cnt[2]_i_1_n_0\
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \cnt_reg__0\(1),
      I1 => \cnt_reg__0\(0),
      I2 => \cnt_reg__0\(2),
      I3 => \cnt_reg__0\(3),
      O => p_0_in(3)
    );
\cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \cnt_reg__0\(2),
      I1 => \cnt_reg__0\(0),
      I2 => \cnt_reg__0\(1),
      I3 => \cnt_reg__0\(3),
      I4 => \cnt_reg__0\(4),
      O => p_0_in(4)
    );
\cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \cnt_reg__0\(3),
      I1 => \cnt_reg__0\(1),
      I2 => \cnt_reg__0\(0),
      I3 => \cnt_reg__0\(2),
      I4 => \cnt_reg__0\(4),
      I5 => \cnt_reg__0\(5),
      O => p_0_in(5)
    );
\cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(0),
      Q => \cnt_reg__0\(0),
      R => clear
    );
\cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(1),
      Q => \cnt_reg__0\(1),
      R => clear
    );
\cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \cnt[2]_i_1_n_0\,
      Q => \cnt_reg__0\(2),
      R => clear
    );
\cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(3),
      Q => \cnt_reg__0\(3),
      R => clear
    );
\cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(4),
      Q => \cnt_reg__0\(4),
      R => clear
    );
\cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => p_0_in(5),
      Q => \cnt_reg__0\(5),
      R => clear
    );
\delay1_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => cclk,
      CE => '1',
      CLR => clr,
      D => i,
      Q => delay1(0)
    );
\delay2_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => cclk,
      CE => '1',
      CLR => clr,
      D => delay1(0),
      Q => delay2(0)
    );
\delay3_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => cclk,
      CE => '1',
      CLR => clr,
      D => delay2(0),
      Q => delay3(0)
    );
\o__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => delay3(0),
      I1 => delay1(0),
      I2 => delay2(0),
      O => o
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity debounce_0 is
  port (
    clk : in STD_LOGIC;
    clr : in STD_LOGIC;
    i : in STD_LOGIC;
    o : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of debounce_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of debounce_0 : entity is "debounce_0,debounce,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of debounce_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of debounce_0 : entity is "debounce,Vivado 2016.2";
end debounce_0;

architecture STRUCTURE of debounce_0 is
begin
inst: entity work.debounce_0_debounce
     port map (
      clk => clk,
      clr => clr,
      i => i,
      o => o
    );
end STRUCTURE;
