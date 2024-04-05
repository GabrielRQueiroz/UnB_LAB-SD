-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 12/04/2024

-- Somador completo de três bits de entrada e dois bits de saída (soma e carry out)

-- ************
-- Circuito: Somador completo de três entradas:
--          a    Entrada A de 1 bit
--          b    Entrada B de 1 bit
--          cin  Entrada de carry in (vai-um) de 1 bit
--          s    Saída da soma de 1 bit
--          cout Saída do carry out (vai-um) de 1 bit
-- ************

-- ************ Package ************
-- constantes e bibliotecas

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída

ENTITY somador_completo IS
  PORT (
    a, b, cin : IN STD_LOGIC;
    s         : OUT STD_LOGIC;
    cout      : OUT STD_LOGIC
  );
END somador_completo;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE somador_arch OF somador_completo IS
BEGIN
  s    <= a XOR b XOR cin;
  cout <= (a AND b) OR (cin AND A) OR (cin AND b);
END somador_ARCH;
