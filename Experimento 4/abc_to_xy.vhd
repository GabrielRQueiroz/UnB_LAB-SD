-- Universidade de Brasí­lia
-- Laboratário de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 26/04/2024

-- Cabeçalho com breve descrição

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
    SIGNAL w_NOT_C  : STD_LOGIC;
    SIGNAL w_DATA_X : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL w_DATA_Y : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL w_SEL    : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
    -- implementação do circuito

    -- Uma �nica porta inversora
    w_NOT_C <= NOT i_C;

    w_DATA_X <= i_C & "0" & w_NOT_C & "1";
    w_DATA_Y <= "1" & w_NOT_C & i_C & "0";
    w_SEL    <= i_A & i_B;

    multiplex_for_X : ENTITY work.multiplex_4x1 PORT MAP(
        w_DATA_X,
        w_SEL,
        o_X
        );

    multiplex_for_Y : ENTITY work.multiplex_4x1 PORT MAP(
        w_DATA_Y,
        w_SEL,
        o_Y
        );

END abc_to_xy_arch;
