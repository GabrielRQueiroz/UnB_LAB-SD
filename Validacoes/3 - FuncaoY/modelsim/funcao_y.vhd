-- ************ Package ************
-- Constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- Pinos de entrada e saí­da
ENTITY funcao_y IS
   PORT (
      i_A, i_B, i_C : IN STD_LOGIC;
      o_Y           : OUT STD_LOGIC
   );
END funcao_y;

-- ************ Architecture ************
-- Implementa��o do projeto
ARCHITECTURE funcao_y_arch OF funcao_y IS
   -- Declara��o dos componentes
   COMPONENT decod_4to16 IS
      PORT (
         i_SEL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         o_Y   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT multiplex_4x1 IS
      PORT (
         i_DATA : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         i_SEL  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         o_Y    : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Configura��o das entradas e sa�das dos componentes
   -- Note que os sinais auxiliares abaixo s�o diferenciados dos sinais de entrada e sa�da pelo prefixo "x_"
   SIGNAL x_MUX_SEL   : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL x_MUX_DATA  : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL x_DECOD_SEL : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL x_DECOD_OUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
   -- Implementa��o do circuito
   x_DECOD_SEL <= '0' & '0' & i_A & i_B;

   decod_4to16_inst : decod_4to16 PORT MAP(
      -- i_SEL 
      x_DECOD_SEL,
      -- o_Y
      x_DECOD_OUT
   );

   -- Entradas de dados dos multiplexadores
   x_MUX_DATA <= '0' & '0' & (x_DECOD_OUT(0) OR x_DECOD_OUT(3)) & (x_DECOD_OUT(0) OR x_DECOD_OUT(1));
   x_MUX_SEL  <= '0' & i_C;
   -- Bits de sele��o dos multiplexadores

   -- Componentes dos multiplexadores 4 para 1
   multiplex_for_Y : multiplex_4x1 PORT MAP(
      -- i_DATA
      x_MUX_DATA,
      -- i_SEL
      x_MUX_SEL,
      -- o_Y
      o_Y
   );

END funcao_y_arch;
