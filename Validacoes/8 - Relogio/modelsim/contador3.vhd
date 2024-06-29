LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY contador3_relogio IS
  PORT (
    clock  : IN STD_LOGIC;
    reset  : IN STD_LOGIC;
    enable : IN STD_LOGIC;
    rci    : IN STD_LOGIC;
    load   : IN STD_LOGIC;
    D      : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    Q      : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    rco    : OUT STD_LOGIC);
END contador3_relogio;

ARCHITECTURE contador6_rel3gio_arch OF contador3_relogio IS
  -- inserir sinais e componentes aqui 
  TYPE state IS (s0, s1, s2);
  SIGNAL currentState, nextState, loadState : state;

  -- SIGNAL x_D, x_Q : STD_LOGIC_VECTOR(1 DOWNTO 0);
  -- SIGNAL x_rco    : STD_LOGIC;
BEGIN
  -- inserir implementacao aqui 
  WITH D SELECT
    loadState <=
    s0 WHEN "00",
    s1 WHEN "01",
    s2 WHEN "10",
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
        Q   <= "00";
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
        Q   <= "01";
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
        Q   <= "10";
        rco <= '0';
        IF reset = '1' THEN
          nextState <= s0;
        ELSIF load = '1' THEN
          nextState <= loadState;
        ELSIF (enable = '0' AND rci = '0') THEN
          nextState <= s0;
        ELSE
          nextState <= s2;
        END IF;

    END CASE;
  END PROCESS;
END contador6_rel3gio_arch;
