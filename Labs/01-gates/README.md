
## DeMorgan prva funkcia
```vhdl
begin
    f_o  <= ((not b_i) and a_i) or ((not c_i) and (not b_i));
    
end architecture dataflow;
```
![Simulacia DeMorgan prvej funkcie](images/simFDmor.png)

[EDA Playground link](https://www.edaplayground.com/x/8LrZ)