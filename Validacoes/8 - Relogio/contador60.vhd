LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY contador60_relogio IS
   PORT (
      clock   : IN STD_LOGIC;
      reset   : IN STD_LOGIC;
      enable  : IN STD_LOGIC;
      rci     : IN STD_LOGIC;
      unidade : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      dezena  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      rco     : OUT STD_LOGIC);
END contador60_relogio;

ARCHITECTURE contador60_relogio_arch OF contador60_relogio IS
   -- inserir sinais e componentes aqui 
   COMPONENT contador10_relogio
      PORT (
         clock  : IN STD_LOGIC;
         reset  : IN STD_LOGIC;
         enable : IN STD_LOGIC;
         rci    : IN STD_LOGIC;
         load   : IN STD_LOGIC;
         D      : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         Q      : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         rco    : OUT STD_LOGIC);
   END COMPONENT;

   COMPONENT contador6_relogio
      PORT (
         clock  : IN STD_LOGIC;
         reset  : IN STD_LOGIC;
         enable : IN STD_LOGIC;
         rci    : IN STD_LOGIC;
         load   : IN STD_LOGIC;
         D      : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         Q      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         rco    : OUT STD_LOGIC);
   END COMPONENT;

   SIGNAL x_Q_O_UNI                       : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL x_Q_O_DEZ                       : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL x_RCO_UNI, x_RCI_DEZ, x_RCO_DEZ : STD_LOGIC;

BEGIN

   contador_unidade_inst : contador10_relogio
   PORT MAP(
      clock  => clock,
      reset  => reset,
      enable => enable,
      rci    => rci,
      load   => '0',
      D      => "0000",
      Q      => x_Q_O_UNI,
      rco    => x_RCO_UNI
   );

   x_RCI_DEZ <= x_RCO_UNI OR rci;

   contador_dezena_inst : contador6_relogio
   PORT MAP(
      clock  => clock,
      reset  => reset,
      enable => enable,
      rci    => x_RCI_DEZ,
      load   => '0',
      D      => "000",
      Q      => x_Q_O_DEZ,
      rco    => x_RCO_DEZ
   );

   unidade <= x_Q_O_UNI;
   dezena  <= x_Q_O_DEZ;
   rco     <= x_RCO_DEZ OR x_RCO_UNI;
END contador60_relogio_arch;
