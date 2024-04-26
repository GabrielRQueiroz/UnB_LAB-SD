-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 12/04/2024

-- Somador completo de três bits de entrada e dois bits de saída (soma e carry out)

-- ************
-- Circuito: Somador completo de três entradas:
--          i_A    Entrada A de 1 bit
--          i_B    Entrada B de 1 bit
--          i_CIN  Entrada de carry in (vai-um) de 1 bit
--          o_S    Saída da soma de 1 bit
--          o_COUT Saída do carry out (vai-um) de 1 bit
-- ************

-- ************ Package ************
-- constantes e bibliotecas

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída

ENTITY somador_completo IS
  PORT (
    i_A, i_B, i_CIN : IN STD_LOGIC;
    o_S             : OUT STD_LOGIC;
    o_COUT          : OUT STD_LOGIC
  );
END somador_completo;

-- ************ Architecture ************
-- implementa��o do projeto

ARCHITECTURE somador_arch OF somador_completo IS
BEGIN
  o_S    <= i_A XOR i_B XOR i_CIN;
  o_COUT <= (i_A AND i_B) OR (i_CIN AND i_A) OR (i_CIN AND i_B);
END somador_ARCH;
