library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




use IEEE.NUMERIC_STD.ALL;



entity tb_pwm is

end tb_pwm;

architecture Behavioral of tb_pwm is

    constant c_CLK_100MHZ_PERIOD : time := 10ns;

    
    signal s_sound : std_logic;
    signal s_clock : std_logic;
    signal s_reset : std_logic;
    signal s_echo_count_i : unsigned(16-1 downto 0);
   

begin

uut : entity work.pwm

port map(  
           sound    => s_sound,
           clock    => s_clock,
           echo_count_i => s_echo_count_i,
           reset    => s_reset
);
p_clk_gen : process
begin
    while now < 100000 us loop
        s_clock <= '0';
        wait for c_CLK_100MHZ_PERIOD / 2;
        s_clock <= '1';
        wait for c_CLK_100MHZ_PERIOD / 2;
    end loop;
    wait;
end process p_clk_gen;    
                
p_stimulus : process
begin
    s_reset <= '1';
    wait for 300 us;
    
    s_reset<= '0';
    wait for 4ms ;
    
    s_echo_count_i <= b"0000_0011_1110_1000";    --1000
    wait for 15ms;

    s_echo_count_i <= b"0000_0101_1101_1100";   --1500
    wait for 10ms;

    s_echo_count_i <= b"0000_1001_1100_0100";   --2500
    wait for 10ms;
    
    s_echo_count_i <= b"0000_1110_0001_0000";   --3600
    wait for 10ms;
    
    s_echo_count_i <= b"0001_0010_0101_1100";   --4700
    wait for 15ms;

    s_echo_count_i <= b"0001_0111_0000_1100";   --5900
    wait;
    
end process p_stimulus;

end Behavioral;

