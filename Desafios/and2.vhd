-- Cabecalho contendo uma breve descricao do
-- dispositivo modelado ( Comentario opcional )
-- **************
-- Circuito : Porta E ( AND ) de duas entradas :
-- i1 Entrada 1
-- i2 Entrada 2
-- y Saida
-- **************
-- Package ( Pacote )
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
-- Entity ( Entidade )
-- pinos de entrada e saida
ENTITY AND2 IS PORT (
   i1 : IN STD_LOGIC;
   i2 : IN STD_LOGIC;
   clk: IN STD_LOGIC;
   y  : OUT STD_LOGIC);
END AND2;
-- Architecture ( Arquitetura ) i
-- implementacoes do projeto
ARCHITECTURE rtl OF AND2 IS
   -- a definicao inicia por
BEGIN
   -- y = f ( i1 , i2 )
   y <= i1 AND i2;
END rtl;
-- a definicao termina por end