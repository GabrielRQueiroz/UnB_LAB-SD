
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saída

-- Testbench para ff_jk.vhd
-- Validadção assíncrona
ENTITY somador_testbench IS END;

-- ************ Architecture ************
-- implementadção do projeto

ARCHITECTURE tb_eight_bits_adder OF somador_testbench IS
   -- declaradção do componente flip_flop_JK de acordo com sua arquitetura no arquivo ff_jk.vhd
   COMPONENT eight_bit_adder IS
      PORT (
         i_A, i_B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         o_S      : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
      );
   END COMPONENT;

   -- Sinais auxiliares para a simuladção dos estímulos ao circuito
   SIGNAL x_A, x_B : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";

   -- Instância do componente flip_flop_JK e conexão dos sinais
BEGIN
   adder : eight_bit_adder PORT MAP(
      -- conexão dos pinos de entrada
      i_A => x_A,
      i_B => x_B,
      -- conexão dos pinos de saída
      o_S => OPEN
   );

   -- Processo para gerar os estímulos
   estimulo : PROCESS
   BEGIN
      FOR i IN 0 TO 255 LOOP
         WAIT FOR 10 ns;

         FOR j IN 0 TO 255 LOOP
            WAIT FOR 10 ns;
            x_B <= x_B + '1';
         END LOOP;

         x_A <= x_A + '1';
      END LOOP;
      WAIT;
   END PROCESS estimulo;
END tb_eight_bits_adder;
