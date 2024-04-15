-- Universidade de Bras�lia
-- Laborat�rio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 19/04/2024

-- ************
-- Testbench para a simula��o do
-- Circuito: Multiplexador 8x1 com 8 bits de dados, 3 bits de sele��o e uma sa�da:
--          i_DATA  Entrada de 8 bits de dados
--          i_SEL   Entrada de 3 bits de sele��o
--          o_Y     Sa�da do mux
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saída

-- Testbench para multiplex_8x1.vhd
-- Valida��o ass�ncrona
ENTITY multiplex_8x1_testbench IS END;

-- ************ Architecture ************
-- implementa��o do projeto

ARCHITECTURE tb_multiplex_8x1 OF multiplex_8x1_testbench IS
   -- declara��o do componente multiplex_8x1 de acordo com sua arquitetura no arquivo multiplex_8x1.vhd
   COMPONENT multiplex_8x1
      PORT (
         -- declara��o dos pinos de entrada
         i_DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         i_SEL  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         -- declara��o dos pinos de saída
         o_Y : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais auxiliares para a simula��o dos est�mulos ao circuito
   SIGNAL x_DATA_AUX : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
   SIGNAL x_SEL_AUX  : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";

   -- Inst�ncia do componente multiplex_8x1 e conex�o dos sinais
BEGIN
   multiplex : multiplex_8x1 PORT MAP(
      -- conex�o dos pinos de entrada
      i_DATA => x_DATA_AUX,
      i_SEL  => x_SEL_AUX,
      -- conex�o dos pinos de sa�da
      o_Y => OPEN
   );

   -- Processo para gerar os estí�ulos
   estimulo : PROCESS
   BEGIN
      FOR i IN 0 TO 7 LOOP
         WAIT FOR 5 ns;
         x_DATA_AUX <= STD_LOGIC_VECTOR(to_unsigned(2 ** i, 8));
         FOR j IN 0 TO 7 LOOP
            WAIT FOR 5 ns;
            x_SEL_AUX <= STD_LOGIC_VECTOR(to_unsigned(j, 3));
         END LOOP;
      END LOOP;

      WAIT;
   END PROCESS estimulo;
END tb_multiplex_8x1;
