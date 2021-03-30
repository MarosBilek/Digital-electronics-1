
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is
  Port ( 
        BTNU : in  STD_LOGIC;
        BTNC : in  STD_LOGIC;
        SW   : in  STD_LOGIC_VECTOR (0 downto 0);
        LED  : out STD_LOGIC_VECTOR (3 downto 0)
   );
end top;

architecture Behavioral of top is
    signal  s_q     :   std_logic_vector(4 - 1 downto 0);
    signal  s_dbnc  :   std_logic_vector(4 - 1 downto 0);
begin
--------------------------------------------------------------------
    -- Four instances (copies) of D type FF entity
    d_ff_0 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            d     => SW (0),
            q     => s_q (0)
        );

    d_ff_1 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            d     => s_q (0),
            q     => s_q (1)
        );

    d_ff_2 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            d     => s_q (1),
            q     => s_q (2)
        );

     d_ff_3 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            d     => s_q (2),
            q     => s_q (3)
        );
    LED <= s_q;
end Behavioral;
