-- Universidade de Brasí­lia
-- Laboratário de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 26/04/202

-- ************
-- Circuito: Entidade que recebe como entrada três bits e tem como saída dois bits, determinados por dois multiplexadores 4x1:
--       i_A, i_B, i_C   3 bits de entrada
--       o_X, o_Y      2 bits de saída
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saí­da
ENTITY abc_to_xy IS
    PORT (
        i_A, i_B, i_C : IN STD_LOGIC;
        o_X, o_Y      : OUT STD_LOGIC
    );
END abc_to_xy;

-- ************ Architecture ************
-- implementação do projeto
ARCHITECTURE abc_to_xy_arch OF abc_to_xy IS

    -- Configuração das entradas de dados dos multiplexadores de X e de Y
    -- Note que os sinais auxiliares abaixo s�o diferenciados dos sinais de entrada e sa�da pelo prefixo "x_"
    SIGNAL x_NOT_C  : STD_LOGIC;
    SIGNAL x_DATA_X : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL x_DATA_Y : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL x_SEL    : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
    -- implementação do circuito

    -- Uma �nica porta inversora
    x_NOT_C <= NOT i_C;

    x_DATA_X <= "1" & x_NOT_C & i_C & "0";
    x_DATA_Y <= i_C & "0" & x_NOT_C & "1";
    x_SEL    <= i_A & i_B;

    multiplex_for_X : ENTITY work.multiplex_4x1 PORT MAP(
        x_DATA_X,
        x_SEL,
        o_X
        );

    multiplex_for_Y : ENTITY work.multiplex_4x1 PORT MAP(
        x_DATA_Y,
        x_SEL,
        o_Y
        );

END abc_to_xy_arch;
