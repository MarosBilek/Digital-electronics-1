# Lab assigment 03 - Vivado

## Prep. task - Table with connection of slide switches for LEDs on Nexys A7 board

| **LED** | **Connection** | **Switch** | **Connection** | 
| :-: | :-: | :-: | :-: |
| LED0 | H17 | SW0 | J15 |
| LED1 | K15 | SW1 | L16 |
| LED2 | J13 | SW2 | M13 |
| LED3 | N14 | SW3 | R15 |
| LED4 | R18 | SW4 | R17 |
| LED5 | V17 | SW5 | T18 |
| LED6 | U17 | SW6 | U18 |
| LED7 | U16 | SW7 | R13 |
| LED8 | V16 | SW8 | T8 |
| LED9 | T15 | SW9 | U8 |
| LED10 | U14 | SW10 | R16 |
| LED11 | T16 | SW11 | T13 |
| LED12 | V15 | SW12 | H6 |
| LED13 | V14 | SW13 | U12 |
| LED14 | V12 | SW14 | U11 |
| LED15 | V11 | SW15 | V10 |

## Multiplexer - 2-bit wide 4-to-1 mux

### Listing of VHDL architecture from source file `mux_2bit_4to1.vhd` with syntax highlighting

```vhdl
architecture Behavioral of mux_2bit_4to1 is

begin
    
    f_O <= a_i when (sel_i ="00") else
           b_i when (sel_i ="01") else
           c_i when (sel_i ="10") else
           d_i when (sel_i ="11");

end Behavioral;
```

### Listing of VHDL stimulus process from testbench file `tb_mux_2bit_4to1.vhd` with syntax highlighting

```vhdl
p_stimulus : process
    begin
      
        report "Stimulus process started" severity note;
   
        s_d <= "00" ;s_c <="00"; s_b <= "00"; s_a <= "00";
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "11" ;s_c <="00"; s_b <= "01"; s_a <= "00";
        s_sel <= "10"; wait for 100 ns;
        
        s_d <= "00" ;s_c <="00"; s_b <= "11"; s_a <= "10";
        s_sel <= "11"; wait for 100 ns;
        
        s_d <= "10" ;s_c <="01"; s_b <= "11"; s_a <= "10";
        s_sel <= "01"; wait for 100 ns;
 
        report "Stimulus process finished" severity note;
        wait;
        
    end process p_stimulus;

end testbench;
```
![Screenshot with simulated time waveforms](images/graf.png) </br>

## A Vivado tutorial

![Screenshot with simulated time waveforms](images/01.png) </br>
![Screenshot with simulated time waveforms](images/02.png) </br>
![Screenshot with simulated time waveforms](images/03.png) </br>
![Screenshot with simulated time waveforms](images/04.png) </br>
![Screenshot with simulated time waveforms](images/13.png) </br>
![Screenshot with simulated time waveforms](images/05.png) </br>
![Screenshot with simulated time waveforms](images/06.png) </br>
![Screenshot with simulated time waveforms](images/07.png) </br>
![Screenshot with simulated time waveforms](images/08.png) </br>
![Screenshot with simulated time waveforms](images/09.png) </br>
![Screenshot with simulated time waveforms](images/10.png) </br>
![Screenshot with simulated time waveforms](images/11.png) </br>
![Screenshot with simulated time waveforms](images/12.png) </br>

