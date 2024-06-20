LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY maqestados IS
  PORT (
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
END maqestados;

ARCHITECTURE maqestados_arch OF maqestados IS
  -- inserir sinais e componentes aqui 
  TYPE state IS (Off1, Off2, StartingYellow6, StartingRed5, NorthGreen, EastGreen, NorthToEastYellow6, NorthToEastRed5, EastToNorthYellow6, EastToNorthRed5);
  SIGNAL estado_atual, proximo_estado : state;

  SIGNAL x_YELLOW_A, x_YELLOW_B : STD_LOGIC := '1';
BEGIN

  -- inserir implementacao aqui 
  sync_proc : PROCESS (clock)
  BEGIN
    IF (estado_atual = proximo_estado) THEN
      resetcounter <= '0';
    ELSE
      resetcounter <= '1';
    END IF;

    IF (rising_edge(clock)) THEN
      resetcounter <= '1';
      estado_atual <= proximo_estado;
    END IF;
  END PROCESS;

  comb_proc : PROCESS (estado_atual, ligadesliga, sensorA, sensorB, T60, T20, T6, T5)
  BEGIN
    CASE estado_atual IS
      WHEN (Off1) =>
        IF (ligadesliga = '1') THEN
          proximo_estado <= StartingYellow6;
        ELSE
          proximo_estado <= Off2;
        END IF;

      WHEN (Off2) =>
        proximo_estado <= Off1;

      WHEN (StartingYellow6) =>
        IF (T6 = '1') THEN
          proximo_estado <= StartingRed5;
        ELSE
          proximo_estado <= StartingYellow6;
        END IF;

      WHEN (StartingRed5) =>
        IF (T5 = '1') THEN
          proximo_estado <= NorthGreen;
        ELSE
          proximo_estado <= StartingRed5;
        END IF;

      WHEN (NorthGreen) =>
        IF ((sensorA = '0' AND sensorB = '1' AND T20 = '1') OR T60 = '1') THEN
          proximo_estado <= NorthToEastYellow6;
        ELSE
          proximo_estado <= NorthGreen;
        END IF;

      WHEN (EastGreen) =>
        IF ((sensorA = '1' AND sensorB = '0' AND T20 = '1') OR T60 = '1') THEN
          proximo_estado <= EastToNorthYellow6;
        ELSE
          proximo_estado <= EastGreen;
        END IF;

      WHEN (NorthToEastYellow6) =>
        IF (T6 = '1') THEN
          proximo_estado <= NorthToEastRed5;
        ELSE
          proximo_estado <= NorthToEastYellow6;
        END IF;

      WHEN (NorthToEastRed5) =>
        IF (T5 = '1') THEN
          proximo_estado <= EastGreen;
        ELSE
          proximo_estado <= NorthToEastRed5;
        END IF;

      WHEN (EastToNorthYellow6) =>
        IF (T6 = '1') THEN
          proximo_estado <= EastToNorthRed5;
        ELSE
          proximo_estado <= EastToNorthYellow6;
        END IF;

      WHEN (EastToNorthRed5) =>
        IF (T5 = '1') THEN
          proximo_estado <= NorthGreen;
        ELSE
          proximo_estado <= EastToNorthRed5;
        END IF;

      WHEN OTHERS =>
        proximo_estado <= Off1;
    END CASE;
  END PROCESS;

  lights_proc : PROCESS (estado_atual)
  BEGIN
    CASE estado_atual IS
      WHEN (Off1) =>
        RYGsemaforoA <= "000";
        RYGsemaforoB <= "000";

      WHEN (Off2) =>
        RYGsemaforoA <= "010";
        RYGsemaforoB <= "010";

      WHEN (StartingYellow6) =>
        RYGsemaforoA <= "010";
        RYGsemaforoB <= "010";

      WHEN (StartingRed5) =>
        RYGsemaforoA <= "100";
        RYGsemaforoB <= "100";

      WHEN (NorthGreen) =>
        RYGsemaforoA <= "001";
        RYGsemaforoB <= "100";

      WHEN (EastGreen) =>
        RYGsemaforoA <= "100";
        RYGsemaforoB <= "001";

      WHEN (NorthToEastYellow6) =>
        RYGsemaforoA <= "010";
        RYGsemaforoB <= "100";

      WHEN (NorthToEastRed5) =>
        RYGsemaforoA <= "100";
        RYGsemaforoB <= "100";

      WHEN (EastToNorthYellow6) =>
        RYGsemaforoA <= "100";
        RYGsemaforoB <= "010";

      WHEN (EastToNorthRed5) =>
        RYGsemaforoA <= "100";
        RYGsemaforoB <= "100";

      WHEN OTHERS =>
        RYGsemaforoA <= "000";
        RYGsemaforoB <= "000";
    END CASE;
  END PROCESS;
END maqestados_arch;
