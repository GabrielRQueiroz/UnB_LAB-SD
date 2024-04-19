-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 

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
-- pinos de entrada e saída
ENTITY shift_register IS
   PORT (
      i_CLK, i_RST, i_LOAD, i_DIR, i_L, i_R : IN STD_LOGIC;
      i_D                                   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_Q                                   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
   );
END shift_register;
-- ************ Architecture ************
-- implementação do projeto
ARCHITECTURE shift_register_arch OF shift_register IS
   SIGNAL s_Q : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
   -- ************
   -- Processo de atualização do flip-flop
   -- ************
   PROCESS (i_CLK, i_RST, i_LOAD, i_D, i_DIR, i_L, i_R)
   BEGIN
      IF (rising_edge(i_CLK)) THEN
         IF (i_RST = '1') THEN
            s_Q <= "0000";
         ELSIF (i_LOAD = '1') THEN
            s_Q <= i_D;
         ELSE
            IF (i_DIR = '1') THEN
               s_Q <= i_R & s_Q(3 DOWNTO 1);
            ELSE
               s_Q <= s_Q(2 DOWNTO 0) & i_L;
            END IF;
         END IF;

      END IF;
   END PROCESS;
   
   -- ************
   -- Processo de saída
   -- ************
   PROCESS (s_Q)
   BEGIN
      o_Q <= s_Q;
   END PROCESS;
END shift_register_arch;
