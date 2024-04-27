-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 03/05/2024

-- ************
-- Top module para a simulação do
-- Circuito: Somador de palavras de 4 bits utilizando o operador + do pacore STD_LOGIC_ARITH
--           i_A, i_B   Palavras de 4 bits (Entrada)
--           o_S      Saída da soma das palavras (5 bits)
--
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- Top module: uma entidade sem pinos de entrada e saída

-- Top module para words_adder.vhd
-- Validação assíncrona
ENTITY words_adder_top_module IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE words_adder_top_module_arch OF words_adder_top_module IS
   -- declaração do componente words_adder de acordo com sua arquitetura no arquivo words_adder.vhd
   COMPONENT words_adder_dut
      PORT (
         -- declaração dos pinos de entrada
         i_A, i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         -- declaração dos pinos de saída
         o_S : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT words_adder_gm
      PORT (
         -- declaração dos pinos de entrada
         i_A, i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         -- declaração dos pinos de saída
         o_S : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT tb_words_adder
      PORT (
         -- declaração dos pinos de entrada
         o_DUT, o_GM : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
         -- declaração dos pinos de saída
         i_A, i_B : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulação dos estímulos ao circuito
   SIGNAL x_A, x_B            : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL x_DUT_OUT, x_GM_OUT : STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN
   U0 : words_adder_dut PORT MAP(
      i_A => x_A,
      i_B => x_B,
      o_S => x_DUT_OUT
   );

   U1 : words_adder_gm PORT MAP(
      i_A => x_A,
      i_B => x_B,
      o_S => x_GM_OUT
   );

   U2 : tb_words_adder PORT MAP(
      o_DUT => x_DUT_OUT,
      o_GM  => x_GM_OUT,
      i_A       => x_A,
      i_B       => x_B
   );
END words_adder_top_module_arch;
