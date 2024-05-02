-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 03/05/2024

-- ************
-- Circuito: Somador de palavras de 4 bits utilizando somadores completos
--           i_A, i_B   Palavras de 4 bits (Entrada)
--           o_S      Saída da soma das palavras (5 bits)
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
   -- Instâncias dos somadores completos
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
      i_CIN  => x_COUT_1, -- conexão em cascata entre os somadores (n-ésimo cout é entrada do n-ésimo - 1 somador)
      o_S    => o_S(1),
      o_COUT => x_COUT_2
   );
   somador_3 : somador_completo PORT MAP(
      i_A    => i_A(2),
      i_B    => i_B(2),
      i_CIN  => x_COUT_2, -- conexão em cascata entre os somadores (n-ésimo cout é entrada do n-ésimo - 1 somador)
      o_S    => o_S(2),
      o_COUT => x_COUT_3
   );
   somador_4 : somador_completo PORT MAP(
      i_A    => i_A(3),
      i_B    => i_B(3),
      i_CIN  => x_COUT_3, -- conexão em cascata entre os somadores (n-ésimo cout é entrada do n-ésimo - 1 somador)
      o_S    => o_S(3),
      o_COUT => o_S(4)
   );

END ARCHITECTURE;
