-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 26/04/202

-- ************
-- Circuito: Entidade que recebe como entrada trÃªs bits e tem como saÃ­da dois bits, determinados por dois multiplexadores 4x1:
--       i_A, i_B, i_C   3 bits de entrada
--       o_X, o_Y      2 bits de saÃ­da
-- ************

-- ************ Package ************
-- Constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- Pinos de entrada e saÃ­Â­da
ENTITY abc_to_xy IS
    PORT (
        i_A, i_B, i_C : IN STD_LOGIC;
        o_X, o_Y      : OUT STD_LOGIC
    );
END abc_to_xy;

-- ************ Architecture ************
-- Implementação do projeto
ARCHITECTURE abc_to_xy_arch OF abc_to_xy IS

    -- Declaração do componente utilizado no experimento nº 2
    COMPONENT multiplex_4x1 IS
        PORT (
            i_DATA : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            i_SEL  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            o_Y    : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Configuração das entradas de dados dos multiplexadores de X e de Y
    -- Note que os sinais auxiliares abaixo são diferenciados dos sinais de entrada e saída pelo prefixo "x_"
    SIGNAL x_NOT_C  : STD_LOGIC;
    SIGNAL x_DATA_X : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL x_DATA_Y : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL x_SEL    : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
    -- Implementação do circuito

    -- Uma única porta inversora
    x_NOT_C <= NOT i_C;

    -- Entradas de dados dos multiplexadores
    x_DATA_X <= "1" & x_NOT_C & i_C & "0";
    x_DATA_Y <= i_C & "0" & x_NOT_C & "1";

    -- Bits de seleção dos multiplexadores
    x_SEL <= i_A & i_B;

    -- Componentes dos multiplexadores 4 para 1 do experimento nº 2
    multiplex_for_X : multiplex_4x1 PORT MAP(
        -- i_DATA
        x_DATA_X,
        -- i_SEL
        x_SEL,
        -- o_Y
        o_X
    );

    multiplex_for_Y : multiplex_4x1 PORT MAP(
        -- i_DATA
        x_DATA_Y,
        -- i_SEL
        x_SEL,
        -- o_Y
        o_Y
    );

END abc_to_xy_arch;
