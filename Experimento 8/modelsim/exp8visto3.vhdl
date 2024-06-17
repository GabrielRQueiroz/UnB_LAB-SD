LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY exp8visto3 IS
  PORT (
    clock        : IN STD_LOGIC;
    ligadesliga  : IN STD_LOGIC;
    sensorA      : IN STD_LOGIC;
    sensorB      : IN STD_LOGIC;
    dezena       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    unidade      : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    RYGsemaforoA : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    RYGsemaforoB : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END exp8visto3;

ARCHITECTURE exp8visto3_arch OF exp8visto3 IS
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
  COMPONENT maqestados IS PORT (
    clock        : IN STD_LOGIC;
    ligadesliga  : IN STD_LOGIC;
    sensorA      : IN STD_LOGIC;
    sensorB      : IN STD_LOGIC;
    T60          : IN STD_LOGIC;
    T20          : IN STD_LOGIC;
    T6           : IN STD_LOGIC;
    T5           : IN STD_LOGIC;
    resetcounter : OUT STD_LOGIC;
    RYGsemaforoA : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    RYGsemaforoB : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
  END COMPONENT;

  SIGNAL x_DEZENA, x_UNIDADE                      : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL x_RESETCOUNTER, x_T60, x_T20, x_T6, x_T5 : STD_LOGIC;
  -- inserir implementacao aqui 
BEGIN
  contador_100 : contador100 PORT MAP(
    clock   => clock,
    reset   => x_RESETCOUNTER,
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
    T5      => x_T5,
    T6      => x_T6,
    T20     => x_T20,
    T60     => x_T60
  );

  semaforos : maqestados PORT MAP(
    clock        => clock,
    ligadesliga  => ligadesliga,
    sensorA      => sensorA,
    sensorB      => sensorB,
    T60          => x_T60,
    T20          => x_T20,
    T6           => x_T6,
    T5           => x_T5,
    resetcounter => x_RESETCOUNTER,
    RYGsemaforoA => RYGsemaforoA,
    RYGsemaforoB => RYGsemaforoB);

  dezena  <= x_DEZENA;
  unidade <= x_UNIDADE;

END exp8visto3_arch;
