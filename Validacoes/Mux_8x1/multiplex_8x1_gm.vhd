-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 03/05/2024

-- ************
-- Circuito: Multiplexador 8x1 com 8 bits de dados, 3 bits de seleção e uma saída:
--          i_DATA  Entrada de 8 bits de dados
--          i_SEL   Entrada de 3 bits de seleção
--          o_Y     Saída do mux
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída

ENTITY multiplex_8x1_gm IS
  PORT (
    i_DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    i_SEL  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    o_Y    : OUT STD_LOGIC
  );
END multiplex_8x1_gm;
-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE multiplex_8x1_gm_arch OF multiplex_8x1_gm IS
BEGIN
  WITH i_SEL SELECT
    o_Y <= i_DATA(7) WHEN "111",
    i_DATA(6) WHEN "110",
    i_DATA(5) WHEN "101",
    i_DATA(4) WHEN "100",
    i_DATA(3) WHEN "011",
    i_DATA(2) WHEN "010",
    i_DATA(1) WHEN "001",
    i_DATA(0) WHEN "000",
    '0' WHEN OTHERS;
END multiplex_8x1_gm_arch;
