
-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e saí­da

-- Testbench para uni_shift_reg.vhd
-- Validação assí­ncrona
ENTITY uni_shift_reg_testbench IS END;

-- ************ Architecture ************
-- implementação do projeto

ARCHITECTURE tb_uni_shift_reg OF uni_shift_reg_testbench IS
   -- declaração do componente uni_shift_register de acordo com sua arquitetura no arquivo uni_shift_reg.vhd
   COMPONENT uni_shift_register
      PORT (
         -- declaração dos pinos de entrada
         i_CLK, i_L : IN STD_LOGIC;
         -- declaração dos pinos de saí­da
         o_Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
      );
   END COMPONENT;

   -- Sinais auxiliares para a simulação dos estí­mulos ao circuito
   SIGNAL x_CLK, x_L : STD_LOGIC                    := '0';
   SIGNAL x_Q        : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

   -- Instânciaa do componente uni_shift_register e conexão dos sinais
BEGIN
   uni_shift_reg : uni_shift_register PORT MAP(
      -- conexão dos pinos de entrada
      i_CLK => x_CLK, i_L => x_L,
      -- conexão dos pinos de saí­da
      o_Q => OPEN
   );

   -- Processo para gerar os estí­mulos
   x_CLK <= NOT x_CLK AFTER 5 ns;

   estimulo : PROCESS
   BEGIN
      x_L <= '1';
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;

      x_L <= '0';
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;

      x_L <= '1';
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;

      x_L <= '0';
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;

      x_L <= '1';
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;

      x_L <= '0';
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;
      WAIT FOR 10 ns;

      x_L <= '1';
      WAIT FOR 10 ns;

      x_L <= '0';
      WAIT;
   END PROCESS estimulo;
END tb_uni_shift_reg;
