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
--           o_Q      : Sa��da de 4 bits
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saída

-- Testbench para shift_reg.vhd
-- Validação assíncrona
ENTITY shift_reg_testbench IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_shift_reg OF shift_reg_testbench IS
   -- declaração do componente shift_register de acordo com sua arquitetura no arquivo shift_reg.vhd
   COMPONENT shift_register
      PORT (
         -- declaração dos pinos de entrada
         i_CLK, i_RST, i_LOAD, i_DIR, i_L, i_R : IN STD_LOGIC;
         i_D                                   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         -- declaração dos pinos de saída
         o_Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulação dos estímulos ao circuito
   SIGNAL x_CLK, x_RST, x_LOAD, x_DIR, x_L, x_R : STD_LOGIC                    := '0';
   SIGNAL x_D, x_Q                              : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

   -- Instância do componente shift_register e conexão dos sinais
BEGIN
   shift_reg : shift_register PORT MAP(
      -- conexão dos pinos de entrada
      i_CLK => x_CLK, i_RST => x_RST, i_LOAD => x_LOAD, i_D => x_D, i_DIR => x_DIR, i_L => x_L, i_R => x_R,
      -- conexão dos pinos de saída
      o_Q => OPEN
   );

   -- Processo para gerar os estímulos
   x_CLK <= NOT x_CLK AFTER 5 ns;
   x_DIR <= NOT x_DIR AFTER 40 ns;
   x_L   <= NOT x_L AFTER 10 ns;
   x_R   <= NOT x_R AFTER 20 ns;

   estimulo : PROCESS
   BEGIN
      x_D    <= "1111";
      x_LOAD <= '1';
      WAIT FOR 10 ns;
      x_RST <= '1';
      WAIT FOR 10 ns;
      x_RST  <= '0';
      x_LOAD <= '0';
      WAIT;
   END PROCESS estimulo;
END tb_shift_reg;
