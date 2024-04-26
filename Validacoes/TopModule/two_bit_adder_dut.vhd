-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 03/05/2024

-- ************
-- Circuito: Somador de palavras de 2 bits utilizando somadores completos
--           i_A, i_B   Palavras de 2 bits (Entrada)
--           o_S      Saída da soma das palavras (3 bits)
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída
ENTITY two_bit_adder_dut IS
   PORT (
      i_A, i_B : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      o_S      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
   );
END ENTITY;

-- ************ Architecture ************
-- implementação do projeto
ARCHITECTURE two_bit_adder_dut_arch OF two_bit_adder_dut IS
   COMPONENT somador_completo IS
      PORT (
         i_A    : IN STD_LOGIC;
         i_B    : IN STD_LOGIC;
         i_CIN  : IN STD_LOGIC;
         o_S    : OUT STD_LOGIC;
         o_COUT : OUT STD_LOGIC
      );
   END COMPONENT;

   SIGNAL x_COUT_1, x_COUT_2, x_COUT_3 : STD_LOGIC;

BEGIN
   somador_1 : somador_completo PORT MAP(
      i_A    => i_A(0),
      i_B    => i_B(0),
      i_CIN  => '0',
      o_S    => o_S(0),
      o_COUT => x_COUT_1
   );
   somador_2 : somador_completo PORT MAP(
      i_A    => i_A(1),
      i_B    => i_B(1),
      i_CIN  => x_COUT_1,
      o_S    => o_S(1),
      o_COUT => o_S(2)
   );
END ARCHITECTURE;
