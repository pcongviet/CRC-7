`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:11 04/30/2023 
// Design Name: 
// Module Name:    CRC_Encoder 
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
module counter(
	 input clk,
	 input reset,
	 input en_data,
	 output reg en_crc
	 );
	 reg [3:0] cnt;
	 
	 always @ (posedge clk)
	 begin
	 if(reset)
	 begin
	 cnt<=4'b0;
	 en_crc<=1'b0;
	 end
	 else
	 if(en_data ==1'b1)
		begin
		cnt<=4'b0;
		en_crc<=1'b1;
		end
	 else
		if(cnt==4'b1111)
			en_crc<=1'b0;
		else
			begin
			en_crc<=1'b1;
			cnt<=cnt+1'b1;
			end
	end
endmodule

