`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2026 11:36:59
// Design Name: 
// Module Name: mac
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


module mac(
    clk, rst,load, a,b,y,done
    );
    input clk,rst,load;
    input [3:0] a,b;
    output reg [7:0] y;
    output reg done;
    
    integer i;
    reg [1:0] count;
    wire [7:0] prod;
    
    assign prod=a*b;
    
    always @(posedge clk)   begin 
        if (rst) begin 
            y<=8'd0;
            count<=2'b0;
            done<=1'b0;
        end
        else if (load && !done) begin 
            y<=y+prod;
            count<=count+2'b1;
            
            if (count==2'd3)    begin
                done<=1'b1;
                count<=2'd0;
            end
        end      
       else begin 
            y<=y;
            done<=1'b0;
       end
    end
endmodule


