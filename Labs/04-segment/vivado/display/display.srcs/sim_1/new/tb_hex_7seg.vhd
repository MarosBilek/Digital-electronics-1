

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_hex_7seg is
    
end tb_hex_7seg;

architecture testbench of tb_hex_7seg is

    signal s_hex    : std_logic_vector(4 - 1 downto 0);
    signal s_seg    : std_logic_vector(7 - 1 downto 0);
     

begin
    uut_hex_7seg : entity work.hex_7seg
    port map(   
        hex_i   => s_hex,
        seg_o   => s_seg
    );
 p_7seg_decoder : process
    begin
        s_hex <= "0000";
        wait for 100 ns;
        assert (s_seg = "0000001")
        report "Simulation unsucessful for input: 0" severity error;
        
        s_hex <= "0001";
        wait for 100 ns;
        assert (s_seg = "1001111")
        report "Simulation unsucessful for input: 1" severity error;
        
        s_hex <= "0010";
        wait for 100 ns;
        assert (s_seg = "0010010")
        report "Simulation unsucessful for input: 2" severity error;
        
        s_hex <= "0011";
        wait for 100 ns;
        assert (s_seg = "0000110")
        report "Simulation unsucessful for input: 3" severity error;
        
        s_hex <= "0100";
        wait for 100 ns;
        assert (s_seg = "1001100")
        report "Simulation unsucessful for input: 4" severity error;
        
        s_hex <= "0101";
        wait for 100 ns;
        assert (s_seg = "0100100")
        report "Simulation unsucessful for input: 5" severity error;
        
        s_hex <= "0110";
        wait for 100 ns;
        assert (s_seg = "0100000")
        report "Simulation unsucessful for input: 6" severity error;
        
        s_hex <= "0111";
        wait for 100 ns;
        assert (s_seg = "0001111")
        report "Simulation unsucessful for input: 7" severity error;
        
        s_hex <= "1000";
        wait for 100 ns;
        assert (s_seg = "0000000")
        report "Simulation unsucessful for input: 8" severity error;
        
        s_hex <= "1001";
        wait for 100 ns;
        assert (s_seg = "0000100")
        report "Simulation unsucessful for input: 9" severity error;
        
        s_hex <= "1010";
        wait for 100 ns;
        assert (s_seg = "0001000")
        report "Simulation unsucessful for input: 10" severity error;
        
        s_hex <= "1011";
        wait for 100 ns;
        assert (s_seg = "1100000")
        report "Simulation unsucessful for input: 11" severity error;
        
        s_hex <= "1100";
        wait for 100 ns;
        assert (s_seg = "0110001")
        report "Simulation unsucessful for input: 12" severity error;
        
        s_hex <= "1101";
        wait for 100 ns;
        assert (s_seg = "1000010")
        report "Simulation unsucessful for input: 13" severity error; 
        
        s_hex <= "1110";
        wait for 100 ns;
        assert (s_seg = "0110000")
        report "Simulation unsucessful for input: 14" severity error;
        
        s_hex <= "1111";
        wait for 100 ns;
        assert (s_seg = "0111000")
        report "Simulation unsucessful for input: 15" severity error;
        wait;
    end process p_7seg_decoder;

end testbench;
