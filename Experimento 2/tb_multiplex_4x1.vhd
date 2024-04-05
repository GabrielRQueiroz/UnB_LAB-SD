-- Universidade de BrasÌ≠lia
-- LaboratÛrio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 12/04/2024

-- ************
-- Testbench para a simulaÁ„o do
-- Circuito: Multiplexador 4x1 com 4 bits de dados, 2 bits de seleÁ„o e uma saÌ≠da:
--          data   Entrada de 4 bits de dados
--          sel   Entrada de 2 bits de seleÁ„o
--          y   SaÌ≠da do mux
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e sa√≠da

-- Testbench para multiplex_4x1.vhd
-- ValidaÁ„o assÌncrona
ENTITY multiplex_testbench IS END;

-- ************ Architecture ************
-- implementaÁ„o do projeto

ARCHITECTURE tb_multiplex_4x1 OF multiplex_testbench IS
   -- declaraÁ„o do componente multiplex_4x1 de acordo com sua arquitetura no arquivo multiplex_4x1.vhd
   COMPONENT multiplex_4x1
      PORT (
         -- declaraÁ„o dos pinos de entrada
         data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         sel  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         -- declaraÁ„o dos pinos de sa√≠da
         y : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulaÁ„o dos estÌ≠mulos ao circuito
   SIGNAL data_aux : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
   SIGNAL sel_aux  : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";

   -- Inst‚ncia do componente multiplex_4x1 e conex„o dos sinais
BEGIN
   multiplex : multiplex_4x1 PORT MAP(
      -- conex„o dos pinos de entrada
      data => data_aux,
      sel  => sel_aux,
      -- conex„o dos pinos de saÌda
      y => OPEN
   );

   -- Processo para gerar os est√≠Ìulos
   estimulo : PROCESS
   BEGIN
      WAIT FOR 5 ns;
      sel_aux <= "01";
      WAIT FOR 5 ns;
      sel_aux <= "10";
      WAIT FOR 5 ns;
      sel_aux <= "11";
      WAIT FOR 5 ns;

      data_aux <= "1000";
      sel_aux  <= "00";
      WAIT FOR 5 ns;
      sel_aux <= "01";
      WAIT FOR 5 ns;
      sel_aux <= "10";
      WAIT FOR 5 ns;
      sel_aux <= "11";
      WAIT FOR 5 ns;

      data_aux <= "0100";
      sel_aux  <= "00";
      WAIT FOR 5 ns;
      sel_aux <= "01";
      WAIT FOR 5 ns;
      sel_aux <= "10";
      WAIT FOR 5 ns;
      sel_aux <= "11";
      WAIT FOR 5 ns;

      data_aux <= "0010";
      sel_aux  <= "00";
      WAIT FOR 5 ns;
      sel_aux <= "01";
      WAIT FOR 5 ns;
      sel_aux <= "10";
      WAIT FOR 5 ns;
      sel_aux <= "11";
      WAIT FOR 5 ns;

      data_aux <= "0001";
      sel_aux  <= "00";
      WAIT FOR 5 ns;
      sel_aux <= "01";
      WAIT FOR 5 ns;
      sel_aux <= "10";
      WAIT FOR 5 ns;
      sel_aux <= "11";

      WAIT;
   END PROCESS estimulo;
END tb_multiplex_4x1;
