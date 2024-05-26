-- Universidade de Bras�lia
-- Laborat�rio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 26/04/2024

-- ************
-- Testbench para a simula��o do
-- Circuito: Entidade que recebe como entrada três bits e tem como saída dois bits, determinados por dois multiplexadores 4x1:
--       i_A, i_B, i_C   3 bits de entrada
--       o_Y      2 bits de saída
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e sa�dada

-- Testbench para funcao_y.vhd
-- Valida��o assíncrona
ENTITY funcao_y_testbench IS END;

-- ************ Architecture ************
-- implementa��o do projeto

ARCHITECTURE tb_funcao_y OF funcao_y_testbench IS
   -- declara��o do componente funcao_y de acordo com sua arquitetura no arquivo funcao_y.vhd
   COMPONENT funcao_y
      PORT (
         i_A, i_B, i_C : IN STD_LOGIC;
         o_Y           : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais auxiliares para a simula��o dos estí­mulos ao circuito
   SIGNAL x_A_AUX, x_B_AUX, x_C_AUX : STD_LOGIC;

   -- Inst�nciaa do componente funcao_y e conex�o dos sinais
BEGIN
   abc_circuit : funcao_y PORT MAP(
      -- conex�o dos pinos de entrada
      i_A => x_A_AUX,
      i_B => x_B_AUX,
      i_C => x_C_AUX,
      -- conex�o dos pinos de saída
      o_Y => OPEN
   );

   -- Processo para gerar os estÃ­íulos
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
