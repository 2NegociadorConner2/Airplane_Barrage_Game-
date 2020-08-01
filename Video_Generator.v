`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 11:46:09
// Design Name: 
// Module Name: Video_Generator
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


module Video_Generator(
    input clk,
    input [1:0]CRASH,
    input [11:0]PLANE_x,//bpos_x
    input [11:0]PLANE_y,//bpos_y
    input [11:0]ENEMY_x,//pippos_x1
    input [11:0]ENEMY_y,//pippos_y1
    input [11:0]ENEMYPRO_x,
    input [11:0]ENEMYPRO_y, 
    input [11:0]ENEMYPRO_x2,
    input [11:0]ENEMYPRO_y2,   
    input RGB_VDE,
    input [11:0]Set_X,
    input [11:0]Set_Y,
    output reg[23:0]RGB_Data=24'hffff00    //RBG
    );
    reg [13:0]Address=0;
    wire [7:0]R_Data;
    wire [7:0]G_Data;
    wire [7:0]B_Data;

always@(*)
     
            begin
                if (
                (Set_X>=PLANE_x-12'd50 && Set_X<=PLANE_x+12'd50 && Set_Y>=PLANE_y-12'd10 && Set_Y<=PLANE_y+12'd10)||(Set_X<=PLANE_x+10 && Set_X>=PLANE_x-10 &&((Set_Y>=PLANE_y+10 && Set_Y<=PLANE_y+70)||(Set_Y<=PLANE_y-10 && Set_Y>=PLANE_y-70)))||(Set_X<=PLANE_x-30 && Set_X>=PLANE_x-50 && ((Set_Y<=PLANE_y+30 && Set_Y>=PLANE_y+10)||(Set_Y<=PLANE_y-10 && Set_Y>=PLANE_y-30)))
                )
                   begin
                      RGB_Data<=24'h00ff00;
                   end
                else if(
                (Set_X>=ENEMY_x-12'd20 && Set_X<=ENEMY_x+12'd20 && Set_Y>=ENEMY_y-12'd20 && Set_Y<=ENEMY_y+12'd20)
                )
                  begin  
                       RGB_Data<= 24'hffffff;
                  end
                //generate enemy1
                else if(
                (Set_X>=ENEMYPRO_x-12'd20 && Set_X<=ENEMYPRO_x+12'd20 && Set_Y>=ENEMYPRO_y-12'd20 && Set_Y<=ENEMYPRO_y+12'd20)
                )
                  begin  
                       RGB_Data<= 24'hffffff;
                  end
                  //generate enemy2
                 else if(
                (Set_X>=ENEMYPRO_x2-12'd20 && Set_X<=ENEMYPRO_x2+12'd20 && Set_Y>=ENEMYPRO_y2-12'd20 && Set_Y<=ENEMYPRO_y2+12'd20)
                )
                  begin  
                       RGB_Data<= 24'hffffff;
                  end                   
                else
                   begin
                   if(CRASH==1'b1) begin RGB_Data<=24'hff0000;end
                   else begin RGB_Data<=24'h0000ff; end
                   end
             end
    

endmodule
//    parameter bpos_x0=12'd180;
//    parameter bpos_y0=12'd360;
//   always@(*)
//         begin
           

//             if ( (Set_X>=bpos_x-12'd30) && (Set_X<=bpos_x+12'd30) )
//                begin
//                   if( (Set_Y>=bpos_y-12'd20) && (Set_Y<=bpos_y+12'd20) )
//                      RGB_Data<=24'h86edb0;
//                   else 
//                      begin
//                            if( Set_X >= pippos_x1-12'd25 && Set_X <=pippos_x1+12'd25 )
//                            begin
//                                  if( (Set_Y>=0 && Set_Y<=pippos_y1)||( Set_Y>=pippos_y2 && Set_Y<=12'd720 ) )
//                                  RGB_Data<= 24'h86c3ed;
//                                  else RGB_Data<=24'hffffff;
//                            end
//                            else RGB_Data<=24'hffffff;
//                      end
//                end
//             else if( Set_X >= pippos_x1-12'd25 && Set_X <=pippos_x1+12'd25 )
//               begin
//                   if( (Set_Y>=0 && Set_Y<=pippos_y1)||( Set_Y>=pippos_y2 && Set_Y<=12'd720 ) )
//                    RGB_Data<= 24'h86c3ed;
//                   else RGB_Data<=24'hffffff;
//               end
//             else
//                RGB_Data<=24'hffffff; 
//          end
   
//   always@(posedge clk)
//   begin
//     if(pos_y<=100) pos_y<=100;
//     else if(pos_y>=720) pos_y<=710;
//     else if(key1) pos_y<=pos_y+12'd2;
//     else if(key2) pos_y<=pos_y-12'd2;
//     else  pos_y<=pos_y; 
//   end
   
//    Picture_R_Rom R_ROM (
//      .clka(clk),    // input wire clka
//      .ena(1),      // input wire ena
//      .addra(Address),  // input wire [13 : 0] addra
//      .douta(R_Data)  // output wire [7 : 0] douta
//    );
//    Picture_G_Rom G_ROM (
//      .clka(clk),    // input wire clka
//      .ena(1),      // input wire ena
//      .addra(Address),  // input wire [13 : 0] addra
//      .douta(G_Data)  // output wire [7 : 0] douta
//    );
//    Picture_B_Rom B_ROM (
//      .clka(clk),    // input wire clka
//      .ena(1),      // input wire ena
//      .addra(Address),  // input wire [13 : 0] addra
//      .douta(B_Data)  // output wire [7 : 0] douta
//    );



