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
   SIGNAL w_DATA_MULTIPLEX : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL w_SEL_MULTIPLEX  : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL w_SEL_DECODER    : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL w_SEL_OUTPUT     : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
   -- implementação do circuito

   w_SEL_MULTIPLEX <= i_E & i_F & i_G;
   w_SEL_DECODER   <= i_A & i_B & i_C & i_D;

   decoder : ENTITY work.decod_4to16 PORT MAP(
      w_SEL_DECODER,
      o_Y => w_SEL_OUTPUT
      );

   w_DATA_MULTIPLEX <= "1" & (w_SEL_OUTPUT(11) OR w_SEL_OUTPUT(10)) & "0" & (w_SEL_OUTPUT(15) OR w_SEL_OUTPUT(9)) & "1" & w_SEL_OUTPUT(7) & (w_SEL_OUTPUT(15) OR w_SEL_OUTPUT(0)) & w_SEL_OUTPUT(15);

   multiplex : ENTITY work.multiplex_8x1 PORT MAP(
      w_DATA_MULTIPLEX,
      w_SEL_MULTIPLEX,
      o_S
      );

END abcdefg_to_s_arch;
