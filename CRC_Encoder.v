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

module CRC_Encoder(
    input CLK,
    input reset,
    input en_data,
    input [15:0] DATA_IN,
    output [22:0] DATA_OUT,
    output [6:0] CRC_OUT,
    output CRC_Ready
    );
	 wire EN_CRC;
	 counter IC1(.clk(CLK),.reset(reset),.en_data(en_data),.en_crc(EN_CRC));
	 encode IC2(.clk(CLK),.reset(reset),.data_in(DATA_IN),.en_data(en_data),.en_crc(EN_CRC),.data_out(DATA_OUT),.crc_out(CRC_OUT),.crc_ready(CRC_Ready));
endmodule
	 