`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 15:06:28
// Design Name: 
// Module Name: random
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


module random(  
    input [11:0]ENEMY_Y,
    input [11:0]ENEMY_X,
    input  clk,      /*clock signal*/  
//    input  load,     /*load seed to rand_num,active high */  
    output reg[9:0]randint  /*random number output*/  
);  

//reg seed = 10'd233; 
//reg load=0;  
//reg [15:0]count;

//always@(posedge clk)
//begin
    //if(count==16'd62500) begin load<=1'b1; end
    //else if(count==16'd63500)begin load<=1'b0;count<=count; end
    //else count<=count;
//end

always@(clk)  
begin
    if(ENEMY_X<=12'd30)
        begin  
    //if(load)  
        //randint <=seed;    /*load the initial value when load is active*/  
    //else  
        //begin 
        case(ENEMY_Y) 
        12'd350: begin randint<=12'd550; end
        12'd550:begin randint<=12'd250;end
        12'd250:begin randint<=12'd450;end
        12'd450:begin randint<=12'd370; end
        12'd370:begin randint<=12'd630;end
        12'd630:begin randint<=12'd130;end
        12'd130:begin randint<=12'd350;end
                   
        endcase
        //end  
        end        
end 

endmodule  
