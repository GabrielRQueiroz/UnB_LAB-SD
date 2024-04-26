-- Universidade de Brasília
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
-- testbench: uma entidade sem pinos de entrada e saída

-- Testbench para <circ>.vhd
-- Validação assíncrona
ENTITY testbench IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_ OF testbench IS
   -- declaração do componente <circ> de acordo com sua arquitetura no arquivo <circ>.vhd
   COMPONENT circ
      PORT (
         -- declaração dos pinos de entrada
         -- declaração dos pinos de saída
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulação dos estímulos ao circuito
   SIGNAL a_ : STD_LOGIC;

   -- Inst�nciaa do componente <circ> e conexão dos sinais
BEGIN
   circ_ : circ PORT MAP(
      -- conexão dos pinos de entrada
      -- conexão dos pinos de saída
   );

   -- Processo para gerar os estímulos
   estimulo : PROCESS
   BEGIN
      WAIT FOR 10 ns;
      a_ <= '0';
      WAIT FOR 10 ns;
      a_ <= '1';

      WAIT;
   END PROCESS estimulo;
END tb_;
