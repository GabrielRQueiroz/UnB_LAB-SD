-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 

-- ************
-- Circuito: Somador de palavras de 4 bits utilizando somadores completos
--           i_A, i_B   Palavras de 4 bits (Entrada)
--           o_S      Sa�da da soma das palavras (5 bits)
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída
ENTITY words_adder_dut IS
   PORT (
      i_A, i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_S      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
   );
END ENTITY;

-- ************ Architecture ************
-- implementação do projeto
ARCHITECTURE words_adder_dut_arch OF words_adder_dut IS
   SIGNAL w_COUT_1, w_COUT_2, w_COUT_3 : STD_LOGIC;

BEGIN
   somador_1 : ENTITY work.somador_completo PORT MAP (
      A    => i_A(0),
      B    => i_B(0),
      CIN  => '0',
      S    => o_S(0),
      COUT => w_COUT_1
      );
   somador_2 : ENTITY work.somador_completo PORT MAP (
      A    => i_A(1),
      B    => i_B(1),
      CIN  => w_COUT_1,
      S    => o_S(1),
      COUT => w_COUT_2
      );
   somador_3 : ENTITY work.somador_completo PORT MAP (
      A    => i_A(2),
      B    => i_B(2),
      CIN  => w_COUT_2,
      S    => o_S(2),
      COUT => w_COUT_3
      );
   somador_4 : ENTITY work.somador_completo PORT MAP (
      A    => i_A(3),
      B    => i_B(3),
      CIN  => w_COUT_3,
      S    => o_S(3),
      COUT => o_S(4)
      );

END ARCHITECTURE;
