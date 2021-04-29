


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_state_machine is

end tb_state_machine;

architecture Behavioral of tb_state_machine is

  constant c_CLK_4kHZ_PERIOD : time := 250us;
  
  signal      s_clk_4kHz          :   std_logic;
  signal      s_reset        :   std_logic;
        
  signal      s_echo_i       :   std_logic;
  signal      s_trigger_o    :   std_logic;
  signal      s_echo_count_o :   integer;


begin

uut_hooola : entity work.state_machine
 port map(
        clk          => s_clk_4kHz,
        reset        => s_reset,        
        echo_i       => s_echo_i,
        trigger_o    => s_trigger_o,     
        echo_count_o => s_echo_count_o 
        
  );
  
  
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 1000 ms loop   -- 10 usec of simulation
            s_clk_4kHz <= '0';
            wait for c_CLK_4kHZ_PERIOD / 2;
            s_clk_4kHz <= '1';
            wait for c_CLK_4kHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;


    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        --s_reset <= '0'; wait for 2000 us;
        -- Reset activated
        --s_reset <= '1'; wait for 5000 us;
        -- Reset deactivated
        --s_reset <= '0';
        --wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- No input data needed.
        wait;
    end process p_stimulus;
    
end Behavioral;
