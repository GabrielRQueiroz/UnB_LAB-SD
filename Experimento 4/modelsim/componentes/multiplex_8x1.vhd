-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 19/04/2024

-- ************
-- Circuito: Multiplexador 8x1 com 8 bits de dados, 2 bits de seleção e uma saída:
--          i_DATA  Entrada de 4 bits de dados
--          i_SEL   Entrada de 2 bits de seleção
--          o_Y     Saída do mux
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída

ENTITY multiplex_8x1 IS
  PORT (
    i_DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    i_SEL  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    o_Y    : OUT STD_LOGIC
  );
END multiplex_8x1;
-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE multiplex_8x1_arch OF multiplex_8x1 IS
BEGIN
  o_Y <= i_DATA(0) WHEN i_SEL = "000" ELSE
    i_DATA(1) WHEN i_SEL = "001" ELSE
    i_DATA(2) WHEN i_SEL = "010" ELSE
    i_DATA(3) WHEN i_SEL = "011" ELSE
    i_DATA(4) WHEN i_SEL = "100" ELSE
    i_DATA(5) WHEN i_SEL = "101" ELSE
    i_DATA(6) WHEN i_SEL = "110" ELSE
    i_DATA(7) WHEN i_SEL = "111";
END multiplex_8x1_arch;
