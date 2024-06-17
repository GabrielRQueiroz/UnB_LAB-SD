LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY exp8visto2 IS
  PORT (
    clock : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    T60   : OUT STD_LOGIC;
    T20   : OUT STD_LOGIC;
    T6    : OUT STD_LOGIC;
    T5    : OUT STD_LOGIC
    -- num7seg  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    -- displays : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END exp8visto2;

ARCHITECTURE exp8visto2_arch OF exp8visto2 IS
  -- inserir sinais e componentes aqui 

  COMPONENT contador100 IS PORT (
    clock   : IN STD_LOGIC;
    reset   : IN STD_LOGIC;
    enable  : IN STD_LOGIC;
    load    : IN STD_LOGIC;
    dezload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    uniload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    dezena  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    unidade : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
  END COMPONENT;

  COMPONENT timeflags IS PORT (
    dezena  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    unidade : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    T60     : OUT STD_LOGIC;
    T20     : OUT STD_LOGIC;
    T6      : OUT STD_LOGIC;
    T5      : OUT STD_LOGIC);
  END COMPONENT;

  SIGNAL x_DEZENA, x_UNIDADE : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
  -- inserir implementacao aqui 

  contador_100 : contador100 PORT MAP(
    clock   => clock,
    reset   => reset,
    enable  => '0',
    load    => '0',
    dezload => "0000",
    uniload => "0000",
    dezena  => x_DEZENA,
    unidade => x_UNIDADE
  );

  timeflags_comp : timeflags PORT MAP(
    dezena  => x_DEZENA,
    unidade => x_UNIDADE,
    T5      => T5,
    T6      => T6,
    T20     => T20,
    T60     => T60
  );
END exp8visto2_arch;
