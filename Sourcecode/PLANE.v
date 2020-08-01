`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 12:55:19
// Design Name: 
// Module Name: PLANE
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


module PLANE(input key1,input key2,input clk,output [11:0]PLANE_x,output [11:0]PLANE_y);
    reg [11:0]PLANE_X=12'd200;
    reg [11:0]PLANE_Y=12'd360;
    
    always@(posedge clk)
        begin
            if(key1&&PLANE_Y>=10)  PLANE_Y<=PLANE_Y-5'd12;
            else if(key2&&PLANE_Y<=710) PLANE_Y<=PLANE_Y+5'd12;
            else  PLANE_Y<=PLANE_Y;
        end
    assign PLANE_x=PLANE_X;
    assign PLANE_y=PLANE_Y;
      
endmodule
