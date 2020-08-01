`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 00:21:18
// Design Name: 
// Module Name: CRASH
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


module crash(
    input clk,
    input button1,
    input button2,
    input [11:0]ENEMY_X,
    input [11:0]ENEMY_Y,
    input [11:0]ENEMYPRO_X,
    input [11:0]ENEMYPRO_Y,
    input [11:0]ENEMYPRO_X2,
    input [11:0]ENEMYPRO_Y2,
    input [11:0]PLANE_X,
    input [11:0]PLANE_Y,
    output reg CRASH = 1'b0
    );
   // reg [29:0]counter;
    always@(posedge clk)
        begin
            if(ENEMY_X-PLANE_X<=70 && ENEMY_Y<PLANE_Y+90 && ENEMY_Y>PLANE_Y-90)
                begin
                    //counter<=30'd0 ;  
                    CRASH<=1'b1;
                end
            if((ENEMYPRO_X-PLANE_X<=70 || PLANE_X-ENEMYPRO_X<=70) && ENEMYPRO_Y<PLANE_Y+90 && ENEMYPRO_Y>PLANE_Y-90)
                begin
                    //counter<=30'd0 ;  
                    CRASH<=1'b1;
                end
            if((ENEMYPRO_X2-PLANE_X<=70 || PLANE_X-ENEMYPRO_X2<=70) && ENEMYPRO_Y2<PLANE_Y+90 && ENEMYPRO_Y2>PLANE_Y-90)
                begin
                    //counter<=30'd0 ;  
                    CRASH<=1'b1;
                end
            if(!button1)
                begin
                    CRASH<=1'b0;
                end
                
            
        end
    
  //  always@(clk)
    //    begin
            //if(counter==30'd500000000) begin counter<=30'd0;CRASH<=1'b0;end
         //   else begin counter<=counter+1'd1; end
            
       // end
endmodule
