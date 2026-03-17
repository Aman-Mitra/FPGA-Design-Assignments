`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2026 11:46:51
// Design Name: 
// Module Name: mac_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mac_tb(

    );
    reg clk,rst,load;
    reg [3:0] a,b;
    wire [7:0] y;
    wire done;
    
    mac dut(clk, rst,load, a,b,y,done);
    
    initial begin {clk,rst,load,a,b}=0; end
    
    always #5 clk=~clk;
    
    initial begin 
        rst=1'b1;load=1'b0;a=4'd3;b=4'd5;
        #10
        rst=1'b0;load=1'b1;a=4'd3;b=4'd5;
        #10
        rst=1'b0;load=1'b1;a=4'd2;b=4'd9;
        #10
        rst=1'b0;load=1'b1;a=4'd1;b=4'd4;
        #10
        rst=1'b0;load=1'b1;a=4'd2;b=4'd3;
        #10
        rst=1'b0;load=1'b1;a=4'd5;b=4'd2;
        #10
        rst=1'b0;load=1'b0;a=4'd6;b=4'd2;
        #10
        $finish();
    
    end
endmodule
