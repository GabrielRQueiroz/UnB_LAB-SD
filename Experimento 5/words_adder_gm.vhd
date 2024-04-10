-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 

-- ************
-- Circuito: Somador de palavras de 4 bits utilizando o operador + do pacore STD_LOGIC_ARITH
--           i_A, i_B   Palavras de 4 bits (Entrada)
--           o_S      Sa�da da soma das palavras (5 bits)
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE IEEE.std_logic_arith.ALL;

-- ************ Entity ************
-- pinos de entrada e saída
ENTITY words_adder_gm IS
   PORT (
      i_A, i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_S      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
   );
END ENTITY;

-- ************ Architecture ************
-- implementação do projeto
ARCHITECTURE words_adder_gm_arch OF words_adder_gm IS
BEGIN
   o_S <= "0" & (i_A) + (i_B);
END ARCHITECTURE;
