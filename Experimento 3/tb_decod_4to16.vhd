-- Universidade de Bras�lia
-- Laborat�rio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 19/04/2024

-- ************
-- Testbench para a simula��o do
-- Circuito: Decodificador de 4 para 16, que recebe como entrada um vetor de 4 bits e como sa�da um vetor de 16 bits:
--          a   Vetor de entrada de 4 bits
--          y   Vetor de sa�da de 16 bits
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saída

-- Testbench para decod_4to16.vhd
-- Valida��o ass�ncrona
ENTITY decod_4to16_testbench IS END;

-- ************ Architecture ************
-- implementa��o do projeto

ARCHITECTURE tb_decod_4to16 OF decod_4to16_testbench IS
   -- declara��o do componente decod_4to16 de acordo com sua arquitetura no arquivo decod_4to16.vhd
   COMPONENT decod_4to16
      PORT (
         -- declara��o dos pinos de entrada
         a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         -- declara��o dos pinos de saída
         y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
   END COMPONENT;

   -- Sinais auxiliares para a simula��o dos est�mulos ao circuito
   SIGNAL a_aux : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

   -- Inst�ncia do componente decod_4to16 e conex�o dos sinais
BEGIN
   decod : decod_4to16 PORT MAP(
      -- conex�o dos pinos de entrada
      a => a_aux,
      -- conex�o dos pinos de sa�da
      y => OPEN
   );

   -- Processo para gerar os estí�ulos
   estimulo : PROCESS
   BEGIN
      for i in 0 to 15 loop
         a_aux <= std_logic_vector(to_unsigned(i, 4));
         WAIT FOR 10 ns;
      end loop;
      WAIT;
   END PROCESS estimulo;

END tb_decod_4to16;
