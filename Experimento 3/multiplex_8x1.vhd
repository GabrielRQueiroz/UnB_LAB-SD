-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 19/04/2024

-- ************
-- Circuito: Multiplexador 8x1 com 8 bits de dados, 2 bits de seleção e uma saída:
--          data  Entrada de 4 bits de dados
--          sel   Entrada de 2 bits de seleÃ§Ã£o
--          y     Saída do mux
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída

ENTITY multiplex_8x1 IS
  PORT (
    data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    sel  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    y    : OUT STD_LOGIC
  );
END multiplex_8x1;
-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE multiplex_8x1_arch OF multiplex_8x1 IS
BEGIN
  y <= data(0) WHEN sel = "000" ELSE
    data(1) WHEN sel = "001" ELSE
    data(2) WHEN sel = "010" ELSE
    data(3) WHEN sel = "011" ELSE
    data(4) WHEN sel = "100" ELSE
    data(5) WHEN sel = "101" ELSE
    data(6) WHEN sel = "110" ELSE
    data(7) WHEN sel = "111";
END multiplex_8x1_arch;
