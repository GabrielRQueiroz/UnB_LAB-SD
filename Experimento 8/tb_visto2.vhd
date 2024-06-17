-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 21/06/2024

-- ************
-- Testbench para a simulação do
-- Circuito: Somador de palavras de 4 bits utilizando o operador + do pacore STD_LOGIC_ARITH
--           i_A, i_B   Palavras de 4 bits (Entrada)
--           o_S      Saída da soma das palavras (5 bits)
--
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saída

-- Testbench para words_adder.vhd
-- Validação assíncrona
ENTITY tb_visto2 IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_visto2_arch OF tb_visto2 IS
   COMPONENT exp8visto2 IS
      PORT (
         clock : IN STD_LOGIC;
         reset : IN STD_LOGIC;
         T60   : OUT STD_LOGIC;
         T20   : OUT STD_LOGIC;
         T6    : OUT STD_LOGIC;
         T5    : OUT STD_LOGIC
      );
   END COMPONENT;

   SIGNAL x_CLK, x_RESET : STD_LOGIC := '1';
BEGIN
   contador10_inst : exp8visto2 PORT MAP(
      clock => x_CLK,
      reset => x_RESET,
      T60   => OPEN,
      T20   => OPEN,
      T6    => OPEN,
      T5    => OPEN
   );

   x_CLK   <= NOT x_CLK AFTER 500 ns;
   x_RESET <= '0' AFTER 2000 ns;

   estimulo : PROCESS
   BEGIN
      WAIT FOR 102000 NS;
   END PROCESS;

END tb_visto2_arch;
