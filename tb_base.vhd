-- Universidade de Brasí­lia
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 

-- Cabeçalho com breve descrição

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
-- testbench: uma entidade sem pinos de entrada e saí­da

-- Testbench para <circ>.vhd
-- Validação assí­ncrona
ENTITY testbench IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_ OF testbench IS
   -- declaração do componente <circ> de acordo com sua arquitetura no arquivo <circ>.vhd
   COMPONENT circ
      PORT (
         -- declaração dos pinos de entrada
         -- declaração dos pinos de saí­da
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulação dos estí­mulos ao circuito
   SIGNAL a_ : STD_LOGIC;

   -- Instânciaa do componente <circ> e conexão dos sinais
BEGIN
   circ_ : circ PORT MAP(
      -- conexão dos pinos de entrada
      -- conexão dos pinos de saí­da
   );

   -- Processo para gerar os estí­mulos
   estimulo : PROCESS
   BEGIN
      WAIT FOR 10 ns;
      a_ <= '0';
      WAIT FOR 10 ns;
      a_ <= '1';

      WAIT;
   END PROCESS estimulo;
END tb_;
