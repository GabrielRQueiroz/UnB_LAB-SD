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
ENTITY tb_visto1 IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_visto1_arch OF tb_visto1 IS
   COMPONENT contador10 IS
      PORT (
         clock  : IN STD_LOGIC;
         reset  : IN STD_LOGIC;
         enable : IN STD_LOGIC;
         rci    : IN STD_LOGIC;
         load   : IN STD_LOGIC;
         D      : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         Q      : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         rco    : OUT STD_LOGIC);
   END COMPONENT;

   COMPONENT contador100 IS
      PORT (
         clock   : IN STD_LOGIC;
         reset   : IN STD_LOGIC;
         enable  : IN STD_LOGIC;
         load    : IN STD_LOGIC;
         dezload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         uniload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         dezena  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         unidade : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
   END COMPONENT;
   SIGNAL x_CLK, x_RESET, x_ENABLE, x_LOAD : STD_LOGIC := '1';
   SIGNAL x_RCI                            : STD_LOGIC;
   SIGNAL x_D, x_DEZLOAD, x_UNILOAD        : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
   contador10_inst : contador10 PORT MAP(
      clock  => x_CLK,
      reset  => x_RESET,
      enable => x_ENABLE,
      rci    => x_RCI,
      load   => x_LOAD,
      D      => x_D,
      Q      => OPEN,
      rco    => OPEN
   );

   contador100_inst : contador100 PORT MAP(
      clock   => x_CLK,
      reset   => x_RESET,
      enable  => x_ENABLE,
      load    => x_LOAD,
      dezload => x_DEZLOAD,
      uniload => x_UNILOAD,
      dezena  => OPEN,
      unidade => OPEN
   );

   x_CLK    <= NOT x_CLK AFTER 500 ns;
   x_RESET  <= '0' AFTER 2000 ns;
   x_ENABLE <= '0' AFTER 4000 ns;

   estimulo : PROCESS
   BEGIN
      WAIT FOR 4000 NS;

      FOR i IN 9 TO 0 LOOP
         x_DEZLOAD <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
         FOR i IN 9 TO 0 LOOP
            x_UNILOAD <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            WAIT FOR 1000 ns;
         END LOOP;
         WAIT FOR 1000 ns;
      END LOOP;

      x_LOAD <= '0';
   END PROCESS;

END tb_visto1_arch;
