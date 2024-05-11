-- Universidade de Bras�lia
-- Laborat�rio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 

-- Cabe�alho com breve descri��o

-- ************
-- Circuito:
--
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e sa�da

-- Testbench para <circ>.vhd
-- Valida��o ass�ncrona
ENTITY testbench IS END;

-- ************ Architecture ************
-- implementa��o do projeto

ARCHITECTURE tb_ OF testbench IS
   -- declara��o do componente <circ> de acordo com sua arquitetura no arquivo <circ>.vhd
   COMPONENT circ
      PORT (
         -- declara��o dos pinos de entrada
         -- declara��o dos pinos de sa�da
      );
   END COMPONENT;

   -- Sinais auxiliares para a simula��o dos est�mulos ao circuito
   SIGNAL a_ : STD_LOGIC;

   -- Inst�nciaa do componente <circ> e conex�o dos sinais
BEGIN
   circ_ : circ PORT MAP(
      -- conex�o dos pinos de entrada
      -- conex�o dos pinos de sa�da
   );

   -- Processo para gerar os est�mulos
   estimulo : PROCESS
   BEGIN
      WAIT FOR 10 ns;
      a_ <= '0';
      WAIT FOR 10 ns;
      a_ <= '1';

      WAIT;
   END PROCESS estimulo;
END tb_;
