`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 15:12:31
// Design Name: 
// Module Name: BUTTON
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


module BUTTON(input clk,input button1,input button2,output reg key1,output reg key2);
 reg [22:0]count1;
 reg [22:0]count2;
   always@(posedge clk)
    begin
        if(count1>=23'd5000000&&(!button1))begin count1<=23'd0;key1<=1;end
        else if(!button1)begin count1<=count1+23'd1;key1<=0;end
        else begin count1<=23'd0;key1<=0;end
    end
    
    //always@(posedge clk)
    //begin
     //   if(count1==23'd1485000) key1<=1'b1;
     //   else key1<=0;
   // end
 ///////////////////////////////////////////   
 always@(posedge clk)
    begin
        if(count2>=23'd5000000&&(!button2))begin count2<=1'd0;key2<=1;end
        else if(!button2)begin count2<=count2+1'd1;key2<=0;end
        else begin count2<=1'd0;key2<=0;end
    end
    
  //  always@(posedge clk)
  //  begin
   //     if(count2==23'd1485000) key2<=1'b1;
     //   else key2<=0;
    //end
    
    
endmodule
