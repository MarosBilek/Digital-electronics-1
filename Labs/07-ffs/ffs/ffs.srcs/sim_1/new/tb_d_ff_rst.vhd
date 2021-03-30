
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_d_ff_rst is

end tb_d_ff_rst;

architecture Behavioral of tb_d_ff_rst is

    constant c_CLK_100MHZ_PERIOD : time      := 10 ns;
    signal   s_clk               : STD_LOGIC;
    signal   s_d                 : STD_LOGIC;
    signal   s_rst               : STD_LOGIC;
    signal   s_q                 : STD_LOGIC;
    signal   s_q_bar             : STD_LOGIC;

begin
uut_d_ff_arst : entity work.d_ff_rst

    port map (
        clk     =>  s_clk,
        d       =>  s_d,
        rst    =>   s_rst,
        q       =>  s_q,
        q_bar   =>  s_q_bar
    );
    
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 20 ns;
        s_rst <= '1';                 -- Reset activated
        wait for 30 ns;
        s_rst <= '0';
        wait;
    end process p_reset_gen;
    
    p_d_ff_rst : process
    begin
    
        s_d    <= '1'; 
        wait for 20 ns;
        assert (s_q = '1' and s_q_bar = '0') report "ERROR - FIRST FLIP" severity note;
        
        s_d    <= '0';
        wait for 20 ns;
        assert (s_q = '0' and s_q_bar = '1') report "ERROR - FIRST FLIP" severity note;
        
        s_d    <= '1';
        wait for 20 ns;
        assert (s_q = '1' and s_q_bar = '0') report "ERROR - 2. FLIP" severity note;
        
        s_d    <= '0';
        wait for 20 ns;
        assert (s_q = '0' and s_q_bar = '1') report "ERROR - 2. FLIP" severity note;
        
        s_d    <= '1'; 
        wait for 20 ns;
        assert (s_q = '1' and s_q_bar = '0') report "ERROR - 3. FLIP" severity note;
        
        s_d    <= '0';
        wait for 20 ns;
        assert (s_q = '0' and s_q_bar = '1') report "ERROR - 3. FLIP" severity note;
        
        s_d    <= '1';
        wait for 20 ns;
        assert (s_q = '1' and s_q_bar = '0') report "ERROR - 4. FLIP" severity note;
        
        s_d    <= '0';
        wait for 20 ns;
        assert (s_q = '0' and s_q_bar = '1') report "ERROR - 4. FLIP" severity note;
        
        wait;
    
    end process p_d_ff_rst;
    

end Behavioral;
