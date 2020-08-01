`timescale 1ns / 1ps

module ENEMY_PRO2(input CRASH,input clk,input [9:0]randint,output [11:0]ENEMYPRO_x2,output [11:0]ENEMYPRO_y2);
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
            if(moveflag)begin ENEMY_X<=ENEMY_X-2'b10;ENEMY_Y<=ENEMY_Y+3'b101; end
            else if(ENEMY_X<=30)begin ENEMY_X<=12'd1180;ENEMY_Y<=randint; end
            else if(ENEMY_Y>=700)begin ENEMY_Y<=12'd20;end
            else if(CRASH)begin ENEMY_X<=12'd1180;end
            else begin ENEMY_X<=ENEMY_X; end
        end

assign ENEMYPRO_x2=ENEMY_X;
assign ENEMYPRO_y2=ENEMY_Y;

endmodule

