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
USE IEEE.numeric_std.ALL;
USE std.textio.ALL;

-- ************ Entity ************
-- Testbench para two_bit_adder.vhd
-- Validação assíncrona
ENTITY tb_multiplex_8x1 IS
   PORT (
      -- declaração dos pinos de entrada
      i_DUT_OUT, i_GM_OUT : IN STD_LOGIC;
      -- declaração dos pinos de saída
      o_SEL  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      o_DATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
END tb_multiplex_8x1;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_multiplex_8x1_arch OF tb_multiplex_8x1 IS
BEGIN
   PROCESS
      VARIABLE contbin : STD_LOGIC_VECTOR(10 DOWNTO 0);
   BEGIN
      REPORT "Início do testbench" SEVERITY NOTE;
      contbin := "00000000000";
      FOR i IN 0 TO 2048 LOOP
         o_SEL  <= contbin(2 DOWNTO 0);
         o_DATA <= contbin(10 DOWNTO 3);
         WAIT FOR 500 ns;

         ASSERT (i_GM_OUT = i_DUT_OUT) REPORT "Erro no multiplexador i = " & INTEGER'image(i) SEVERITY ERROR;

         contbin := contbin + 1;
      END LOOP;

      REPORT "Fim do testbench" SEVERITY NOTE;

      WAIT;
   END PROCESS;
END tb_multiplex_8x1_arch;
