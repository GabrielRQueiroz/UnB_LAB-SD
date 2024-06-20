LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY exp8visto1 IS
  PORT (
    clock   : IN STD_LOGIC;
    reset   : IN STD_LOGIC;
    enable  : IN STD_LOGIC;
    load    : IN STD_LOGIC;
    dezload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    uniload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    dezena  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    unidade : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END exp8visto1;

ARCHITECTURE exp8visto1_arch OF exp8visto1 IS
  -- inserir sinais e componentes aqui 
  COMPONENT contador100 IS
    PORT (
      clock   : IN STD_LOGIC;
      reset   : IN STD_LOGIC;
      enable  : IN STD_LOGIC;
      load    : IN STD_LOGIC;
      dezload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      uniload : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      dezena  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      unidade : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
  END COMPONENT;
BEGIN
  -- inserir implementacao aqui 
  contador : contador100 PORT MAP(
    clock   => clock,
    reset   => reset,
    enable  => enable,
    load    => load,
    dezload => dezload,
    uniload => uniload,
    dezena  => dezena,
    unidade => unidade
  );
END exp8visto1_arch;
