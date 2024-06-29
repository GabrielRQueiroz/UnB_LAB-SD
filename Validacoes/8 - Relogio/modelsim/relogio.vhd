LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY relogio IS
  PORT (
    clock           : IN STD_LOGIC;
    minutos_unidade : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    minutos_dezena  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    horas_unidade   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    horas_dezena    : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END relogio;

ARCHITECTURE relogio_arch OF relogio IS
  -- inserir sinais e componentes aqui 
  COMPONENT contador60_relogio IS PORT (
    clock   : IN STD_LOGIC;
    reset   : IN STD_LOGIC;
    enable  : IN STD_LOGIC;
    rci     : IN STD_LOGIC;
    unidade : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    dezena  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    rco     : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT contador24_relogio IS PORT (
    clock   : IN STD_LOGIC;
    reset   : IN STD_LOGIC;
    enable  : IN STD_LOGIC;
    rci     : IN STD_LOGIC;
    unidade : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    dezena  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    rco     : OUT STD_LOGIC);
  END COMPONENT;

  -- SIGNAL x_MINUTOS_UNIDADE                                  : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000000";
  -- SIGNAL x_MINUTOS_DEZENA                                   : STD_LOGIC_VECTOR(2 DOWNTO 0) := "0000000";
  -- SIGNAL x_HORAS_UNIDADE                                    : STD_LOGIC_VECTOR(3 DOWNTO 0) := "000";
  -- SIGNAL x_HORAS_DEZENA                                     : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
  SIGNAL x_RESET                            : STD_LOGIC;
  SIGNAL x_MINUTOS                          : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
  SIGNAL x_HORAS                            : STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";
  SIGNAL x_RCO_SEG, x_RCO_MIN, x_RCI_HR     : STD_LOGIC;
  SIGNAL x_MINUTOS_UNIDADE, x_HORAS_UNIDADE : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL x_MINUTOS_DEZENA                   : STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL x_HORAS_DEZENA                     : STD_LOGIC_VECTOR(1 DOWNTO 0);

  -- inserir implementacao aqui 
BEGIN
  contador_segundos_inst : contador60_relogio
  PORT MAP(
    clock   => clock,
    reset   => x_RESET,
    enable  => '0',
    rci     => '0',
    unidade => OPEN,
    dezena  => OPEN,
    rco     => x_RCO_SEG
  );

  contador_minutos_inst : contador60_relogio
  PORT MAP(
    clock   => clock,
    reset   => x_RESET,
    enable  => '0',
    rci     => x_RCO_SEG,
    unidade => x_MINUTOS_UNIDADE,
    dezena  => x_MINUTOS_DEZENA,
    rco     => x_RCO_MIN
  );

  x_RCI_HR <= x_RCO_MIN OR x_RCO_SEG;

  contador_horas_inst : contador24_relogio
  PORT MAP(
    clock   => clock,
    reset   => x_RESET,
    enable  => '0',
    rci     => x_RCI_HR,
    unidade => x_HORAS_UNIDADE,
    dezena  => x_HORAS_DEZENA,
    rco     => OPEN
  );

  PROCESS (clock)
  BEGIN
    IF rising_edge(clock) THEN
      IF x_MINUTOS_UNIDADE = "1001" AND x_MINUTOS_DEZENA = "101" AND x_HORAS_UNIDADE = "11" AND x_HORAS_DEZENA = "010" AND x_RCO_SEG = '0' THEN
        x_RESET <= '1';
      ELSE
        x_RESET <= '0';
      END IF;
    ELSIF falling_edge(clock) THEN
      IF x_RESET = '1' THEN
        x_RESET <= '0';
      END IF;
    END IF;
  END PROCESS;

  minutos_unidade <= x_MINUTOS_UNIDADE;
  minutos_dezena  <= x_MINUTOS_DEZENA;
  horas_unidade   <= x_HORAS_UNIDADE;
  horas_dezena    <= x_HORAS_DEZENA;

END relogio_arch;
