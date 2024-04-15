-- Universidade de BrasÌ≠lia
-- LaboratÛrio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 19/04/2024

-- ************
-- Testbench para a simulaÁ„o do
-- Circuito: Decodificador de 4 para 16, que recebe como entrada um vetor de 4 bits e como saÌda um vetor de 16 bits:
--          i_A   Vetor de entrada de 4 bits
--          o_Y   Vetor de saÌda de 16 bits
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e sa√≠da

-- Testbench para decod_4to16.vhd
-- ValidaÁ„o assÌncrona
ENTITY decod_4to16_testbench IS END;

-- ************ Architecture ************
-- implementaÁ„o do projeto

ARCHITECTURE tb_decod_4to16 OF decod_4to16_testbench IS
   -- declaraÁ„o do componente decod_4to16 de acordo com sua arquitetura no arquivo decod_4to16.vhd
   COMPONENT decod_4to16
      PORT (
         -- declaraÁ„o dos pinos de entrada
         i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         -- declaraÁ„o dos pinos de sa√≠da
         o_Y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulaÁ„o dos estÌ≠mulos ao circuito
   SIGNAL x_A_AUX : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

   -- Inst‚ncia do componente decod_4to16 e conex„o dos sinais
BEGIN
   decod : decod_4to16 PORT MAP(
      -- conex„o dos pinos de entrada
      i_A => x_A_AUX,
      -- conex„o dos pinos de saÌda
      o_Y => OPEN
   );

   -- Processo para gerar os est√≠Ìulos
   estimulo : PROCESS
   BEGIN
      for i in 0 to 15 loop
         x_A_AUX <= std_logic_vector(to_unsigned(i, 4));
         WAIT FOR 10 ns;
      end loop;
      WAIT;
   END PROCESS estimulo;

END tb_decod_4to16;
