-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 

-- ************
-- Circuito: Flip flop do tipo JK sens�vel a borda de subida
--           i_PR, i_CLR, i_CLK, i_J, i_K    Entradas de 1 bit
--           o_Q                             Sa�da de 1 bit
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
   SIGNAL s_Q : STD_LOGIC;

BEGIN
   -- ************
   -- Processo de atualização do flip-flop
   -- ************

   PROCESS (i_PR, i_CLR, i_CLK, i_J, i_K)
   BEGIN
      IF (i_PR = '1') THEN
         s_Q <= '1';
      ELSIF (i_CLR = '1') THEN
         s_Q <= '0';
      ELSIF rising_edge(i_CLK) THEN
         IF (i_J = '0' AND i_K = '0') THEN
            s_Q <= s_Q;
         ELSIF (i_J = '1' AND i_K = '0') THEN
            s_Q <= '1';
         ELSIF (i_J = '0' AND i_K = '1') THEN
            s_Q <= '0';
         ELSIF (i_J = '1' AND i_K = '1') THEN
            s_Q <= NOT s_Q;
         END IF;
      END IF;
   END PROCESS;

   -- ************
   -- Processo de saída do flip-flop
   -- ************

   PROCESS (s_Q)
   BEGIN
      o_Q <= s_Q;
   END PROCESS;
END flip_flop_jk_arch;
