`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 13:09:46
// Design Name: 
// Module Name: ENEMY
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


module ENEMY(input CRASH,input clk,input [9:0]randint,output [11:0]ENEMY_x,output [11:0]ENEMY_y);
    reg [11:0]ENEMY_X=12'd1180;
    reg [11:0]ENEMY_Y=12'd350;
    reg [31:0]count=0;
    reg moveflag=0;
    
    always@(posedge clk)
        begin
            if(!CRASH)
            begin
               if(count==32'd1000000) begin moveflag<=1'b1;count<=1'd0;  end
               else begin moveflag<=1'b0;count<=count+1'd1; end
            end
        end

    always@(posedge clk)
        begin
            if(moveflag)begin ENEMY_X<=ENEMY_X-3'b111; end
            else if(ENEMY_X<=30)begin ENEMY_X<=12'd1180;ENEMY_Y<=randint; end
            else if(CRASH)begin ENEMY_X<=12'd1180;end
            else begin ENEMY_X<=ENEMY_X; end
        end

assign ENEMY_x=ENEMY_X;
assign ENEMY_y=ENEMY_Y;

endmodule
