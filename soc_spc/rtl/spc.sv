module spc
(
	input               clk,
	input               rst_n,
	input               signal,
	input  logic [31:0] spc_i,        
	output logic [31:0] spc_o
);

	logic [31:0] pc;

	always_ff @(negedge clk)
		if (signal)
			spc_o <= pc;
		else
			pc <= spc_i;	
	
	always_ff @(negedge clk, negedge rst_n)
		if (!rst_n)
			pc <= 32'd0;

endmodule
