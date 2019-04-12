module control
#(
    parameter ADDR_WIDTH = 5
)
(
    input  logic                  clk,
    input  logic                  error_i,
    output logic                  done_o,
    output logic [ADDR_WIDTH-1:0] replay_addr_o
);

    localparam NUM_REG = 2**ADDR_WIDTH;

    logic                  done;
    logic                  state;
    logic [ADDR_WIDTH-1:0] iterator;
    logic [ADDR_WIDTH-1:0] addr;

    always_comb 
        if (error_i)
            state <= error_i;
        else if (done)
            state <= 0;

    initial done = 1;

    always_ff @(posedge clk) 
        if (state && done) begin
            iterator <= 0;
            done <= 0;
        end else if (iterator < NUM_REG-1) begin
            iterator = iterator + 1;
            addr = iterator;
        end else
            done <= 1;

    assign replay_addr_o = addr;
    assign done_o = done;
endmodule
