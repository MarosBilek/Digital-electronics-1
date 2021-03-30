
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_jk_ff_rst is
end tb_jk_ff_rst;

architecture Behavioral of tb_jk_ff_rst is
    constant c_CLK_100MHZ_PERIOD : time      := 10 ns;
    signal   s_clk               : STD_LOGIC;
    signal   s_j                 : STD_LOGIC;
    signal   s_k                 : STD_LOGIC;
    signal   s_rst               : STD_LOGIC;
    signal   s_q                 : STD_LOGIC;
    signal   s_q_bar             : STD_LOGIC;
begin
uut_jk_ff_rst : entity work.jk_ff_rst
      port map 
        (
         clk       => s_clk,
         j         => s_j,
         k         => s_k,
         rst       => s_rst,
         q         => s_q,
         q_bar     => s_q_bar
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
    
    p_jk_ff_rst :process
    begin
    
        s_j <=  '1';
        s_k <=  '0'; 
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "FIRST SET ERROR" severity error;
        
        s_j <=  '1';
        s_k <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "FIRST TOGGLE ERROR" severity error;
        
        s_j <=  '0';
        s_k <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "FIRST RESET ERROR" severity error;
                
 
        s_j <=  '1';
        s_k <=  '1';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "2. TOGGLE ERROR - acceptable" severity error;    --error reported because reset is active
        
        s_j <=  '0';
        s_k <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "2. RESET ERROR" severity error;
        
        s_j <=  '1';
        s_k <=  '1';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "3. TOGGLE ERROR" severity error;
        
        s_j <=  '1';
        s_k <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "4. TOGGLE ERROR" severity error;
        
        
        s_j <=  '1';
        s_k <=  '0'; 
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "2. SET ERROR" severity error;
        wait;
       
    end process p_jk_ff_rst;  
end Behavioral;
