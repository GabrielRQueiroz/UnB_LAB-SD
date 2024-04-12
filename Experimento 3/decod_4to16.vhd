-- Universidade de Bras�lia
-- Laborat�rio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 19/04/2024

-- ************
-- Circuito: Decodificador de 4 para 16, que recebe como entrada um vetor de 4 bits e como sa�da um vetor de 16 bits:
--          i_A   Vetor de entrada de 4 bits
--          o_Y   Vetor de sa�da de 16 bits
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e sa�da

ENTITY decod_4to16 IS
  PORT (
    i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    o_Y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END decod_4to16;
-- ************ Architecture ************
-- implementa��o do projeto

ARCHITECTURE decod_4to16_arch OF decod_4to16 IS
BEGIN
  WITH i_A SELECT
    o_Y <= X"0001" WHEN "0000",
           X"0002" WHEN "0001",
           X"0004" WHEN "0010",
           X"0008" WHEN "0011",
           X"0010" WHEN "0100",
           X"0020" WHEN "0101",
           X"0040" WHEN "0110",
           X"0080" WHEN "0111",
           X"0100" WHEN "1000",
           X"0200" WHEN "1001",
           X"0400" WHEN "1010",
           X"0800" WHEN "1011",
           X"1000" WHEN "1100",
           X"2000" WHEN "1101",
           X"4000" WHEN "1110",
           X"8000" WHEN OTHERS;
END decod_4to16_arch;
