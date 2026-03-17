`timescale 1ns / 1ps

//Design and implement a 4-bit counter with arbitrary sequence and active-HIGH async. reset
// and veriify the output 
//Sequence : 3->9->6->4->2->5->10->8->15->3->....

module pattern_counter(
clk,rst,y,count
    );
    input clk,rst;
    output reg [3:0] y;
    
    output reg [3:0] count;
    
    always @(posedge clk or posedge rst)  begin   //Register Block and Output logic
        if (rst) begin
            y<=0;
            count<=4'd3;
        end
        else 
            y<=count;
    end
    
    always @(*) begin  //Next-State Logic
        case (y) 
            4'd3: begin
                count=4'd9;
            end
            4'd9: begin
                count=4'd6;
            end
            4'd6: begin
                count=4'd4;
            end
            4'd4: begin
                count=4'd2;
            end
            4'd2: begin
                count=4'd5;
            end
            4'd5: begin
                count=4'd10;
            end
            4'd10: begin
                count=4'd8;
            end
            4'd8: begin
                count=4'd15;
            end
            4'd15: begin
                count=4'd3;
            end
            default: count=4'd3; 
        endcase
    end 

endmodule
