module control
#(
    parameter ADDR_WIDTH = 5
)
(
    input  logic                  clk_i,
    input  logic                  error_i,
    output logic                  halt_o,
    output logic                  resume_o,
    output logic                  shift_o,
    output logic [ADDR_WIDTH-1:0] replay_addr_o
);

    localparam NUM_REG = 2**ADDR_WIDTH;

    logic                  done;
    logic                  done_reg;
    logic                  state;
    logic [ADDR_WIDTH-1:0] iterator;
    logic [ADDR_WIDTH-1:0] addr;

    always_comb 
        if (error_i)
            state <= error_i;
        else if (done)
            state <= 0;

    initial done_reg = 1;
    initial done = 1;

    always_ff @(posedge clk_i) 
        if (state && done_reg && done) begin
            iterator <= 0;
            done_reg <= 0;
            done <= 0;
        end else if (iterator < NUM_REG-1) begin
            iterator = iterator + 1;
            addr = iterator;
        end else
            done_reg <= 1;

    always_ff @(posedge clk_i)
        if(done_reg) begin
            shift_o = 1;
            done = 1;
        end else
            shift_o = 0;

    assign replay_addr_o = addr;
    assign halt_o = state;
    assign resume_o = done;
endmodule
