-- LIBRARY IEEE;
-- USE IEEE.STD_LOGIC_1164.ALL;
-- USE ieee.std_logic_unsigned.ALL;
-- USE ieee.std_logic_arith.ALL;

-- ENTITY maqestados_relogio IS
--    PORT (
--       T59, T3599, clock : IN STD_LOGIC;
--       horas, minutos    : OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
-- END maqestados_relogio;

-- ARCHITECTURE maqestados_relogio_arch OF maqestados_relogio IS
--    TYPE estados IS (passa_minuto, passa_hora, reinicia);
--    SIGNAL estado_atual, estado_proximo : estados;
--    SIGNAL reset_horas, reset_minutos   : STD_LOGIC;
--    SIGNAL x_HORAS, x_MINUTOS           : STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";

-- BEGIN
--    sync_proc : PROCESS (clock)
--    BEGIN
--       IF rising_edge(clock) THEN
--          estado_atual <= estado_proximo;
--       END IF;
--    END PROCESS;

--    comb_proc : PROCESS (estado_atual)
--    BEGIN

--       IF rising_edge(clock) THEN
--          IF (x_HORAS = x"23" AND x_MINUTOS = x"59") THEN
--             horas         <= x"00";
--             reset_horas   <= '1';
--             minutos       <= x"00";
--             reset_minutos <= '1';
--          ELSIF (x_MINUTOS = x"59") THEN
--             minutos       <= x"00";
--             reset_minutos <= '1';
--          END IF;

--          IF (T59 = '1') THEN
--             minutos       <= x_MINUTOS + 1;
--             reset_minutos <= '1';
--          ELSE
--             minutos       <= x_MINUTOS;
--             reset_minutos <= '0';
--          END IF;

--          IF (T3599 = '1') THEN
--             horas       <= x_HORAS + 1;
--             reset_horas <= '1';
--          ELSE
--             horas       <= x_HORAS;
--             reset_horas <= '0';
--          END IF;
--       END IF;

--    END PROCESS;
-- END ARCHITECTURE;
