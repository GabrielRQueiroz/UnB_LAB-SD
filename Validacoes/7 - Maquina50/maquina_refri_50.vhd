-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída
ENTITY maquina_refri_50 IS
   PORT (
      i_A, i_CANCEL            : IN STD_LOGIC;
      i_RESET, i_CLK           : IN STD_LOGIC;
      o_DROP_SODA, o_RETURN_50 : OUT STD_LOGIC
   );
END maquina_refri_50;

-- ************ Architecture ************
-- implementaçaão do projeto
ARCHITECTURE maquina_refri_50_arch OF maquina_refri_50 IS
   TYPE state IS (Idle, Idle_50, Refund50, DeliverSoda);
   SIGNAL current_state, next_state : state;

BEGIN
   -- Processo síncrono para a mamória da máquina de estados
   sync_proc : PROCESS (i_CLK, i_RESET)
   BEGIN
      IF (i_RESET = '1') THEN
         current_state <= Idle;
      ELSIF rising_edge(i_CLK) THEN
         current_state <= next_state;
      END IF;
   END PROCESS;

   -- Processo combinacional para a lógica da máquina de estados
   comb_proc : PROCESS (current_state, i_A, i_CANCEL)
   BEGIN
      CASE current_state IS
         WHEN Idle =>
            o_DROP_SODA <= '0';
            o_RETURN_50 <= '0';
            IF (i_A = '0' OR i_CANCEL = '1') THEN
               next_state <= Idle;
            ELSIF (i_A = '1') THEN
               next_state <= Idle_50;
            END IF;
         WHEN Idle_50 =>
            o_DROP_SODA <= '0';
            o_RETURN_50 <= '0';
            IF (i_CANCEL = '1') THEN
               next_state <= Refund50;
            ELSIF (i_A = '0') THEN
               next_state <= Idle_50;
            ELSIF (i_A = '1') THEN
               next_state <= DeliverSoda;
            END IF;
         WHEN Refund50 =>
            o_DROP_SODA <= '0';
            o_RETURN_50 <= '1';
            IF (i_A = '0' OR i_CANCEL = '1') THEN
               next_state <= Idle;
            ELSIF (i_A = '1') THEN
               next_state <= Idle_50;
            END IF;
         WHEN DeliverSoda =>
            o_DROP_SODA <= '1';
            o_RETURN_50 <= '0';
            IF (i_A = '0' OR i_CANCEL = '1') THEN
               next_state <= Idle;
            ELSIF (i_A = '1') THEN
               next_state <= Idle_50;
            END IF;
      END CASE;
   END PROCESS;
END maquina_refri_50_arch;
