-- Universidade de Bras�lia
-- Laborat�rio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 19/04/2024

-- ************
-- Testbench para a simula��o do
-- Circuito: Multiplexador 8x1 com 8 bits de dados, 3 bits de sele��o e uma sa�da:
--          data   Entrada de 8 bits de dados
--          sel   Entrada de 3 bits de sele��o
--          y   Sa�da do mux
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
         data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         sel  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         -- declara��o dos pinos de saída
         y : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais auxiliares para a simula��o dos est�mulos ao circuito
   SIGNAL data_aux : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
   SIGNAL sel_aux  : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";

   -- Inst�ncia do componente multiplex_8x1 e conex�o dos sinais
BEGIN
   multiplex : multiplex_8x1 PORT MAP(
      -- conex�o dos pinos de entrada
      data => data_aux,
      sel  => sel_aux,
      -- conex�o dos pinos de sa�da
      y => OPEN
   );

   -- Processo para gerar os estí�ulos
   estimulo : PROCESS
   BEGIN
         for i in 0 to 7 loop
            WAIT FOR 5 ns;
            -- Only one bit 1 in data
            data_aux <= std_logic_vector(to_unsigned(2**i, 8));
            for j in 0 to 7 loop
               WAIT FOR 5 ns;
               sel_aux <= std_logic_vector(to_unsigned(j, 3));
            end loop;
         end loop;
      
      WAIT;
   END PROCESS estimulo;
END tb_multiplex_8x1;
