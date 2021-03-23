
library ieee;
use ieee.std_logic_1164.all;


entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;


architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    --- WRITE YOUR CODE HERE
    signal s_clk        : std_logic;
    signal s_reset      : std_logic;
    signal s_data0      : std_logic_vector(4 - 1 downto 0);
    signal s_data1      : std_logic_vector(4 - 1 downto 0);
    signal s_data2      : std_logic_vector(4 - 1 downto 0);
    signal s_data3      : std_logic_vector(4 - 1 downto 0);
    signal s_dp_i       : std_logic_vector(4 - 1 downto 0);
    signal s_dp_o       : std_logic;
    signal s_seg        : std_logic_vector(7 - 1 downto 0);
    signal s_dig        : std_logic_vector(4 - 1 downto 0);

begin
    -- Connecting testbench signals with driver_7seg_4digits entity
    -- (Unit Under Test)
    uut_driver : entity work.driver_7seg_4digits
    --- WRITE YOUR CODE HERE
            port map (
                clk     => s_clk,
                reset   => s_reset,
                data0_i => s_data0,
                data1_i => s_data1,
                data2_i => s_data2,
                data3_i => s_data3,
                dp_i    => s_dp_i,
                dp_o    => s_dp_o,  
                seg_o   => s_seg , 
                dig_o   => s_dig
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
    --- WRITE YOUR CODE HERE
    p_reset_gen : process
    begin
        s_reset <= '0';
        wait for 12 ns;
        s_reset <= '1';                 -- Reset activated
        wait for 73 ns;
        s_reset <= '0';
        wait;
    end process p_reset_gen;
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    --- WRITE YOUR CODE HERE
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        s_data3  <= "0011";           --display n. 4                    (3)
        s_dp_i   <= "0111";           --decimal point on display n. 4   (.)
        s_data2  <= "0001";           --display n. 3                    (1)
        s_data1  <= "0100";           --display n. 2                    (4)
        s_data0  <= "0010";           --display n. 1                    (2)
        
        
        
            
        wait for 350 ns;
        
        assert(s_seg = "0010010")       -- 2
        report "WRONG DIGIT ON DISPLAY -> 1" severity warning;
        
        wait for 4 ms;   
        assert(s_seg = "1001100")       -- 4
        report "WRONG DIGIT ON DISPLAY -> 2" severity warning;
        
        wait for 4 ms;   
        assert(s_seg = "1001111")       -- 1
        report "WRONG DIGIT ON DISPLAY -> 3" severity warning;
        
        wait for 4 ms;          
        assert(s_dp = '0')              -- .
        report "WRONG DIGIT ON DISPLAY -> DECIMAL POINT ON FOURTH DISPLAY" severity warning;
   
        wait for 4 ms;
        assert(s_seg = "0000110")       -- 3
        report "WRONG DIGIT ON DISPLAY -> 4" severity warning;

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
end architecture testbench;
