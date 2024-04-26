-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 03/05/2024

-- ************
-- Testbench para a simulação do
-- Circuito: Somador de palavras de 4 bits utilizando o operador + do pacore STD_LOGIC_ARITH
--           i_A, i_B   Palavras de 4 bits (Entrada)
--           o_S      Saída da soma das palavras (5 bits)
--
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;
USE std.env.stop;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saída

-- Testbench para words_adder.vhd
-- Validação assíncrona
ENTITY words_adder_testbench IS
   port (
      words_adder_dut, words_adder_gm : in std_logic;
      f: out std_logic
   );
END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_words_adder OF words_adder_testbench IS
   -- declaração do componente words_adder de acordo com sua arquitetura no arquivo words_adder.vhd
   COMPONENT words_adder_dut
      PORT (
         -- declaração dos pinos de entrada
         i_A, i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         -- declaração dos pinos de saída
         o_S : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT words_adder_gm
      PORT (
         -- declaração dos pinos de entrada
         i_A, i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         -- declaração dos pinos de saída
         o_S : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulação dos estímulos ao circuito
   SIGNAL x_A, x_B            : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL x_DUT_OUT, x_GM_OUT : STD_LOGIC_VECTOR(4 DOWNTO 0);

   FUNCTION check_output_equality(a, b : STD_LOGIC_VECTOR(4 DOWNTO 0)) RETURN BOOLEAN IS
   BEGIN
      IF (a = b) THEN
         RETURN TRUE;
      ELSE
         RETURN FALSE;
      END IF;
   END FUNCTION check_output_equality;

BEGIN
   -- Instância do componente words_adder e conexão dos sinais
   dut_adder : words_adder_dut PORT MAP(
      -- conexão dos pinos de entrada
      i_A => x_A,
      i_B => x_B,
      -- conexão dos pinos de saída
      o_S => x_DUT_OUT
   );
   gm_adder : words_adder_gm PORT MAP(
      -- conexão dos pinos de entrada
      i_A => x_A,
      i_B => x_B,
      -- conexão dos pinos de saída
      o_S => x_GM_OUT
   );

   -- Processo para gerar os estímulos
   estimulo : PROCESS
   BEGIN

      FOR i IN 0 TO 15 LOOP
         FOR j IN 0 TO 15 LOOP
            IF (check_output_equality(x_DUT_OUT, x_GM_OUT) = FALSE) THEN
               ASSERT FALSE REPORT "Saídas dos componentes não coincidem" SEVERITY FAILURE;
               stop;
            END IF;

            x_A <= STD_LOGIC_VECTOR(to_unsigned(i, 4));
            x_B <= STD_LOGIC_VECTOR(to_unsigned(j, 4));
            WAIT FOR 500 ns;
         END LOOP;
      END LOOP;

      WAIT;
   END PROCESS estimulo;
END tb_words_adder;
