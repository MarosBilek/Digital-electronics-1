

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_d_latch is
    --Port ( );
end tb_d_latch;

architecture Behavioral of tb_d_latch is

   signal        s_en    :   STD_LOGIC;
   signal        s_d     :   STD_LOGIC;
   signal        s_arst  :   STD_LOGIC;
   signal        s_q     :   STD_LOGIC;
   signal        s_q_bar :   STD_LOGIC;

begin
    uut_d_latch : entity work.d_latch
            port map
            (
            en       => s_en,
            d        => s_d,
            arst     => s_arst,
            q        => s_q,
            q_bar    => s_q_bar
            );
            
     p_stimulus : process
     begin
     
     s_en       <= '0';
     s_d        <= '0';
     s_arst     <= '0';
     wait for 10 ns;
     
     s_d        <= '1';
     wait for 20 ns;
     s_d        <= '0';
     wait for 20 ns;
     s_d        <= '1';
     wait for 20 ns;
     s_d        <= '0';
     wait for 20 ns;
     assert (s_q = '1' and s_q_bar = '0') report "EMPTY SEQUENCE ERROR" severity error;
     --sequence with enable active
     ---------
     s_en   <= '1';     --enabled
     ---------
     s_d        <= '1';
     wait for 20 ns;
     ---------
     s_en   <= '1';     --enabled
     ---------
     s_d        <= '0';
     wait for 20 ns;
     ---------
     s_en   <= '1';     --enabled
     ---------
     s_d        <= '1';
     wait for 20 ns;
     ---------
     s_en   <= '1';     --enabled
     ---------
     s_d        <= '0';
     wait for 20 ns;
     assert (s_q = '1' and s_q_bar = '0') report "ENABLE SEQUENCE ERROR" severity error;
     --sequence with enable and reset active
     ---------
     s_en   <= '1';     --enabled
     ---------
     s_arst <= '1';     --reset
     s_d    <= '1';
     wait for 20 ns;
     ---------
     s_en   <= '1';     --enabled
     ---------
     s_arst <= '1';     --reset
     s_d    <= '0';
     wait for 20 ns;
     ---------
     s_en   <= '1';     --enabled
     ---------
     s_arst <= '1';     --reset
     s_d    <= '1';
     wait for 20 ns;
     ---------
     s_en   <= '1';     --enabled
     ---------
     s_arst <= '1';     --reset
     s_d    <= '0';
     wait for 20 ns;
     ---------
     s_en   <= '0';     --enabled
     ---------
     s_arst <= '1';     --reset
     s_d    <= '1';
     wait for 20 ns;
     ---------
     s_en   <= '1';     --enabled
     ---------
     s_arst <= '0';     --reset
     s_d    <= '1';
     wait for 20 ns;
     assert (s_q = '1' and s_q_bar = '0') report "ENABLE AND RESET SEQUENCE ERROR" severity error;
     wait;
     
      
     
     end process p_stimulus;

end Behavioral;
