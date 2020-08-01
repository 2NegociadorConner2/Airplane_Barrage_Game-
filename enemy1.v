`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 17:27:42
// Design Name: 
// Module Name: enemy1
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

module enemy1(input clk,input CRASH,
    input [9:0]randint,
    output [11:0]ENEMY2_x,
    output [11:0]ENEMY2_y//斜飞模块enemy

    );
    reg [11:0]ENEMY_X=12'd1270;
    reg [11:0]ENEMY_Y=12'd680;
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
    
    always@(clk)
        begin
            if(moveflag)begin ENEMY_X<=ENEMY_X-5'd6;ENEMY_Y<=ENEMY_Y-5'd4; end
            else if(ENEMY_X<=10)begin ENEMY_X<=12'd1280;ENEMY_Y<=randint; end
            else begin ENEMY_X<=ENEMY_X; end
        end

assign ENEMY_x=ENEMY_X;
assign ENEMY_y=ENEMY_Y;
endmodule
