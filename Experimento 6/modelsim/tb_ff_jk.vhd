-- Universidade de Bras�lia
-- Laborat�rio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 31/05/24

-- ************
-- Circuito: Flip flop do tipo JK sens�vel a borda de subida
--           i_PR, i_CLR, i_CLK, i_J, i_K    Entradas de 1 bit
--           o_Q                             Sa�da de 1 bit
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e sa�da

-- Testbench para ff_jk.vhd
-- Validad��o ass�ncrona
ENTITY ff_testbench IS END;

-- ************ Architecture ************
-- implementad��o do projeto

ARCHITECTURE tb_flip_flop_jk OF ff_testbench IS
   -- declarad��o do componente flip_flop_JK de acordo com sua arquitetura no arquivo ff_jk.vhd
   COMPONENT flip_flop_JK
      PORT (
         -- declarad��o dos pinos de entrada
         i_PR, i_CLR, i_CLK, i_J, i_K : IN STD_LOGIC;
         -- declarad��o dos pinos de sa�da
         o_Q : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulad��o dos est�mulos ao circuito
   SIGNAL x_CLK, x_J, x_K : STD_LOGIC := '0';
   SIGNAL x_PR, x_CLR     : STD_LOGIC := '1';

   -- Inst�ncia do componente flip_flop_JK e conex�o dos sinais
BEGIN
   flip_flop : flip_flop_JK PORT MAP(
      -- conex�o dos pinos de entrada
      i_PR => x_PR, i_CLR => x_CLR, i_CLK => x_CLK, i_J => x_J, i_K => x_K,
      -- conex�o dos pinos de sa�da
      o_Q => OPEN
   );

   -- Processo para gerar os est�mulos
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
