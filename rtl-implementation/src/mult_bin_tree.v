module mult_bin_tree 
#(
    parameter NUM_MAC = 256,
    parameter WORD_SIZE = 8
    
)(
    clk,
    rst,
    vec_bus_in,
    stat_op_bus_in,
    sum_out
);

localparam OUT_WORD_SIZE = 2 * WORD_SIZE;
localparam IN_BUS_WIDTH = NUM_MAC * WORD_SIZE;
localparam INTERNAL_BUS_WIDTH = NUM_MAC * OUT_WORD_SIZE;

input clk;
input rst;

input [IN_BUS_WIDTH - 1: 0] vec_bus_in;
input [IN_BUS_WIDTH - 1: 0] stat_op_bus_in;

output [OUT_WORD_SIZE - 1: 0] sum_out;

reg [INTERNAL_BUS_WIDTH - 1: 0] mult_out_reg;
reg [INTERNAL_BUS_WIDTH - 1: 0] add_out_reg;
wire [INTERNAL_BUS_WIDTH - 1: 0] add_out_wire;
wire [INTERNAL_BUS_WIDTH - 1: 0] mult_out_wire;

wire [4095:0]tie_low;
assign tie_low = 4096'b0;

assign sum_out = add_out_reg[OUT_WORD_SIZE - 1: 0];

// Adder tree
genvar i;
generate
    for (i = 0; i < NUM_MAC / 2; i=i+1)
    begin
        localparam ii = i + NUM_MAC / 2;
        assign add_out_wire[(i+1) * OUT_WORD_SIZE -1 -: OUT_WORD_SIZE] 
            = add_out_reg[(2*i + 1) * OUT_WORD_SIZE - 1 -: OUT_WORD_SIZE] + add_out_reg[2* (i+1) * OUT_WORD_SIZE -1 -: OUT_WORD_SIZE];

        assign add_out_wire[(ii+1) * OUT_WORD_SIZE -1 -: OUT_WORD_SIZE] 
            = mult_out_reg[(2*i + 1) * OUT_WORD_SIZE - 1 -: OUT_WORD_SIZE] + mult_out_reg[(2*i+2) * OUT_WORD_SIZE -1 -: OUT_WORD_SIZE];
    end
endgenerate

// Multiplier array
generate
    for (i=0; i < NUM_MAC; i=i+1)
    begin
        assign mult_out_wire[(i+1) * OUT_WORD_SIZE - 1 -: OUT_WORD_SIZE] 
            = vec_bus_in[(i+1) * WORD_SIZE - 1 -: WORD_SIZE] * stat_op_bus_in[(i+1) * WORD_SIZE - 1 -: WORD_SIZE];
    end
endgenerate

// Sequential part for register updates
always @(posedge clk, posedge rst)
begin
    if(rst == 1'b1)
    begin
        mult_out_reg = tie_low;
        add_out_reg = tie_low;
    end
    else
    begin
        mult_out_reg = mult_out_wire;
        add_out_reg = add_out_wire;
    end
end

endmodule
