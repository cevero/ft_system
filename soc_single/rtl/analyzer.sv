module analyzer
(
	input logic [31:0]  result1,
	input logic [31:0]  result2,
	output logic        reset,
	output logic        signal,
	output logic [31:0] data
);

	logic [31:0] buffer;
	logic change;

	assign change = (result1 == result2);

	always_comb 
		if(change) begin
			reset     <= 1'b0;
			signal    <= 1'b0;
			data      <= result1;
		end else begin
			reset     <= 1'b1;
			signal    <= 1'b1;
		end
endmodule
