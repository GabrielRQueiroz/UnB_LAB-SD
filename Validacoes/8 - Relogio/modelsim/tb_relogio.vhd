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
         clock   : IN STD_LOGIC;
         horas   : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
         minutos : OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
   END COMPONENT;

   COMPONENT contador10000_relogio IS PORT (
      clock                               : IN STD_LOGIC;
      reset                               : IN STD_LOGIC;
      enable                              : IN STD_LOGIC;
      load                                : IN STD_LOGIC;
      milload, centload, dezload, uniload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      milhar, centena, dezena, unidade    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
   END COMPONENT;

   COMPONENT timeflags_relogio IS PORT (
      milhar  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      centena : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      dezena  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      unidade : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      T59     : OUT STD_LOGIC;
      T3599   : OUT STD_LOGIC);
   END COMPONENT;

   SIGNAL x_CLK                                    : STD_LOGIC := '1';
   SIGNAL x_MILHAR, x_CENTENA, x_DEZENA, x_UNIDADE : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
   relogio_inst : relogio PORT MAP(
      clock   => x_CLK,
      horas   => OPEN,
      minutos => OPEN
   );

   x_CLK <= NOT x_CLK AFTER 0.5 sec;

   estimulo : PROCESS
   BEGIN
      WAIT FOR 10 sec;
      WAIT;
   END PROCESS;

END tb_relogio_arch;
