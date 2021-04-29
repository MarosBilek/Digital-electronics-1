

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity fsm is
    Port ( 
           
           sound    : out STD_LOGIC;
           clock    : in STD_LOGIC;
           reset    : in std_logic
           
           );

end fsm;

architecture Behavioral of fsm is
    
    signal s_en    : std_logic;
    signal s_sound : std_logic;

begin

    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 2
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