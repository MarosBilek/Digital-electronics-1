----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.04.2021 22:04:27
-- Design Name: 
-- Module Name: tb_fsm - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_fsm is
--  Port ( );
end tb_fsm;

architecture Behavioral of tb_fsm is

    constant c_CLK_100MHZ_PERIOD : time := 10ns;

    --signal s_en    : std_logic;
    signal s_sound : std_logic;
    signal s_clock : std_logic;
    signal s_reset : std_logic;
   -- signal s_t     : std_logic;

begin

hola : entity work.fsm

port map(  
           sound    => s_sound,
           clock    => s_clock,
           reset    => s_reset
);
p_clk_gen : process
begin
    while now < 750ns loop
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
    wait for 20 ns;
    
    s_reset<= '0';
    wait;
    
end process p_stimulus;

end Behavioral;
