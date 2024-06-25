LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY contador10000_relogio IS
  PORT (
    clock    : IN STD_LOGIC;
    reset    : IN STD_LOGIC;
    enable   : IN STD_LOGIC;
    load     : IN STD_LOGIC;
    milload  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    centload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    dezload  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    uniload  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    milhar   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    centena  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    dezena   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    unidade  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END contador10000_relogio;

ARCHITECTURE contador10000_relogio_arch OF contador10000_relogio IS
  -- inserir sinais e componentes aqui 
  COMPONENT contador10_relogio IS
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

  SIGNAL x_RCI_O_UNI, x_RCI_O_DEZ, x_RCI_O_CEN      : STD_LOGIC;
  SIGNAL x_Q_O_UNI, x_Q_O_DEZ, x_Q_O_CEN, x_Q_O_MIL : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL x_RCI_I_MIL, x_RCI_I_CEN                   : STD_LOGIC;
BEGIN
  -- inserir implementacao aqui 
  contador_10_uni : contador10_relogio PORT MAP(
    clock  => clock,
    reset  => reset,
    enable => enable,
    rci    => '0',
    load   => load,
    D      => uniload,
    Q      => x_Q_O_UNI,
    rco    => x_RCI_O_UNI
  );

  contador_10_dez : contador10_relogio PORT MAP(
    clock  => clock,
    reset  => reset,
    enable => enable,
    rci    => x_RCI_O_UNI,
    load   => load,
    D      => dezload,
    Q      => x_Q_O_DEZ,
    rco    => x_RCI_O_DEZ
  );

  x_RCI_I_CEN <= x_RCI_O_DEZ OR x_RCI_O_UNI;

  contador_10_cen : contador10_relogio PORT MAP(
    clock  => clock,
    reset  => reset,
    enable => enable,
    rci    => x_RCI_I_CEN,
    load   => load,
    D      => milload,
    Q      => x_Q_O_CEN,
    rco    => x_RCI_O_CEN
  );

  x_RCI_I_MIL <= x_RCI_O_CEN OR x_RCI_O_DEZ OR x_RCI_O_UNI;

  contador_10_mil : contador10_relogio PORT MAP(
    clock  => clock,
    reset  => reset,
    enable => enable,
    rci    => x_RCI_I_MIL,
    load   => load,
    D      => centload,
    Q      => x_Q_O_MIL,
    rco    => OPEN
  );

  unidade <= x_Q_O_UNI;
  dezena  <= x_Q_O_DEZ;
  centena <= x_Q_O_CEN;
  milhar  <= x_Q_O_MIL;
END contador10000_relogio_arch;
