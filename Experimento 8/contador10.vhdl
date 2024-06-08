LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY contador10 IS
  PORT (
    clock  : IN STD_LOGIC;
    reset  : IN STD_LOGIC;
    enable : IN STD_LOGIC;
    rci    : IN STD_LOGIC;
    load   : IN STD_LOGIC;
    D      : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    Q      : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    rco    : OUT STD_LOGIC);
END contador10;

ARCHITECTURE contador10_arch OF contador10 IS
  -- inserir sinais e componentes aqui 
  TYPE state IS (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
  SIGNAL currentState, nextState, loadState : state;

  -- SIGNAL x_D, x_Q : STD_LOGIC_VECTOR(3 DOWNTO 0);
  -- SIGNAL x_rco    : STD_LOGIC;
BEGIN
  -- inserir implementacao aqui 
  WITH D SELECT
    loadState <=
    s0 WHEN "0000",
    s1 WHEN "0001",
    s2 WHEN "0010",
    s3 WHEN "0011",
    s4 WHEN "0100",
    s5 WHEN "0101",
    s6 WHEN "0110",
    s7 WHEN "0111",
    s8 WHEN "1000",
    s9 WHEN "1001",
    currentState WHEN OTHERS;

  sync_proc : PROCESS (clock)
  BEGIN
    IF rising_edge(clock) THEN
      currentState <= nextState;
    END IF;
  END PROCESS;

  comb_proc : PROCESS (currentState, reset, enable, rci, load, loadState)
  BEGIN
    CASE currentState IS
      WHEN s0 =>
        Q   <= "0000";
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
        Q   <= "0001";
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
        Q   <= "0010";
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
        Q   <= "0011";
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
        Q   <= "0100";
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
        Q   <= "0101";
        rco <= '1';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s6;
        ELSE
          nextState <= s5;
        END IF;

      WHEN s6 =>
        Q   <= "0110";
        rco <= '1';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s7;
        ELSE
          nextState <= s6;
        END IF;

      WHEN s7 =>
        Q   <= "0111";
        rco <= '1';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s8;
        ELSE
          nextState <= s7;
        END IF;

      WHEN s8 =>
        Q   <= "1000";
        rco <= '1';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s9;
        ELSE
          nextState <= s8;
        END IF;

      WHEN s9 =>
        Q   <= "1001";
        rco <= '0';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s0;
        ELSE
          nextState <= s9;
        END IF;

      WHEN OTHERS =>
        Q   <= "0000";
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
END contador10_arch;
