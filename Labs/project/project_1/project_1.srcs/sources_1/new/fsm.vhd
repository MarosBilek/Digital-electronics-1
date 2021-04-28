----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.04.2021 21:54:53
-- Design Name: 
-- Module Name: fsm - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm is
    Port ( --echo     : in STD_LOGIC;
           --trigger  : out STD_LOGIC;
           sound    : out STD_LOGIC;
           --t        : in std_logic;
           clock    : in STD_LOGIC;
           reset    : in std_logic
           --distance : out STD_LOGIC_VECTOR (6 downto 0)
           );

end fsm;

architecture Behavioral of fsm is
    --type t_state is (OFF, TRIG_SEND, ECHO_CATCH);

    --signal s_state : t_state;

    signal s_en    : std_logic;
    signal s_sound : std_logic;

begin

    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 3
            )
            port map(
                clk => clock,
                reset => reset,
                ce_o => s_en
            );
p_sound : process (clock)
 begin
    if rising_edge (clock) then
        if(reset = '1') then
            s_sound <= '0';
        else
            if(s_en = '1') then
            s_sound <=not s_sound;
            else
                s_sound <=  s_sound;
            end if;
        end if;
    end if;
        end process p_sound;
        sound <= s_sound;
        
end Behavioral;