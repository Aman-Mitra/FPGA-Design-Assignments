`timescale 1ns / 1ps

module pattern_counter_tb();
    reg clk,rst;
    wire [3:0] y;
    wire [3:0] count;
    pattern_counter pt1(clk,rst,y,count);
    
    initial {clk,rst}=0; //initialization
    
    always #5 clk=~clk; //clk toggling
    
    initial begin
        rst=1;
        #10;
        rst=0;
        #200
        $finish();    
    end
    
endmodule
