module keyboard(kr,kc,press,scan_code);
	input [3:0] kr;
	input [3:0] kc;
	output reg press;
	output reg [3:0] scan_code;
	always@(kr or kc) begin
		case(kr)
			4'b1110:
				case(kc)
					4'b1110:begin
						press = 1'b1;
						scan_code = 4'h0;
						end
					4'b1101:begin
						press = 1'b1;
						scan_code = 4'h1;
						end
					4'b1011:begin
						press = 1'b1;
						scan_code =4'h2;
						end
					4'b0111:begin
						press = 1'b1;
						scan_code= 4'h3;
						end
					default:begin
						press=1'b0;
						scan_code=4'h0;
						end
				endcase
			4'b1101:
				case(kc)
					4'b1110:begin
						press = 1'b1;
						scan_code = 4'h4;
						end
					4'b1101:begin
						press = 1'b1;
						scan_code = 4'h5;
						end
					4'b1011:begin
						press = 1'b1;
						scan_code = 4'h6;
						end
					4'b0111:begin
						press = 1'b1;
						scan_code= 4'h7;
						end
					default:begin
						press=1'b0;
						scan_code=4'h0;
						end
				endcase
			4'b1011:
				case(kc)
					4'b1110:begin
						press = 1'b1;
						scan_code = 4'h8;
						end
					4'b1101:begin
						press = 1'b1;
						scan_code = 4'h9;
						end
					4'b1011:begin
						press = 1'b1;
						scan_code = 4'hA;
						end
					4'b0111:begin
						press = 1'b1;
						scan_code= 4'hB;
						end
					default:begin
						press=1'b0;
						scan_code=4'h0;
						end
				endcase
			4'b0111:
				case(kc)
					4'b1110:begin
						press = 1'b1;
						scan_code = 4'hC;
						end
					4'b1101:begin
						press = 1'b1;
						scan_code = 4'hD;
						end
					4'b1011:begin
						press = 1'b1;
						scan_code = 4'hE;
						end
					4'b0111:begin
						press = 1'b1;
						scan_code= 4'hF;
						end
					default:begin
						press=1'b0;
						scan_code=4'h0;
						end
				endcase
			default:begin
				press = 1'b0;
				scan_code = 4'h0;
				end
		endcase
	end
endmodule 