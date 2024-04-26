-- Universidade de Bras�lia
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 26/04/2024

-- ************
-- Testbench para a simula��o do
-- Circuito: Entidade que recebe como entrada 7 bits de entrada e gera 1 bit de sa�da
--         A, B, C, D, E, F, G    Bits de entrada
--         S                      Bit de sa�da
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e sa�dada

-- Testbench para abcdefg_to_s.vhd
-- Valida��o assíncrona
ENTITY abcdefg_to_s_testbench IS END;

-- ************ Architecture ************
-- implementa��o do projeto

ARCHITECTURE tb_abcdefg_to_s OF abcdefg_to_s_testbench IS
   -- Declara��o do componente abcdefg_to_s de acordo com sua arquitetura no arquivo abcdefg_to_s.vhd
   COMPONENT abcdefg_to_s
      PORT (
         i_A, i_B, i_C, i_D, i_E, i_F, i_G : IN STD_LOGIC;
         o_S                               : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais auxiliares para a simula��o dos estí­mulos ao circuito
   SIGNAL x_A_AUX, x_B_AUX, x_C_AUX, x_D_AUX, x_E_AUX, x_F_AUX, x_G_AUX : STD_LOGIC;
   SIGNAL x_INPUT_VECTOR                                                : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";

   -- Inst�nciaa do componente abcdefg_to_s e conex�o dos sinais
BEGIN
   abcdefg_circuit : abcdefg_to_s PORT MAP(
      -- Conex�o dos pinos de entrada
      i_A => x_A_AUX,
      i_B => x_B_AUX,
      i_C => x_C_AUX,
      i_D => x_D_AUX,
      i_E => x_E_AUX,
      i_F => x_F_AUX,
      i_G => x_G_AUX,
      -- Conex�o dos pinos de saída
      o_S => OPEN
   );

   -- Processo para gerar os estÃ­íulos
   estimulo : PROCESS
   BEGIN
      FOR i IN 0 TO 127 LOOP
         WAIT FOR 5 ns;
         x_INPUT_VECTOR <= STD_LOGIC_VECTOR(to_unsigned(i, 7));
         x_A_AUX        <= x_INPUT_VECTOR(0);
         x_B_AUX        <= x_INPUT_VECTOR(1);
         x_C_AUX        <= x_INPUT_VECTOR(2);
         x_D_AUX        <= x_INPUT_VECTOR(3);
         x_E_AUX        <= x_INPUT_VECTOR(4);
         x_F_AUX        <= x_INPUT_VECTOR(5);
         x_G_AUX        <= x_INPUT_VECTOR(6);

      END LOOP;

      WAIT;
   END PROCESS estimulo;

END tb_abcdefg_to_s;
