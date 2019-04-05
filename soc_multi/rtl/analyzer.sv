module analyzer
(
	input  logic [31:0] result1,
	input  logic [31:0] result2,
	input  logic [31:0] addr1,
	input  logic [31:0] addr2,
	output logic        signal,
	output logic [31:0] data
);

	always_comb 
		if(result1 == result2 && addr1 == addr2) begin
			signal  <= 1'b0;
			data    <= result1;
		end else
			signal  <= 1'b1;
endmodule
