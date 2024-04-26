-- Universidade de Bras�lia
-- Laborat�rio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 03/05/2024

-- ************
-- Top module para a simula��o do
-- Circuito: Somador de palavras de 2 bits utilizando o operador + do pacore STD_LOGIC_ARITH
--           i_A, i_B   Palavras de 2 bits (Entrada)
--           o_S      Sa�da da soma das palavras (3 bits)
--
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- Top module: uma entidade sem pinos de entrada e sa�da

-- Top module para words_adder.vhd
-- Valida��o ass�ncrona
ENTITY two_bit_adder_top_module IS END;

-- ************ Architecture ************
-- implementa��o do projeto

ARCHITECTURE words_adder_top_module OF two_bit_adder_top_module IS
   -- declara��o do componente words_adder de acordo com sua arquitetura no arquivo words_adder.vhd
   COMPONENT two_bit_adder_dut
      PORT (
         -- declara��o dos pinos de entrada
         i_A, i_B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         -- declara��o dos pinos de sa�da
         o_S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT two_bit_adder_gm
      PORT (
         -- declara��o dos pinos de entrada
         i_A, i_B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         -- declara��o dos pinos de sa�da
         o_S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT tb_two_bit_adder
      PORT (
         -- declara��o dos pinos de entrada
         i_DUT_OUT, i_GM_OUT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         -- declara��o dos pinos de sa�da
         o_A, o_B : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
      );
   END COMPONENT;

   -- Sinais auxiliares para a simula��o dos est�mulos ao circuito
   SIGNAL x_A, x_B            : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL x_DUT_OUT, x_GM_OUT : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN
   U0 : two_bit_adder_dut PORT MAP(i_A => x_A, i_B => x_B, o_S => x_DUT_OUT);
   U1 : two_bit_adder_gm PORT MAP(i_A => x_A, i_B => x_B, o_S => x_GM_OUT);
   U2 : tb_two_bit_adder PORT MAP(
      i_DUT_OUT => x_DUT_OUT,
      i_GM_OUT  => x_GM_OUT,
      o_A       => x_A,
      o_B       => x_B
   );
END words_adder_top_module;
