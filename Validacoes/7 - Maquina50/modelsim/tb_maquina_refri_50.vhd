-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saí­da

-- Testbench para maquina_refri_50.vhd
-- Validação assí­ncrona
ENTITY testbench IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_maquina_refri_50 OF testbench IS
   -- declaração do componente maquina_refri_50 de acordo com sua arquitetura no arquivo maquina_refri_50.vhd
   COMPONENT maquina_refri_50
      PORT (
         -- declaração dos pinos de entrada
         i_A, i_CANCEL  : IN STD_LOGIC;
         i_RESET, i_CLK : IN STD_LOGIC;
         -- declaração dos pinos de saí­da
         o_DROP_SODA, o_RETURN_50 : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulação dos estí­mulos ao maquina_refri_50uito
   SIGNAL x_A, x_CANCEL, x_RESET, x_CLK : STD_LOGIC := '0';
   CONSTANT CLOCK_PERIOD                : TIME      := 10 ns;

BEGIN
   -- Instânciaa do componente maquina_refri_50 e conexão dos sinais
   comp_maquina_refri_50 : maquina_refri_50 PORT MAP(
      -- conexão dos pinos de entrada
      i_A      => x_A,
      i_CANCEL => x_CANCEL,
      i_RESET  => x_RESET,
      i_CLK    => x_CLK,
      -- conexão dos pinos de saí­da
      o_DROP_SODA => OPEN,
      o_RETURN_50 => OPEN
   );

   -- Processo para gerar os estí­mulos
   x_CLK <= NOT x_CLK AFTER CLOCK_PERIOD/2;

   estimulo : PROCESS
   BEGIN
      -- Test soda drop without
      -- 50+50
      x_A <= '1';
      WAIT FOR CLOCK_PERIOD;
      x_A <= '1';
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';
      
      -- Test 50 refund
      -- 50
      x_A <= '1';
      WAIT FOR CLOCK_PERIOD;
      x_CANCEL <= '1';
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET  <= '0';
      x_CANCEL <= '0';

      -- Idle with 50
      x_A <= '1';
      WAIT FOR CLOCK_PERIOD;
      x_A <= '0';
      WAIT FOR 3 * CLOCK_PERIOD;

      WAIT;
   END PROCESS estimulo;
END tb_maquina_refri_50;
