
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity top is
    Port ( 
           CLK100MHZ : in  STD_LOGIC;
           BTNC      : in  STD_LOGIC;
           BTND      : in  STD_LOGIC;
           SW        : in  STD_LOGIC_VECTOR (1 downto 0);
           LED       : out STD_LOGIC_VECTOR (3 downto 0);
           CA        : out STD_LOGIC;
           CB        : out STD_LOGIC;
           CC        : out STD_LOGIC;
           CD        : out STD_LOGIC;
           CE        : out STD_LOGIC;
           CF        : out STD_LOGIC;
           CG        : out STD_LOGIC;
           AN        : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is
        signal s_en  : std_logic;
        signal s_cnt : std_logic_vector(4 - 1 downto 0);
        
        signal s_en_16  : std_logic;
        signal s_cnt_16 : std_logic_vector(16 - 1 downto 0);
begin
    clk_en0 : entity work.clock_enable
            generic map(
                g_MAX => 2500000
            )
            port map (
            clk => CLK100MHZ,
            reset => BTNC,
            ce_o => s_en
            );
    bin_cnt0 : entity work.cnt_up_down
            generic map (
            g_CNT_WIDTH => 4
            )
            port map (
            clk => CLK100MHZ,
            reset => BTNC,
            en_i => s_en,
            cnt_up_i => SW(0),
            cnt_o => s_cnt   
            );
            
     clk_en16 : entity work.clock_enable
        generic map(
            g_MAX   =>  1000000
        )
        
        port map(
            clk =>  CLK100MHZ,
            reset =>  BTND,
            ce_o =>  s_en_16
        );
        
        bin_cnt1 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH =>  16
        )
        port map(
            clk =>  CLK100MHZ,
            reset =>  BTND,
            en_i =>  s_en_16,
            cnt_up_i =>  SW(1),
            cnt_o =>  s_cnt_16
        );
     -- Display input value on LEDs
    LED(15 downto 0) <= s_cnt_16;
    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity
    hex2seg : entity work.hex_7seg
        port map(
            hex_i    => s_cnt, --for 16bit counter need to replace s_cnt for s_cnt_16
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG
        );
    -- Connect one common anode to 3.3V
    AN <= b"1111_1110";
            
end Behavioral;
