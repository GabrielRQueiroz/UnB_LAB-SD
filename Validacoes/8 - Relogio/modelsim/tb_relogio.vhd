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
ENTITY tb_relogio IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_relogio_arch OF tb_relogio IS
   COMPONENT relogio IS
      PORT (
         clock           : IN STD_LOGIC;
         minutos_unidade : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         minutos_dezena  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         horas_unidade   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         horas_dezena    : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
      );
   END COMPONENT;

   SIGNAL x_CLK : STD_LOGIC := '1';
BEGIN
   relogio_inst : relogio PORT MAP(
      clock           => x_CLK,
      minutos_unidade => OPEN,
      minutos_dezena  => OPEN,
      horas_unidade   => OPEN,
      horas_dezena    => OPEN
   );

   x_CLK <= NOT x_CLK AFTER 0.5 sec;

   estimulo : PROCESS
   BEGIN
      WAIT FOR 10 sec;
      WAIT;
   END PROCESS;

END tb_relogio_arch;
