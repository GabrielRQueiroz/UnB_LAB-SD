-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 03/05/2024

-- ************
-- Testbench para a simulação do
-- Circuito: Somador de palavras de 4 bits utilizando o operador + do pacore STD_LOGIC_ARITH
--           i_A, i_B   Palavras de 4 bits (Entrada)
--           o_S      Saída da soma das palavras (5 bits)
--
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saída

-- Testbench para words_adder.vhd
-- Validação assíncrona
ENTITY tb_words_adder IS
   PORT (
      o_DUT, o_GM : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      i_A, i_B    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
   );
END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_words_adder_arch OF tb_words_adder IS

BEGIN
   PROCESS
      VARIABLE contbin : STD_LOGIC_VECTOR(7 DOWNTO 0);
   BEGIN
      REPORT "Início do testbench" SEVERITY NOTE;
      contbin := "00000000";
      FOR i IN 0 TO 256 LOOP
         i_A <= contbin(3) & contbin(2) & contbin(1) & contbin(0);
         i_B <= contbin(7) & contbin(6) & contbin(5) & contbin(4);
         WAIT FOR 500 ns;

         ASSERT (o_GM = o_DUT) REPORT "Erro na soma i = " & INTEGER'image(i) SEVERITY ERROR;

         contbin := contbin + 1;
      END LOOP;

      REPORT "Fim do testbench" SEVERITY NOTE;

      WAIT;
   END PROCESS;
END tb_words_adder_arch;
