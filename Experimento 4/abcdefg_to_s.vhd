-- Universidade de Brasí­lia
-- Laboratário de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 26/04/2024

-- Cabeçalho com breve descrição

-- ************
-- Circuito: Entidade que recebe como entrada 7 bits de entrada e gera 1 bit de sa�da
--         A, B, C, D, E, F, G    Bits de entrada
--         S                      Bit de sa��da
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saí­da
ENTITY abcdefg_to_s IS
   PORT (
      i_A, i_B, i_C, i_D, i_E, i_F, i_G : IN STD_LOGIC;
      o_S                               : OUT STD_LOGIC
   );
END abcdefg_to_s;

-- ************ Architecture ************
-- implementação do projeto
ARCHITECTURE abcdefg_to_s_arch OF abcdefg_to_s IS

   -- Configuração das entradas de dados dos multiplexadores de X e de Y
   SIGNAL x_DATA_MULTIPLEX : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL x_SEL_MULTIPLEX  : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL x_SEL_DECODER    : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL x_SEL_OUTPUT     : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
   -- implementação do circuito

   x_SEL_MULTIPLEX <= i_E & i_F & i_G;
   x_SEL_DECODER   <= i_A & i_B & i_C & i_D;

   decoder : ENTITY work.decod_4to16 PORT MAP(
      x_SEL_DECODER,
      o_Y => x_SEL_OUTPUT
      );

   x_DATA_MULTIPLEX <= "1" & (x_SEL_OUTPUT(11) OR x_SEL_OUTPUT(10)) & "0" & (x_SEL_OUTPUT(15) OR x_SEL_OUTPUT(9)) & "1" & x_SEL_OUTPUT(7) & (x_SEL_OUTPUT(15) OR x_SEL_OUTPUT(0)) & x_SEL_OUTPUT(15);

   multiplex : ENTITY work.multiplex_8x1 PORT MAP(
      x_DATA_MULTIPLEX,
      x_SEL_MULTIPLEX,
      o_S
      );

END abcdefg_to_s_arch;
