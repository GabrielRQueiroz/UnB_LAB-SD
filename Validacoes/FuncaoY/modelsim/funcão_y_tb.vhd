-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 26/04/2024

-- ************
-- Testbench para a simulação do
-- Circuito: Entidade que recebe como entrada trÃªs bits e tem como saÃ­da dois bits, determinados por dois multiplexadores 4x1:
--       i_A, i_B, i_C   3 bits de entrada
--       o_Y      2 bits de saÃ­da
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saídada

-- Testbench para funcao_y.vhd
-- Validação assÃ­ncrona
ENTITY funcao_y_testbench IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_funcao_y OF funcao_y_testbench IS
   -- declaração do componente funcao_y de acordo com sua arquitetura no arquivo funcao_y.vhd
   COMPONENT funcao_y
      PORT (
         i_A, i_B, i_C : IN STD_LOGIC;
         o_Y           : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulação dos estÃ­Â­mulos ao circuito
   SIGNAL x_A_AUX, x_B_AUX, x_C_AUX : STD_LOGIC;

   -- Instânciaa do componente funcao_y e conexão dos sinais
BEGIN
   abc_circuit : funcao_y PORT MAP(
      -- conexão dos pinos de entrada
      i_A => x_A_AUX,
      i_B => x_B_AUX,
      i_C => x_C_AUX,
      -- conexão dos pinos de saÃ­da
      o_Y => OPEN
   );

   -- Processo para gerar os estÃƒÂ­Ã­ulos
   estimulo : PROCESS
   BEGIN
      x_A_AUX <= '0';
      x_B_AUX <= '0';
      x_C_AUX <= '0';
      WAIT FOR 10 ns;

      x_A_AUX <= '0';
      x_B_AUX <= '0';
      x_C_AUX <= '1';
      WAIT FOR 10 ns;

      x_A_AUX <= '0';
      x_B_AUX <= '1';
      x_C_AUX <= '0';
      WAIT FOR 10 ns;

      x_A_AUX <= '0';
      x_B_AUX <= '1';
      x_C_AUX <= '1';
      WAIT FOR 10 ns;

      x_A_AUX <= '1';
      x_B_AUX <= '0';
      x_C_AUX <= '0';
      WAIT FOR 10 ns;

      x_A_AUX <= '1';
      x_B_AUX <= '0';
      x_C_AUX <= '1';
      WAIT FOR 10 ns;

      x_A_AUX <= '1';
      x_B_AUX <= '1';
      x_C_AUX <= '0';
      WAIT FOR 10 ns;

      x_A_AUX <= '1';
      x_B_AUX <= '1';
      x_C_AUX <= '1';
      WAIT FOR 10 ns;

      WAIT;
   END PROCESS estimulo;

END tb_funcao_y;
