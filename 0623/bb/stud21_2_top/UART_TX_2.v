module UART_TX_2(
	input clk,
	input rst,
	input i_RX_Bit_1,
	output [3:0] o_RX_Byte,
	output reg [23:0] key_buf_code_1
);
	parameter [1:0] RX_START_ST = 2'd0;
	parameter [1:0] RX_DATA_ST = 2'd1;
	parameter [1:0] RX_STOP_ST = 2'd2;
	
	reg [1:0] r_SM_Main = RX_START_ST;
	reg [2:0] r_Byte_Idx = 3'd0;
	reg [3:0] r_RX_Byte = 4'd0;
	
	assign o_RX_Byte = r_RX_Byte;
	
	always @(posedge clk or posedge rst ) begin
		if( rst == 1'b1)begin
			r_Byte_Idx = 3'd0;
			r_RX_Byte =4'b0;
			r_SM_Main = RX_START_ST;
		end
		else begin
			case(r_SM_Main)
				RX_START_ST: begin
					r_Byte_Idx = 3'd0;

					if(i_RX_Bit_1 == 1'b0)
						r_SM_Main = RX_DATA_ST;
					else
						r_SM_Main = RX_START_ST;
				end
				RX_DATA_ST:begin
					r_RX_Byte[r_Byte_Idx] = i_RX_Bit_1 ;
					
					if(r_Byte_Idx < 3'd3)begin
						r_Byte_Idx = r_Byte_Idx+3'd1;
						r_SM_Main = RX_DATA_ST;
					end
					else
						r_SM_Main = RX_STOP_ST;
				end
				RX_STOP_ST: begin
					r_SM_Main = RX_START_ST;
					key_buf_code_1[23:0] = {key_buf_code_1[19:0],r_RX_Byte};
				end
				default:
					r_SM_Main = RX_START_ST;
			endcase 
		end
	end 
endmodule 