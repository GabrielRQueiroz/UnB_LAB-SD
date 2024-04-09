-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 19/04/2024

-- ************
-- Circuito: Decodificador de 4 para 16, que recebe como entrada um vetor de 4 bits e como saída um vetor de 16 bits:
--          a   Vetor de entrada de 4 bits
--          y   Vetor de saída de 16 bits
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída

ENTITY decod_4to16 IS
  PORT (
    a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END decod_4to16;
-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE decod_4to16_arch OF decod_4to16 IS
BEGIN
  WITH a SELECT
    y <= "0000000000000001" WHEN "0000",
    "0000000000000010" WHEN "0001",
    "0000000000000100" WHEN "0010",
    "0000000000001000" WHEN "0011",
    "0000000000010000" WHEN "0100",
    "0000000000100000" WHEN "0101",
    "0000000001000000" WHEN "0110",
    "0000000010000000" WHEN "0111",
    "0000000100000000" WHEN "1000",
    "0000001000000000" WHEN "1001",
    "0000010000000000" WHEN "1010",
    "0000100000000000" WHEN "1011",
    "0001000000000000" WHEN "1100",
    "0010000000000000" WHEN "1101",
    "0100000000000000" WHEN "1110",
    "1000000000000000" WHEN OTHERS;
END decod_4to16_arch;
