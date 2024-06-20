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
ENTITY tb_visto3 IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_visto3_arch OF tb_visto3 IS
   COMPONENT exp8visto3 IS
      PORT (
         clock        : IN STD_LOGIC;
         ligadesliga  : IN STD_LOGIC;
         sensorA      : IN STD_LOGIC;
         sensorB      : IN STD_LOGIC;
         dezena       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         unidade      : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
         RYGsemaforoA : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         RYGsemaforoB : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
   END COMPONENT;

   SIGNAL x_CLK, x_SENSOR_A, x_SENSOR_B : STD_LOGIC := '1';
   SIGNAL x_LIGADESLIGA                 : STD_LOGIC := '0';
BEGIN
   semaforos : exp8visto3 PORT MAP(
      clock        => x_CLK,
      ligadesliga  => x_LIGADESLIGA,
      sensorA      => x_SENSOR_A,
      sensorB      => x_SENSOR_B,
      dezena       => OPEN,
      unidade      => OPEN,
      RYGsemaforoA => OPEN,
      RYGsemaforoB => OPEN
   );

   x_CLK         <= NOT x_CLK AFTER 0.5 sec;
   x_LIGADESLIGA <= '1' AFTER 12.5 sec;

   estimulo : PROCESS
   BEGIN
      -- Carro nos dois sensores
      WAIT FOR 95 sec;

      -- Nenhum carro no sensor B, mas no sensor A
      x_SENSOR_B <= '0';

      WAIT FOR 26 sec;

      -- Nenhum carro no sensor A, mas no sensor B
      x_SENSOR_A <= '0';
      x_SENSOR_B <= '1';

      WAIT FOR 26 sec;

      -- Nenhum carro em nenhum dos sensores
      x_SENSOR_A <= '0';
      x_SENSOR_B <= '0';

      WAIT FOR 142 sec;

      -- Carro no sensor A chega
      x_SENSOR_A <= '1';

      WAIT FOR 150 sec;
      WAIT;

   END PROCESS;

END tb_visto3_arch;
