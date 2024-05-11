-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 

-- ************
-- Circuito: Máquina de refrigerante com entrada para moedas de 25 e 50 centavos, entregando a bebida ao acumular 1 real.
--           Se a máquina receber mais de 1 real, ela devolve o troco em moedas de 25 centavos.
--           A operação pode ser cancelada a qualquer momento, devolvendo o dinheiro inserido em moedas de 25 e/ou 50 centavos
--           i_A         : Entrada de 2 bits (00: Idle,
--                                            01: 25 centavos,
--                                            10: 50 centavos,
--                                            11: Cancelar)
--           i_RESET     : Reset assíncrono da máquina ao estado Idle
--           i_CLK       : Clock
--           o_DROP_SODA : Saída de 1 bit indicando a entrega ou não do refrigerante
--           o_RETURN_25 : Saída de 1 bit indicando a devolução ou não de 25 centavos
--           o_RETURN_50 : Saída de 1 bit indicando a devolução ou não de 50 centavos
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- ************ Entity ************
-- pinos de entrada e saída
ENTITY maquina_refri IS
   PORT (
      i_A                                   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      i_RESET, i_CLK                        : IN STD_LOGIC;
      o_DROP_SODA, o_RETURN_25, o_RETURN_50 : OUT STD_LOGIC
   );
END maquina_refri;

-- ************ Architecture ************
-- implementaçaão do projeto
ARCHITECTURE maquina_refri_arch OF maquina_refri IS
   TYPE state IS (Idle, Idle_25, Idle_50, Idle_75, Refund50, Refund25, Refund75, DeliverSoda, DeliverSoda_Refund25);
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
   comb_proc : PROCESS (current_state, i_A)
   BEGIN
      CASE current_state IS
         WHEN Idle =>
            o_DROP_SODA <= '0';
            o_RETURN_25 <= '0';
            o_RETURN_50 <= '0';
            IF (i_A = "00" OR i_A = "11") THEN
               next_state <= Idle;
            ELSIF (i_A = "01") THEN
               next_state <= Idle_25;
            ELSIF (i_A = "10") THEN
               next_state <= Idle_50;
            END IF;
         WHEN Idle_25 =>
            o_DROP_SODA <= '0';
            o_RETURN_25 <= '0';
            o_RETURN_50 <= '0';
            IF (i_A = "00") THEN
               next_state <= Idle_25;
            ELSIF (i_A = "01") THEN
               next_state <= Idle_50;
            ELSIF (i_A = "10") THEN
               next_state <= Idle_75;
            ELSIF (i_A = "11") THEN
               next_state <= Refund25;
            END IF;
         WHEN Idle_50 =>
            o_DROP_SODA <= '0';
            o_RETURN_25 <= '0';
            o_RETURN_50 <= '0';
            IF (i_A = "00") THEN
               next_state <= Idle_50;
            ELSIF (i_A = "01") THEN
               next_state <= Idle_75;
            ELSIF (i_A = "10") THEN
               next_state <= DeliverSoda;
            ELSIF (i_A = "11") THEN
               next_state <= Refund50;
            END IF;
         WHEN Idle_75 =>
            o_DROP_SODA <= '0';
            o_RETURN_25 <= '0';
            o_RETURN_50 <= '0';
            IF (i_A = "00") THEN
               next_state <= Idle_75;
            ELSIF (i_A = "01") THEN
               next_state <= DeliverSoda;
            ELSIF (i_A = "10") THEN
               next_state <= DeliverSoda_Refund25;
            ELSIF (i_A = "11") THEN
               next_state <= Refund75;
            END IF;
         WHEN Refund25 =>
            o_DROP_SODA <= '0';
            o_RETURN_25 <= '1';
            o_RETURN_50 <= '0';
            IF (i_A = "00" OR i_A = "11") THEN
               next_state <= Idle;
            ELSIF (i_A = "01") THEN
               next_state <= Idle_25;
            ELSIF (i_A = "10") THEN
               next_state <= Idle_50;
            END IF;
         WHEN Refund50 =>
            o_DROP_SODA <= '0';
            o_RETURN_25 <= '0';
            o_RETURN_50 <= '1';
            IF (i_A = "00" OR i_A = "11") THEN
               next_state <= Idle;
            ELSIF (i_A = "01") THEN
               next_state <= Idle_25;
            ELSIF (i_A = "10") THEN
               next_state <= Idle_50;
            END IF;
         WHEN Refund75 =>
            o_DROP_SODA <= '0';
            o_RETURN_25 <= '1';
            o_RETURN_50 <= '1';
            IF (i_A = "00" OR i_A = "11") THEN
               next_state <= Idle;
            ELSIF (i_A = "01") THEN
               next_state <= Idle_25;
            ELSIF (i_A = "10") THEN
               next_state <= Idle_50;
            END IF;
         WHEN DeliverSoda =>
            o_DROP_SODA <= '1';
            o_RETURN_25 <= '0';
            o_RETURN_50 <= '0';
            IF (i_A = "00" OR i_A = "11") THEN
               next_state <= Idle;
            ELSIF (i_A = "01") THEN
               next_state <= Idle_25;
            ELSIF (i_A = "10") THEN
               next_state <= Idle_50;
            END IF;
         WHEN DeliverSoda_Refund25 =>
            o_DROP_SODA <= '1';
            o_RETURN_25 <= '1';
            o_RETURN_50 <= '0';
            IF (i_A = "00" OR i_A = "11") THEN
               next_state <= Idle;
            ELSIF (i_A = "01") THEN
               next_state <= Idle_25;
            ELSIF (i_A = "10") THEN
               next_state <= Idle_50;
            END IF;
      END CASE;
   END PROCESS;
END maquina_refri_arch;
