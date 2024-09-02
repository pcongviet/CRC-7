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

module CRC_Decoder(
    input CLK,
    input reset,
    input en_data,
    input [22:0] DATA_IN,
    output [15:0] DATA_OUT,
    output check_error
    );
	 wire EN_CHECK;
	 Counter_2 IC3 (.clk(CLK),.reset(reset),.en_data(en_data),.en_check(EN_CHECK));
	 decode IC4(.clk(CLK),.reset(reset),.en_data(en_data),.en_check(EN_CHECK),.data_in(DATA_IN),.data_out(DATA_OUT),.check_error(check_error));

endmodule

