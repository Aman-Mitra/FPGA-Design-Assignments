`timescale 1ns / 1ps

module edge_detector_tb();
    reg clk,rst,signal_in;
    wire rising_edge,falling_edge;
    
    edge_detector edge_detector(clk,rst,signal_in,rising_edge,falling_edge);
    
    always #5 clk=~clk;    //clock creation
    
    initial {clk,rst,signal_in}=0;   //initialization
    
    initial begin
        rst=1;signal_in=0;
        #5
        rst=0;signal_in=1;
        #10
        rst=0;signal_in=0;
        #10
        rst=0;signal_in=1;
        #10
        rst=0;signal_in=1;
        #10
        rst=0;signal_in=0;
        #10
        rst=0;signal_in=0;
        #10
        rst=0;signal_in=1;
        #10;
    $finish();
    end
endmodule
