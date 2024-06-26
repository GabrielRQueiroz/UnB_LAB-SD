-- Universidade de Bras�lia
-- Laborat�rio de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 31/05/24

-- ************
-- Circuito: Registrador de deslocamento de 4bits sens�vel � borda de subida
--           i_CLK    : Entrada do bit do evento de sincronia
--           i_RST    : For�a a sa�da para "0000"
--           i_LOAD   : Carrega o registrador com o valor de i_D
--           i_D      : Valor de 4 bits a ser carregado no registrador
--           i_DIR    : Dire��o do deslocamento: 0 desloca para a esquerda e 1 desloca para a direita
--           i_L      : Bit carregado ao deslocar para a esquerda
--           i_R      : Bit carregado ao deslocar para a direita
--           o_Q      : Sa�da de 4 bits
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e sa�da
ENTITY shift_register IS
   PORT (
      i_CLK, i_RST, i_LOAD, i_DIR, i_L, i_R : IN STD_LOGIC;
      i_D                                   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_Q                                   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
   );
END shift_register;
-- ************ Architecture ************
-- implementa��o do projeto
ARCHITECTURE shift_register_arch OF shift_register IS
   SIGNAL s_Q : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
   -- ************
   -- Processo de atualiza��o do flip-flop
   -- ************
   PROCESS (i_CLK)
   BEGIN
      IF (rising_edge(i_CLK)) THEN
         IF (i_RST = '1') THEN
            s_Q <= "0000";
         ELSIF (i_LOAD = '1') THEN
            s_Q <= i_D;
         ELSE
            IF (i_DIR = '0') THEN
               s_Q <= s_Q(2 DOWNTO 0) & i_L;
            ELSIF (i_DIR = '1') THEN
               s_Q <= i_R & s_Q(3 DOWNTO 1);
            END IF;
         END IF;

      END IF;
   END PROCESS;

   o_Q <= s_Q;
END shift_register_arch;
