-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 26/04/2024

-- ************
-- Circuito: Entidade que recebe como entrada 7 bits de entrada e gera 1 bit de saída
--           implementando a expressão S = FG + ABC + D!E!FG + !A!B!C!D!E!FG + A!BCEF!G + !ABCD!EF!G + ABCDE!F!G + A!B!CDE!F!G:
--
--         i_A, i_B, i_C, i_D, i_E, i_F, i_G    Bits de entrada
--         o_S                                  Bit de saí­da
-- ************

-- ************ Package ************
-- Constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saÃ­Â­da
ENTITY abcdefg_to_s IS
   PORT (
      i_A, i_B, i_C, i_D, i_E, i_F, i_G : IN STD_LOGIC;
      o_S                               : OUT STD_LOGIC
   );
END abcdefg_to_s;

-- ************ Architecture ************
-- Implementação do projeto
ARCHITECTURE abcdefg_to_s_arch OF abcdefg_to_s IS

   -- Declaração dos componentes dos experimentos nº 3
   COMPONENT decod_4to16 IS
      PORT (
         i_SEL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         o_Y   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT multiplex_8x1 IS
      PORT (
         i_DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         i_SEL  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         o_Y    : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Configuração das entradas de dados dos multiplexadores de X e de Y
   -- Note que os sinais auxiliares abaixo são diferenciados dos sinais de entrada e saída pelo prefixo "x_"
   SIGNAL x_DATA_MULTIPLEX : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL x_SEL_MULTIPLEX  : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL x_SEL_DECODER    : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL x_DECODER_OUTPUT : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
   -- Implementação do circuito

   -- Bits de seleção do mux e do decodificador
   x_SEL_MULTIPLEX <= i_E & i_F & i_G;
   x_SEL_DECODER   <= i_A & i_B & i_C & i_D;

   -- Componente do decoficador 4 para 16 do experimento nº 3
   decoder : decod_4to16 PORT MAP(
      -- i_SEL
      x_SEL_DECODER,
      -- o_Y
      x_DECODER_OUTPUT
   );

   -- Combinação das entradas de dados do multiplexador
   x_DATA_MULTIPLEX <=
      "1"
      & (x_DECODER_OUTPUT(11) OR x_DECODER_OUTPUT(10))
      & "0"
      & (x_DECODER_OUTPUT(15) OR x_DECODER_OUTPUT(9))
      & "1"
      & x_DECODER_OUTPUT(7)
      & (x_DECODER_OUTPUT(15) OR x_DECODER_OUTPUT(0))
      & x_DECODER_OUTPUT(15);

   --  Componente do multiplexador 8 para 1 do experimento nº 3
   multiplex : multiplex_8x1 PORT MAP(
      -- i_DATA
      x_DATA_MULTIPLEX,
      -- i_SEL
      x_SEL_MULTIPLEX,
      -- o_Y
      o_S
   );

END abcdefg_to_s_arch;
