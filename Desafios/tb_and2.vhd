-- Cabecalho contendo uma breve descricao do
-- dispositivo modelado ( comentario opcional )
-- **************
-- Testbench para simulacao Funcional do
-- Circuito : Porta E ( AND ) de duas entradas :
-- i1 Entrada 1
-- i2 Entrada 2
-- y Saida
-- **************
-- ENTITY ( Entidade )
-- testbench1 uma entidade sem pinos de entrada e saida
ENTITY testbench1 IS END;
-- Testbench para and2 . vhd
-- Validacao assincrona
-- Package ( Pacote )
-- constantes e bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
ARCHITECTURE tb_and2 OF testbench1 IS
   -- Declaracao do componente and2
   -- Declaracao do componente and2 , referente a sua arquitetura
   -- descrita no arquivo and2 . vhd
   COMPONENT AND2
      PORT (
         i1  : IN STD_LOGIC;
         i2  : IN STD_LOGIC;
         clk : IN STD_LOGIC;
         y   : OUT STD_LOGIC
      );
   END COMPONENT;
   -- Sinais auxiliares para a interconexao ao
   -- processo de estimulo
   SIGNAL i_1 : STD_LOGIC := '0';
   SIGNAL i_2 : STD_LOGIC := '0';
   SIGNAL clk : STD_LOGIC := '0';

   -- Instancia do componente and2 e interconexao
   -- do componente ao processo de estimulo
BEGIN
   and1 : AND2 PORT MAP(i1 => i_1, i2 => i_2, clk => clk, y => OPEN);
   -- Implementacao do processo de estimulo
   estimulo : PROCESS
   BEGIN
      clk <= NOT clk AFTER 5 ns;
      WAIT FOR 5 ns;
      
      FOR i IN 0 TO 6 LOOP


         i_2 <= NOT i_2 AFTER 5 ns;

         i_1 <= NOT i_1 AFTER 10 ns;

         WAIT FOR 10 ns;
      END LOOP;
      WAIT;
   END PROCESS estimulo;
END tb_and2;
