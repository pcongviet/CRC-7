`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:25 05/02/2023 
// Design Name: 
// Module Name:    CRC_Decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Counter_2(
	 input clk,
	 input reset,
	 input en_data,
	 output reg en_check
	 );
	 reg [3:0] cnt;
	 initial begin
	 en_check<=1'b1;
	 end
	 always @ (posedge clk)
	 begin
	 if(reset)
	 begin
	 cnt<=4'b0;
	 en_check<=1'b0;
	 end
	 else
	 if(en_data ==1'b1)
		begin
		cnt<=4'b0;
		en_check<=1'b1;
		end
	 else
		if(cnt==4'b1111)
			en_check<=1'b0;
		else
			begin
			en_check<=1'b1;
			cnt<=cnt+1'b1;
			end
	end
endmodule