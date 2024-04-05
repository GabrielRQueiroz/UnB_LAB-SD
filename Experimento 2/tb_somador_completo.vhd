-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor: Gabriel Roberto de Queiroz
-- Data: 12/04/2024

-- ************
-- Testbench para a simula��o do
-- Circuito: Somador completo de tr�s entradas:
--          a    Entrada A de 1 bit
--          b    Entrada B de 1 bit
--          cin  Entrada de carry in (vai-um) de 1 bit
--          s    Sai�da da soma de 1 bit
--          cout Sai�da do carry out (vai-um) de 1 bit
-- ************

-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;

-- ************ Entity ************
-- testbench: uma entidade sem pinos de entrada e sai�da

-- Testbench para somador_completo.vhd
-- Valida��o ass�ncrona
ENTITY testbench IS END;

-- ************ Architecture ************
-- implementa��o do projeto

ARCHITECTURE tb_somador_completo OF testbench IS
   -- declara��o do componente somador de acordo com sua arquitetura no arquivo somador_completo.vhd
   COMPONENT somador_aux
      PORT (
         -- declara��o dos pinos de entrada
         a   : IN STD_LOGIC;
         b   : IN STD_LOGIC;
         cin : IN STD_LOGIC;
         -- declara��o dos pinos de sa�da
         s    : OUT STD_LOGIC;
         cout : OUT STD_LOGIC
      );
   END COMPONENT;

   -- Sinais de entrada auxiliares para a simula��o dos est�mulos ao circuito
   SIGNAL a_aux   : STD_LOGIC;
   SIGNAL b_aux   : STD_LOGIC;
   SIGNAL cin_aux : STD_LOGIC;

   -- Inst�ncia do componente somador e conex�o dos sinais
BEGIN
   somador : somador_aux PORT MAP(
      -- conex�o dos pinos de entrada
      a   => a_aux,
      b   => b_aux,
      cin => cin_aux,
      -- conex�o dos pinos de sa�da
      s    => OPEN,
      cout => OPEN
   );

   -- Processo para gerar os est�mulos
   estimulo : PROCESS
   BEGIN
      WAIT FOR 10 ns;
      a_aux   <= '0';
      b_aux   <= '0';
      cin_aux <= '0';
      WAIT FOR 10 ns;
      a_aux   <= '0';
      b_aux   <= '0';
      cin_aux <= '1';
      WAIT FOR 10 ns;
      a_aux   <= '0';
      b_aux   <= '1';
      cin_aux <= '0';
      WAIT FOR 10 ns;
      a_aux   <= '0';
      b_aux   <= '1';
      cin_aux <= '1';
      WAIT FOR 10 ns;
      a_aux   <= '1';
      b_aux   <= '0';
      cin_aux <= '0';
      WAIT FOR 10 ns;
      a_aux   <= '1';
      b_aux   <= '0';
      cin_aux <= '1';
      WAIT FOR 10 ns;
      a_aux   <= '1';
      b_aux   <= '1';
      cin_aux <= '0';
      WAIT FOR 10 ns;
      a_aux   <= '1';
      b_aux   <= '1';
      cin_aux <= '1';
      WAIT;
   END PROCESS estimulo;
END tb_somador_completo;
