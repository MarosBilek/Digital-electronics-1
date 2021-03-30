

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_t_ff_rst is
end tb_t_ff_rst;

architecture Behavioral of tb_t_ff_rst is
    constant c_CLK_100MHZ_PERIOD : time      := 10 ns; 
    signal   s_clk               : STD_LOGIC;
    signal   s_rst               : STD_LOGIC;
    signal   s_t                 : STD_LOGIC;
    signal   s_q                 : STD_LOGIC;
    signal   s_q_bar             : STD_LOGIC;
begin
uut_d_ff_arst : entity work.t_ff_rst
    port map (
        clk     =>  s_clk,
        rst     =>  s_rst,
        t       =>  s_t,
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
        wait for 1 ns;
        s_rst <= '1';                 -- Reset activated
        wait for 10 ns;
        s_rst <= '0';
        wait;
    end process p_reset_gen;
    
    p_t_ff_arst :process
    begin
    
        s_t <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "FIRST TOGGLE ERROR" severity error; -- reset active
        
        s_t <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "FIRST NO CHANGE ERROR" severity error; -- reset was active
        
        s_t <=  '1';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "2. TOGGLE ERROR" severity error;
        
        s_t <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "3. TOGGLE ERROR" severity error;
        
        s_t <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "2. NO CHANGE ERROR" severity error;
        
        s_t <=  '1';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "4. TOGGLE ERROR" severity error;
        
        s_t <=  '0';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "3. NO CHANGE ERROR" severity error;
        wait;
        
        s_t <=  '0';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "4. NO CHANGE ERROR" severity error;
        
        s_t <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "5. TOGGLE ERROR" severity error;
    
    end process p_t_ff_arst;
    
    
end Behavioral;
