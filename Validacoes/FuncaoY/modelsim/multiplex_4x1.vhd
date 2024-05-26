-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 12/04/2024

-- ************
-- Circuito: Multiplexador 4x1 com 4 bits de dados, 2 bits de seleção e uma saída:
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

ENTITY multiplex_4x1 IS
  PORT (
    i_DATA : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_SEL  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    o_Y    : OUT STD_LOGIC
  );
END multiplex_4x1;
-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE multiplex_4x1_arch OF multiplex_4x1 IS
BEGIN
  WITH i_SEL SELECT
    o_Y <= i_DATA(3) WHEN "11",
    i_DATA(2) WHEN "10",
    i_DATA(1) WHEN "01",
    i_DATA(0) WHEN "00",
    '0' WHEN OTHERS;
END multiplex_4x1_arch;
