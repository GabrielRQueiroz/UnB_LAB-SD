LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY contador6_relogio IS
  PORT (
    clock  : IN STD_LOGIC;
    reset  : IN STD_LOGIC;
    enable : IN STD_LOGIC;
    rci    : IN STD_LOGIC;
    load   : IN STD_LOGIC;
    D      : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    Q      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    rco    : OUT STD_LOGIC);
END contador6_relogio;

ARCHITECTURE contador6_relogio_arch OF contador6_relogio IS
  -- inserir sinais e componentes aqui 
  TYPE state IS (s0, s1, s2, s3, s4, s5);
  SIGNAL currentState, nextState, loadState : state;

  -- SIGNAL x_D, x_Q : STD_LOGIC_VECTOR(3 DOWNTO 0);
  -- SIGNAL x_rco    : STD_LOGIC;
BEGIN
  -- inserir implementacao aqui 
  WITH D SELECT
    loadState <=
    s0 WHEN "000",
    s1 WHEN "001",
    s2 WHEN "010",
    s3 WHEN "011",
    s4 WHEN "100",
    s5 WHEN "101",
    currentState WHEN OTHERS;

  sync_proc : PROCESS (clock, reset)
  BEGIN
    IF reset = '1' THEN
      currentState <= s0;
    ELSIF rising_edge(clock) THEN
      currentState <= nextState;
    END IF;
  END PROCESS;

  comb_proc : PROCESS (currentState, reset, enable, rci, load, loadState)
  BEGIN
    CASE currentState IS
      WHEN s0 =>
        Q   <= "000";
        rco <= '1';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s1;
        ELSE
          nextState <= s0;
        END IF;

      WHEN s1 =>
        Q   <= "001";
        rco <= '1';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s2;
        ELSE
          nextState <= s1;
        END IF;

      WHEN s2 =>
        Q   <= "010";
        rco <= '1';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s3;
        ELSE
          nextState <= s2;
        END IF;

      WHEN s3 =>
        Q   <= "011";
        rco <= '1';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s4;
        ELSE
          nextState <= s3;
        END IF;

      WHEN s4 =>
        Q   <= "100";
        rco <= '1';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s5;
        ELSE
          nextState <= s4;
        END IF;

      WHEN s5 =>
        Q   <= "101";
        rco <= '0';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s0;
        ELSE
          nextState <= s5;
        END IF;

      WHEN OTHERS =>
        Q   <= "000";
        rco <= '1';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s1;
        ELSE
          nextState <= s0;
        END IF;

    END CASE;
  END PROCESS;
END contador6_relogio_arch;
