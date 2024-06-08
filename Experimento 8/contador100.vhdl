LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY contador100 IS
  PORT (
    clock   : IN STD_LOGIC;
    reset   : IN STD_LOGIC;
    enable  : IN STD_LOGIC;
    load    : IN STD_LOGIC;
    dezload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    uniload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    dezena  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    unidade : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END contador100;

ARCHITECTURE contador100_arch OF contador100 IS
  -- inserir sinais e componentes aqui 
  COMPONENT contador10 IS
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

  SIGNAL x_RCI_O_UNI          : STD_LOGIC;
  SIGNAL x_Q_O_UNI, x_Q_O_DEZ : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
  -- inserir implementacao aqui 
  contador_10_uni : contador10 PORT MAP(
    clock  => clock,
    reset  => reset,
    enable => enable,
    rci    => '0',
    load   => load,
    D      => uniload,
    Q      => x_Q_O_UNI,
    rco    => x_RCI_O_UNI
  );

  contador_10_dez : contador10 PORT MAP(
    clock  => clock,
    reset  => reset,
    enable => enable,
    rci    => x_RCI_O_UNI,
    load   => load,
    D      => dezload,
    Q      => x_Q_O_DEZ,
    rco    => OPEN
  );

  unidade <= x_Q_O_UNI;
  dezena  <= x_Q_O_DEZ;
END contador100_arch;
