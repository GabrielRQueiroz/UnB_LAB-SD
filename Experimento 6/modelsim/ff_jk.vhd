-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 31/05/24

-- ************
-- Circuito: Flip flop do tipo JK sensível a borda de subida
--           i_PR, i_CLR, i_CLK, i_J, i_K    Entradas de 1 bit
--           o_Q                             Saída de 1 bit
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída
ENTITY flip_flop_jk IS
   PORT (
      i_PR, i_CLR, i_CLK, i_J, i_K : IN STD_LOGIC;
      o_Q                          : OUT STD_LOGIC
   );
END flip_flop_jk;
-- ************ Architecture ************
-- implementação do projeto
ARCHITECTURE flip_flop_jk_arch OF flip_flop_jk IS
   -- Sinal auxiliar para determinação do estado atual do flip flop
   SIGNAL s_Q : STD_LOGIC;

BEGIN
   -- ************
   -- Processo de atualização do flip-flop
   -- ************

   PROCESS (i_PR, i_CLR, i_CLK)
   BEGIN
      IF (i_PR = '1') THEN
         s_Q <= '1';
      ELSIF (i_CLR = '1') THEN
         s_Q <= '0';
      ELSIF rising_edge(i_CLK) THEN
         IF (i_J = '0' AND i_K = '0') THEN
            s_Q <= s_Q; -- KEEP
         ELSIF (i_J = '0' AND i_K = '1') THEN
            s_Q <= '0'; -- 0
         ELSIF (i_J = '1' AND i_K = '0') THEN
            s_Q <= '1'; -- 1
         ELSIF (i_J = '1' AND i_K = '1') THEN
            s_Q <= NOT s_Q; -- INVERT
         END IF;
      END IF;
   END PROCESS;

   o_Q <= s_Q;
END flip_flop_jk_arch;
