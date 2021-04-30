

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity state_machine is
 Port (
        clk       : in  std_logic;
        reset     : in  std_logic;

        echo_i    : in  std_logic;
        trigger_o : out std_logic;
        -- Traffic lights (RGB LEDs) for two directions
        echo_count_o : out unsigned(16 - 1 downto 0)
        
  );
end state_machine;

architecture Behavioral of state_machine is
-- Define the states
    type t_state is (DEF,     --default
                     TRIGG_SEND,   -- trig_send
                     TRIGG_WAIT, -- trigg_wait
                     ECHO_COUNT    --echo_count
                     );
                     
    -- Define the signal that uses different states
    signal s_state  : t_state;
    -- Internal clock enable
    signal s_en     : std_logic;
    -- Local delay counter
    signal   s_cnt  : unsigned(18 - 1 downto 0);
    -- Local echo counter
    signal   s_cnt_echo  : unsigned(16 - 1 downto 0)  := b"0000_0000_0000_0000";
    
    signal s_trigg : std_logic;
    signal s_reverse : std_logic := '1';
    -- Specific values for local counter
    constant c_ZERO         :    unsigned(18 - 1 downto 0)  := b"00_0000_0000_0000_0000";
    constant c_DELAY_20uSEC :    unsigned(18 - 1 downto 0)  := b"00_0000_0000_0001_0100";--20us  --real  := 0.002;
    constant c_DELAY_60mSEC :    unsigned(18 - 1 downto 0)  := b"001_1101_0100_1100_000";--60ms  --real  :=100.0 ;
    
    
begin

    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates an enable pulse
    -- every 250 ms (4 Hz). Remember that the frequency of the clock 
    -- signal is 100 MHz.
    
    -- JUST FOR SHORTER/FASTER SIMULATION
    --s_en <= '1';
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX =>  100      -- g_MAX = 250 ms / (1/100 MHz)
        )
        port map(
            clk   => clk,
            reset => reset,
            ce_o  => s_en
        );

    --------------------------------------------------------------------
    -- p_traffic_fsm:
    -- The sequential process with synchronous reset and clock_enable 
    -- entirely controls the s_state signal by CASE statement.
    --------------------------------------------------------------------
    p_traffic_fsm : process(clk)
    begin
        if rising_edge(clk) then    -- 1 clk = 10 ns
            if (reset = '1') then       -- Synchronous reset
                s_state <= DEF ;      -- Set initial state
                s_cnt   <= c_ZERO;      -- Clear all bits

            elsif (s_en = '1') then
                -- Every 1 us, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                case s_state is

                    -- If the current state is DEF, then wait 1 sec
                    -- and move to the next SEND_TRIGG state.
                    when DEF =>
                        -- Count up to c_DELAY_20uSEC
                        echo_count_o <=(others => '0');         ----POZOR ZMENA
                        if (s_reverse = '0' ) then
                            trigger_o <= '0';
                        else
                            -- Move to the next state
                            s_state <= TRIGG_SEND;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                            
                        end if;

                    when TRIGG_SEND =>
                        -- WRITE YOUR CODE HERE
                        ---------------------------------
                        --------------------------------
                        if (s_cnt < c_DELAY_20uSEC) then
                        ------------------------------------
                        ------------------------------------
                            trigger_o <= '1';
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= TRIGG_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;
                        
                    when TRIGG_WAIT =>
                        -- WRITE YOUR CODE HERE
                        if(s_reverse = '0') then
                               s_state <= DEF;
                               s_cnt   <= c_ZERO;
                        else       
                        ------------------------------------
                        ------------------------------------
                            if (s_cnt < c_DELAY_60mSEC) then
                                trigger_o <= '0';
                                s_cnt <= s_cnt + 1;
                                if(echo_i = '1') then
                                    s_cnt_echo <= (others => '0');
                                    s_state <= ECHO_COUNT;
                                    
                                end if;    
                            else
                                s_state <= TRIGG_SEND;
                                s_cnt   <= c_ZERO;
                            end if;
                        end if;
                    when ECHO_COUNT =>
                    
                        -- WRITE YOUR CODE HERE                                
                        if(s_reverse = '0') then
                               s_state <= DEF;
                               s_cnt   <= c_ZERO;
                        else 
                            --while(echo_i = '1') loop
                            if(echo_i = '1') then                                                
                                s_cnt_echo <= s_cnt_echo + 1;  -- 1 count = 1 us                                                          
                            else
                            --end loop;
                            echo_count_o <= s_cnt_echo;                 
                            s_state <= TRIGG_SEND;
                            s_cnt   <= c_ZERO; 
                            end if;                            
                        end if;   
                    when others =>
                        s_state <= DEF;
                        
                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_traffic_fsm;


    --------------------------------------------------------------------
    -- p_output_fsm:
    -- The combinatorial process is sensitive to state changes, and sets
    -- the output signals accordingly. This is an example of a Moore 
    -- state machine because the output is set based on the active state.
    --------------------------------------------------------------------
   -- p_output_fsm : process(s_state)
   -- begin
        --case s_state is
          --  when TRIGG_SEND =>
           --     echo_count_o <= s_cnt_echo;            
           -- when others =>
           --     echo_count_o <=(others => '0');
        --end case;
  --  end process p_output_fsm;
end Behavioral;
