-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 03/05/2024

-- ************
-- Circuito: Somador de palavras de 2 bits utilizando o operador + do pacore STD_LOGIC_ARITH
--           i_A, i_B   Palavras de 2 bits (Entrada)
--           o_S      Saída da soma das palavras (3 bits)
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE IEEE.std_logic_arith.ALL;

-- ************ Entity ************
-- pinos de entrada e saída
ENTITY two_bit_adder_gm IS
   PORT (
      i_A, i_B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      o_S      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
   );
END two_bit_adder_gm;

-- ************ Architecture ************
-- implementação do projeto
ARCHITECTURE two_bit_adder_gm_arch OF two_bit_adder_gm IS
BEGIN
   o_S <= "1" & (i_A) + (i_B);
END ARCHITECTURE;
