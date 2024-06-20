-- ************ Package ************
-- constantes e bibliotecas
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE IEEE.std_logic_arith.ALL;

-- ************ Entity ************
-- pinos de entrada e saída
ENTITY eight_bit_adder IS
   PORT (
      i_A, i_B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      o_S      : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
   );
END ENTITY;

-- ************ Architecture ************
-- implementação do projeto
ARCHITECTURE eight_bit_adder_arch OF eight_bit_adder IS
BEGIN
   o_S <= "0" & (i_A) + (i_B);
END ARCHITECTURE;
