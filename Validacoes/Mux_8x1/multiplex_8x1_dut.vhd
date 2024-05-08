-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 03/05/2024

-- ************
-- Circuito: Multiplexador 8x1 com 8 bits de dados, 3 bits de seleção e uma saída:
--          i_DATA  Entrada de 8 bits de dados
--          i_SEL   Entrada de 3 bits de seleção
--          o_Y     Saída do mux
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída

ENTITY multiplex_8x1_dut IS
  PORT (
    i_DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    i_SEL  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    o_Y    : OUT STD_LOGIC
  );
END multiplex_8x1_dut;
-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE multiplex_8x1_dut_arch OF multiplex_8x1_dut IS
  COMPONENT multiplex_4x1 IS PORT (
    i_DATA : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    i_SEL  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    o_Y    : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL x_MUX_1_OUT, x_MUX_2_OUT                 : STD_LOGIC;
  SIGNAL x_MUX_1_DATA, x_MUX_2_DATA, x_MUX_3_DATA : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL x_MUX_1_SEL, x_MUX_2_SEL, x_MUX_3_SEL    : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
  x_MUX_1_DATA <= i_DATA(7 DOWNTO 4);
  x_MUX_2_DATA <= i_DATA(3 DOWNTO 0);

  x_MUX_1_SEL <= i_SEL(1 DOWNTO 0);
  x_MUX_2_SEL <= i_SEL(1 DOWNTO 0);

  mux_4x1_1 : multiplex_4x1 PORT MAP(
    i_DATA => x_MUX_1_DATA,
    i_SEL  => x_MUX_1_SEL,
    o_Y    => x_MUX_1_OUT
  );

  mux_4x1_2 : multiplex_4x1 PORT MAP(
    i_DATA => x_MUX_2_DATA,
    i_SEL  => x_MUX_2_SEL,
    o_Y    => x_MUX_2_OUT
  );

  x_MUX_3_DATA <= '0' & '0' & x_MUX_1_OUT & x_MUX_2_OUT;

  x_MUX_3_SEL <= '0' & i_SEL(2);

  mux_4x1_3 : multiplex_4x1 PORT MAP(
    i_DATA => x_MUX_3_DATA,
    i_SEL  => x_MUX_3_SEL,
    o_Y    => o_Y
  );
END multiplex_8x1_dut_arch;
