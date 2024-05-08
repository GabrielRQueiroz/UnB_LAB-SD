-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 03/05/2024

-- ************
-- Top module para a simulação do
-- Circuito: Somador de palavras de 2 bits utilizando o operador + do pacore STD_LOGIC_ARITH
--           i_A, i_B   Palavras de 2 bits (Entrada)
--           o_S      Saída da soma das palavras (3 bits)
--
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
USE IEEE.numeric_std.ALL;

-- ************ Entity ************
-- Top module: uma entidade sem pinos de entrada e saída

-- Top module para words_adder.vhd
-- Validação assíncrona
ENTITY multiplex_8x1_top_module IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE mutiplex_8x1_top_module_arch OF multiplex_8x1_top_module IS
   -- declaração do componente words_adder de acordo com sua arquitetura no arquivo words_adder.vhd
   COMPONENT multiplex_8x1_dut IS
      PORT (
         i_SEL  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         i_DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         o_Y    : OUT STD_LOGIC
      );
   END COMPONENT;

   COMPONENT multiplex_8x1_gm IS
      PORT (
         i_SEL  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         i_DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         o_Y    : OUT STD_LOGIC
      );
   END COMPONENT;

   COMPONENT tb_multiplex_8x1 IS
      PORT (
         -- declaração dos pinos de entrada
         i_DUT_OUT, i_GM_OUT : IN STD_LOGIC;
         -- declaração dos pinos de saída
         o_SEL  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         o_DATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulação dos estímulos ao circuito
   SIGNAL x_SEL               : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL x_DATA              : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL x_DUT_OUT, x_GM_OUT : STD_LOGIC;

BEGIN
   U0 : multiplex_8x1_dut PORT MAP(i_SEL => x_SEL, i_DATA => x_DATA, o_Y => x_DUT_OUT);
   U1 : multiplex_8x1_gm PORT MAP(i_SEL => x_SEL, i_DATA => x_DATA, o_Y => x_GM_OUT);
   U2 : tb_multiplex_8x1 PORT MAP(
      i_DUT_OUT => x_DUT_OUT,
      i_GM_OUT  => x_GM_OUT,
      o_SEL     => x_SEL,
      o_DATA    => x_DATA
   );
END mutiplex_8x1_top_module_arch;
