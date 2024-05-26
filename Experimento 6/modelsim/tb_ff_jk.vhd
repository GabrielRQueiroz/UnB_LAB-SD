-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 31/05/24

-- ************
-- Circuito: Flip flop do tipo JK sensível a borda de subida
--           i_PR, i_CLR, i_CLK, i_J, i_K    Entradas de 1 bit
--           o_Q                             Saída de 1 bit
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saída

-- Testbench para ff_jk.vhd
-- Validadção assíncrona
ENTITY ff_testbench IS END;

-- ************ Architecture ************
-- implementadção do projeto

ARCHITECTURE tb_flip_flop_jk OF ff_testbench IS
   -- declaradção do componente flip_flop_JK de acordo com sua arquitetura no arquivo ff_jk.vhd
   COMPONENT flip_flop_JK
      PORT (
         -- declaradção dos pinos de entrada
         i_PR, i_CLR, i_CLK, i_J, i_K : IN STD_LOGIC;
         -- declaradção dos pinos de saída
         o_Q : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais auxiliares para a simuladção dos estímulos ao circuito
   SIGNAL x_CLK, x_J, x_K : STD_LOGIC := '0';
   SIGNAL x_PR, x_CLR     : STD_LOGIC := '1';

   -- Instância do componente flip_flop_JK e conexão dos sinais
BEGIN
   flip_flop : flip_flop_JK PORT MAP(
      -- conexão dos pinos de entrada
      i_PR => x_PR, i_CLR => x_CLR, i_CLK => x_CLK, i_J => x_J, i_K => x_K,
      -- conexão dos pinos de saída
      o_Q => OPEN
   );

   -- Processo para gerar os estímulos
   x_CLK <= NOT x_CLK AFTER 5 ns;
   x_K   <= NOT x_K AFTER 10 ns;
   x_J   <= NOT x_J AFTER 25 ns;

   estimulo : PROCESS
   BEGIN
      WAIT FOR 50 ns;
      x_PR <= '0';
      WAIT FOR 50 ns;
      x_CLR <= '0';
      WAIT;
   END PROCESS estimulo;
END tb_flip_flop_jk;
