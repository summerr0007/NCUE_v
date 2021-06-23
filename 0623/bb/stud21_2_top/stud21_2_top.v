module stud21_2_top(
	input clk,
	input rst,
	input i_RX_Bit_1,
//	input i_RX_Bit_2,
	output [3:0] o_RX_Byte,
	output reg [23:0] key_buf_code_1
//	output reg [23:0] key_buf_code_2
);
	UART_TX_1 m1(clk,rst,i_RX_Bit_1,o_RX_Byte,key_buf_code_1);
	
	
endmodule