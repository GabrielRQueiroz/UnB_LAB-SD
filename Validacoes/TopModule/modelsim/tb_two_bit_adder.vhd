-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 03/05/2024

-- ************
-- Testbench para a simulação do
-- Circuito: Somador de palavras de 2 bits utilizando o operador + do pacore STD_LOGIC_ARITH
--           i_A, i_B   Palavras de 2 bits (Entrada)
--           o_S      Saída da soma das palavras (3 bits)
--
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.std_logic_unsigned.ALL;

-- ************ Entity ************
-- Testbench para two_bit_adder.vhd
-- Validação assíncrona
ENTITY tb_two_bit_adder IS
   PORT (
      -- declaração dos pinos de entrada
      o_DUT_OUT, o_GM_OUT : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      -- declaração dos pinos de saída
      i_A, i_B : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
   );
END tb_two_bit_adder;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_two_bit_adder_arch OF tb_two_bit_adder IS
BEGIN
   PROCESS
      VARIABLE contbin : STD_LOGIC_VECTOR(3 DOWNTO 0);
   BEGIN
      REPORT "Início do testbench" SEVERITY NOTE;
      contbin := "0000";
      FOR i IN 0 TO 15 LOOP
         i_A <= contbin(1) & contbin(0);
         i_B <= contbin(3) & contbin(2);
         WAIT FOR 500 ns;

         ASSERT (o_GM_OUT = o_DUT_OUT) REPORT "Erro na soma i = " & INTEGER'image(i) SEVERITY ERROR;

         contbin := contbin + 1;
      END LOOP;

      REPORT "Fim do testbench" SEVERITY NOTE;

      WAIT;
   END PROCESS;
END tb_two_bit_adder_arch;
