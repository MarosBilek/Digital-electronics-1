


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_top is
end tb_top;

architecture testbench of tb_top is
    signal s_SW  :  STD_LOGIC_VECTOR (3 downto 0);
    signal s_LED :  STD_LOGIC_VECTOR (7 downto 0);
    
    signal s_CA  :  STD_LOGIC;
    signal s_CB  :  STD_LOGIC;
    signal s_CC  :  STD_LOGIC;
    signal s_CD  :  STD_LOGIC;
    signal s_CE  :  STD_LOGIC;
    signal s_CF  :  STD_LOGIC;
    signal s_CG  :  STD_LOGIC;
    
    signal s_AN  :  STD_LOGIC_VECTOR (7 downto 0);
begin
    uut_top : entity work.top
    port map(
     SW  => s_SW,
     LED => s_LED,
     CA  => s_CA,
     CB  => s_CB,
     CC  => s_CC,
     CD  => s_CD,
     CE  => s_CE,
     CF  => s_CF,
     CG  => s_CG,
     AN  => s_AN
    );
    
    p_LED : process 
    begin
    s_SW <= "0000";
    wait for 100 ns;
    
     s_SW <= "0001";
    wait for 100 ns;
    
     s_SW <= "0010";
    wait for 100 ns;
    
     s_SW <= "0011";
    wait for 100 ns;
    
     s_SW <= "0100";
    wait for 100 ns;
    
     s_SW <= "0101";
    wait for 100 ns;

     s_SW <= "0110";
    wait for 100 ns;
    
     s_SW <= "0111";
    wait for 100 ns;
    
     s_SW <= "1000";
    wait for 100 ns;
    
     s_SW <= "1001";
    wait for 100 ns;
    
     s_SW <= "1010";
    wait for 100 ns;
    
     s_SW <= "1011";
    wait for 100 ns;
    
     s_SW <= "1100";
    wait for 100 ns;
    
     s_SW <= "1101";
    wait for 100 ns;
    
     s_SW <= "1110";
    wait for 100 ns;
    
     s_SW <= "1111";
    wait;
    end process p_LED;
end testbench;
