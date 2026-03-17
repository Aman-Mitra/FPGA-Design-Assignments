`timescale 1ns / 1ps

module edge_detector(
    clk,rst,signal_in,rising_edge,falling_edge
    );
    input clk;
    input rst;
    input signal_in;
    output reg rising_edge;
    output reg falling_edge;
    
    reg previous_state=0;
    
    always @(posedge clk or posedge rst)  begin 
        if (rst) begin          //reset not mentioned
            previous_state<=0;
            rising_edge<=0;
            falling_edge<=0;           
        end
        if (signal_in && !previous_state) begin
            rising_edge<=1;
            falling_edge<=0;
            previous_state<=signal_in;
        end
        else if (!signal_in && previous_state) begin
            rising_edge<=0;
            falling_edge<=1;
            previous_state<=signal_in;
        end
        else begin
            rising_edge<=0;
            falling_edge<=0;
            previous_state<=signal_in;
        end
    end
    

endmodule
