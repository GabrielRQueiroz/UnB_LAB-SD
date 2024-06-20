
-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída
ENTITY uni_shift_register IS
   PORT (
      i_CLK, i_L : IN STD_LOGIC;
      o_Q        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
   );
END uni_shift_register;
-- ************ Architecture ************
-- implementação do projeto
ARCHITECTURE uni_shift_register_arch OF uni_shift_register IS
   SIGNAL s_Q : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

BEGIN
   -- ************
   -- Processo de atualização do flip-flop
   -- ************
   PROCESS (i_CLK)
   BEGIN
      IF (rising_edge(i_CLK)) THEN
         s_Q <= s_Q(2 DOWNTO 0) & i_L;
      END IF;
   END PROCESS;

   o_Q <= s_Q;
END uni_shift_register_arch;
