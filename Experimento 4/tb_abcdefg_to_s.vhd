-- Universidade de Brasí­lia
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 26/04/2024

-- ************
-- Testbench para a simulação do
-- Circuito: Entidade que recebe como entrada 7 bits de entrada e gera 1 bit de sa�da
--         A, B, C, D, E, F, G    Bits de entrada
--         S                      Bit de sa��da
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saÃ­da

-- Testbench para abcdefg_to_s.vhd
-- Validação assíncrona
ENTITY abcdefg_to_s_testbench IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_abcdefg_to_s OF abcdefg_to_s_testbench IS
   -- declaração do componente abcdefg_to_s de acordo com sua arquitetura no arquivo abcdefg_to_s.vhd
   COMPONENT abcdefg_to_s
      PORT (
         i_A, i_B, i_C, i_D, i_E, i_F, i_G : IN STD_LOGIC;
         o_S                               : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulação dos estí­mulos ao circuito
   SIGNAL w_A_AUX, w_B_AUX, w_C_AUX, w_D_AUX, w_E_AUX, w_F_AUX, w_G_AUX : STD_LOGIC;
   SIGNAL w_INPUT_VECTOR                                                : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";

   -- Instância do componente abcdefg_to_s e conexão dos sinais
BEGIN
   abcdefg_circuit : abcdefg_to_s PORT MAP(
      -- conexão dos pinos de entrada
      i_A => w_A_AUX,
      i_B => w_B_AUX,
      i_C => w_C_AUX,
      i_D => w_D_AUX,
      i_E => w_E_AUX,
      i_F => w_F_AUX,
      i_G => w_G_AUX,
      -- conexão dos pinos de saída
      o_S => OPEN
   );

   -- Processo para gerar os estÃ­íulos
   estimulo : PROCESS
   BEGIN
      FOR i IN 0 TO 127 LOOP
         WAIT FOR 5 ns;
         w_INPUT_VECTOR <= STD_LOGIC_VECTOR(to_unsigned(i, 7));
         w_A_AUX <= w_INPUT_VECTOR(0);
         w_B_AUX <= w_INPUT_VECTOR(1);
         w_C_AUX <= w_INPUT_VECTOR(2);
         w_D_AUX <= w_INPUT_VECTOR(3);
         w_E_AUX <= w_INPUT_VECTOR(4);
         w_F_AUX <= w_INPUT_VECTOR(5);
         w_G_AUX <= w_INPUT_VECTOR(6);

      END LOOP;

      WAIT;
   END PROCESS estimulo;

END tb_abcdefg_to_s;
