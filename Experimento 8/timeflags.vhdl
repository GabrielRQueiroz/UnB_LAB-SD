library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity timeflags is
  port( dezena : in STD_LOGIC_VECTOR(3 downto 0);
        unidade : in STD_LOGIC_VECTOR(3 downto 0);
        T60 : out STD_LOGIC;
        T20 : out STD_LOGIC;
        T6 : out STD_LOGIC;
        T5 : out STD_LOGIC );
end timeflags;

architecture timeflags_arch of timeflags is
  -- inserir sinais e componentes aqui 
begin

  -- inserir implementacao aqui 

end timeflags_arch;
