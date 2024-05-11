-- Universidade de Brasí­lia
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 
-- ************
-- Circuito: Máquina de refrigerante com entrada para moedas de 25 e 50 centavos, entregando a bebida ao acumular 1 real.
--           Se a máquina receber mais de 1 real, ela devolve o troco em moedas de 25 centavos.
--           A operação pode ser cancelada a qualquer momento, devolvendo o dinheiro inserido em moedas de 25 e/ou 50 centavos
--           i_A         : Entrada de 2 bits (00: Idle,
--                                            01: 25 centavos,
--                                            10: 50 centavos,
--                                            11: Cancelar)
--           i_RESET     : Reset assíncrono da máquina ao estado Idle
--           i_CLK       : Clock
--           o_S         : Saíde de 3 bits (000: Idle,
--                                          001: troco 50 centavos,
--                                          010: 25 centavos,
--                                          011: troco 75 centavos,
--                                          100: Entregar refri,
--                                          101: Entregar refri e devolcer 50 centavos,
--                                          110: Entregar refri e devolver 25 centavos,
--                                          111: Entregar refri e devolver 75 centavos)
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saí­da

-- Testbench para maquina_refri.vhd
-- Validação assí­ncrona
ENTITY testbench IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_maquina_refri OF testbench IS
   -- declaração do componente maquina_refri de acordo com sua arquitetura no arquivo maquina_refri.vhd
   COMPONENT maquina_refri
      PORT (
         -- declaração dos pinos de entrada
         i_A            : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         i_RESET, i_CLK : IN STD_LOGIC;
         -- declaração dos pinos de saí­da
         o_DROP_SODA, o_RETURN_25, o_RETURN_50 : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulação dos estí­mulos ao maquina_refriuito
   SIGNAL x_A            : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL x_RESET, x_CLK : STD_LOGIC := '0';
   CONSTANT CLOCK_PERIOD : TIME      := 10 ns;

BEGIN
   -- Instânciaa do componente maquina_refri e conexão dos sinais
   comp_maquina_refri : maquina_refri PORT MAP(
      -- conexão dos pinos de entrada
      i_A     => x_A,
      i_RESET => x_RESET,
      i_CLK   => x_CLK,
      -- conexão dos pinos de saí­da
      o_DROP_SODA => OPEN,
      o_RETURN_25 => OPEN,
      o_RETURN_50 => OPEN
   );

   -- Processo para gerar os estí­mulos
   x_CLK <= NOT x_CLK AFTER CLOCK_PERIOD/2;

   estimulo : PROCESS
   BEGIN
      -- Test soda drop without refunds
      -- 50+50
      x_A <= "10";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "10";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';
      -- OR 25+25+25+25
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';
      -- OR 25+50+25
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "10";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';
      -- OR 50+25+25
      x_A <= "10";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';
      -- OR 25+25+50
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "10";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';

      -- Test soda drop with refunds
      x_A <= "10";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "10";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';

      -- Test 25 refund
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "11";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';

      -- Test 50 refund
      -- 50
      x_A <= "10";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "11";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';
      -- OR 25+25
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "11";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';

      -- Test 75 refund
      -- 50+25
      x_A <= "10";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "11";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';
      -- OR 25+50
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "10";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "11";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';
      -- OR 25+25+25
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "11";
      WAIT FOR CLOCK_PERIOD;
      x_RESET <= '1';
      WAIT FOR CLOCK_PERIOD/1000;
      x_RESET <= '0';

      -- Test Idle states
      -- Idle with 25
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "00";
      WAIT FOR 3 * CLOCK_PERIOD;
      -- Idle with 50
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "00";
      WAIT FOR 3 * CLOCK_PERIOD;
      -- Idle with 75
      x_A <= "01";
      WAIT FOR CLOCK_PERIOD;
      x_A <= "00";
      WAIT FOR 3 * CLOCK_PERIOD;

      WAIT;
   END PROCESS estimulo;
END tb_maquina_refri;
