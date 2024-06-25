LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY timeflags_relogio IS
  PORT (
    milhar  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    centena : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    dezena  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    unidade : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    T59     : OUT STD_LOGIC;
    T3599   : OUT STD_LOGIC);
END timeflags_relogio;

ARCHITECTURE timeflags_relogio_arch OF timeflags_relogio IS
  -- inserir sinais e componentes aqui
BEGIN
  -- inserir implementacao aqui
  T59 <= '1' WHEN ((dezena = x"5" AND unidade >= x"9") OR (dezena >= x"6")) ELSE
    '0';

  T3599 <= '1' WHEN ((milhar = x"3" AND centena = x"5" AND dezena = x"9" AND unidade = x"9")
    OR (milhar = x"3" AND centena >= x"6") OR (milhar >= x"4")) ELSE
    '0';

END timeflags_relogio_arch;
