-- Universidade de Bras�lia
-- Laborat�rio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 12/04/2024

-- ************
-- Circuito: Multiplexador 4x1 com 4 bits de dados, 2 bits de sele��o e uma sa�da:
--          data  Entrada de 4 bits de dados
--          sel   Entrada de 2 bits de seleção
--          y     Sa�da do mux
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e sa�da

ENTITY multiplex_4x1 IS
  PORT (
    data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    sel  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    y    : OUT STD_LOGIC
  );
END multiplex_4x1;
-- ************ Architecture ************
-- implementa��o do projeto

ARCHITECTURE multiplex_4x1_arch OF multiplex_4x1 IS
BEGIN
  WITH sel SELECT
    y <= data(3) WHEN "11",
    data(2) WHEN "10",
    data(1) WHEN "01",
    data(0) WHEN "00",
    '0' WHEN OTHERS;
END multiplex_4x1_arch;
