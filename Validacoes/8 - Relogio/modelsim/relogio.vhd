LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY relogio IS
  PORT (
    clock   : IN STD_LOGIC;
    horas   : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    minutos : OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
END relogio;

ARCHITECTURE relogio_arch OF relogio IS
  -- inserir sinais e componentes aqui 
  COMPONENT contador10000_relogio IS PORT (
    clock                               : IN STD_LOGIC;
    reset                               : IN STD_LOGIC;
    enable                              : IN STD_LOGIC;
    load                                : IN STD_LOGIC;
    milload, centload, dezload, uniload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    milhar, centena, dezena, unidade    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
  END COMPONENT;

  COMPONENT timeflags_relogio IS PORT (
    milhar  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    centena : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    dezena  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    unidade : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    T59     : OUT STD_LOGIC;
    T3599   : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT maqestados_relogio IS
    PORT (
      T59, T3599, clock : IN STD_LOGIC;
      horas, minutos    : OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
  END COMPONENT;

  SIGNAL x_MINUTOS, x_HORAS                                               : STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";
  SIGNAL x_DEZENA_MINUTOS, x_UNIDADE_MINUTOS                              : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL x_MILHAR_HORAS, x_CENTENA_HORAS, x_DEZENA_HORAS, x_UNIDADE_HORAS : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL x_T59, x_T3599, x_RESET_MINUTOS, x_RESET_HORAS                   : STD_LOGIC;

  -- inserir implementacao aqui 
BEGIN

  contador_minutos_inst : contador10000_relogio
  PORT MAP(
    clock    => clock,
    reset    => x_RESET_MINUTOS,
    enable   => '0',
    load     => '0',
    milload  => "0000",
    centload => "0000",
    dezload  => "0000",
    uniload  => "0000",
    milhar   => OPEN,
    centena  => OPEN,
    dezena   => x_DEZENA_MINUTOS,
    unidade  => x_UNIDADE_MINUTOS
  );

  contador_horas_inst : contador10000_relogio
  PORT MAP(
    clock    => clock,
    reset    => x_RESET_HORAS,
    enable   => '0',
    load     => '0',
    milload  => "0000",
    centload => "0000",
    dezload  => "0000",
    uniload  => "0000",
    milhar   => x_MILHAR_HORAS,
    centena  => x_CENTENA_HORAS,
    dezena   => x_DEZENA_HORAS,
    unidade  => x_UNIDADE_HORAS
  );

  timeflags_minutos_inst : timeflags_relogio PORT MAP(
    milhar  => "0000",
    centena => "0000",
    dezena  => x_DEZENA_MINUTOS,
    unidade => x_UNIDADE_MINUTOS,
    T59     => x_T59,
    T3599   => OPEN
  );

  timeflags_horas_inst : timeflags_relogio PORT MAP(
    milhar  => x_MILHAR_HORAS,
    centena => x_CENTENA_HORAS,
    dezena  => x_DEZENA_HORAS,
    unidade => x_UNIDADE_HORAS,
    T59     => OPEN,
    T3599   => x_T3599
  );

  comb_proc : PROCESS (clock)
  BEGIN
    IF rising_edge(clock) THEN
      IF (x_HORAS = x"23" AND x_MINUTOS = x"59") THEN
        x_HORAS         <= x"00";
        x_RESET_HORAS   <= '1';
        x_MINUTOS       <= x"00";
        x_RESET_MINUTOS <= '1';
      ELSIF (x_MINUTOS = x"59") THEN
        x_MINUTOS       <= x"00";
        x_RESET_MINUTOS <= '1';
      END IF;

      IF (rising_edge(x_T59)) THEN
        x_MINUTOS       <= x_MINUTOS + 1;
        x_RESET_MINUTOS <= '1';
      ELSE
        x_MINUTOS       <= x_MINUTOS;
        x_RESET_MINUTOS <= '0';
      END IF;

      IF (rising_edge(x_T3599)) THEN
        x_HORAS       <= x_HORAS + 1;
        x_RESET_HORAS <= '1';
      ELSE
        x_HORAS       <= x_HORAS;
        x_RESET_HORAS <= '0';
      END IF;
    END IF;
  END PROCESS;

  horas   <= x_HORAS;
  minutos <= x_MINUTOS;
END relogio_arch;
