`include "smart_mac.v"
`include "traditional_systolic_array.v"

module smart_systolic_cell
#(
    parameter WORD_SIZE = 16,
    parameter CELL_WIDTH = 4,
    parameter CELL_HEIGHT = 4
)(
    clk,
    rst,
    
    fsm_op2_select_in,
    fsm_out_select_in,
    stat_bit_bus_in,

    capture_smart_left_sel_in,
    capture_smart_top_sel_in,
    latch_smart_right_sel_in,
    latch_smart_bottom_sel_in,

    hor_smart_bus_in,
    ver_smart_bus_in,
    hor_smart_bus_out,
    ver_smart_bus_out,

    left_in_bus,
    top_in_bus,
    right_out_bus,
    bottom_out_bus

);

input clk;
input rst;

input fsm_op2_select_in;
input fsm_out_select_in;
input stat_bit_bus_in;

input capture_smart_left_sel_in;
input capture_smart_top_sel_in;
input latch_smart_right_sel_in;
input latch_smart_bottom_sel_in;

input [CELL_HEIGHT * WORD_SIZE - 1: 0] hor_smart_bus_in;
output [CELL_HEIGHT * WORD_SIZE - 1: 0] hor_smart_bus_out;
input [CELL_HEIGHT * WORD_SIZE - 1: 0] ver_smart_bus_in;
output [CELL_HEIGHT * WORD_SIZE - 1: 0] ver_smart_bus_out;

input [CELL_HEIGHT * WORD_SIZE - 1: 0] left_in_bus;
input [CELL_WIDTH * WORD_SIZE - 1: 0] top_in_bus;
output [CELL_HEIGHT * WORD_SIZE - 1: 0] right_out_bus;
output [CELL_WIDTH * WORD_SIZE - 1: 0] bottom_out_bus;


wire [WORD_SIZE - 1: 0] top_row_smart_bus_interconnect;
wire [WORD_SIZE - 1: 0] bottom_row_smart_bus_interconnect;
wire [WORD_SIZE - 1: 0] left_col_smart_bus_interconnect;
wire [WORD_SIZE - 1: 0] right_col_smart_bus_interconnect;
wire [(CELL_WIDTH - 2) * WORD_SIZE - 1: 0]  internal_ver_smart_bus_interconnect;
wire [(CELL_HEIGHT - 2) * WORD_SIZE - 1: 0] internal_hor_smart_bus_interconnect;

wire [CELL_WIDTH * WORD_SIZE - 1: 0] top_row_bottom_out;
wire [CELL_WIDTH * WORD_SIZE - 1: 0] bot_row_bottom_out;
wire [2 * (CELL_HEIGHT - 2) * WORD_SIZE - 1: 0] other_row_bottom_out;

wire [CELL_HEIGHT * WORD_SIZE - 1: 0] left_col_right_out;
wire [CELL_HEIGHT * WORD_SIZE - 1: 0] right_col_right_out;
wire [2 * (CELL_WIDTH - 2) * WORD_SIZE - 1: 0] other_col_right_out;

genvar r, c;

generate
    for (r = 0; r < CELL_HEIGHT; r = r + 1)
    begin 
        for (c = 0; c < CELL_WIDTH; c = c + 1)
        begin
            if ( r ==0 && c == 0)
            begin
                smart_mac #(
                    .WORD_SIZE(WORD_SIZE)
                ) top_left_corner_smart(
                    .clk(clk),
                    .rst(rst),
                    .fsm_op2_select_in(fsm_op2_select_in),
                    .fsm_out_select_in(fsm_out_select_in),
                    .stat_bit_in(stat_bit_in),
                    .select_left_in_smart(capture_smart_left_sel_in),
                    .select_top_in_smart(caputure_smart_top_sel_in),
                    .select_right_out_smart(1'b0),  // Pass to the next neighbour
                    .select_bottom_out_smart(1'b0), // Pass to the next neighbour
                    .left_in(left_in_bus[WORD_SIZE - 1: 0]),
                    .top_in(top_in_bus[WORD_SIZE - 1: 0]),
                    .bottom_out(top_row_bottom_out[WORD_SIZE - 1: 0]),
                    .right_out(left_col_right_out[WORD_SIZE - 1: 0]),
                    .vertical_smart_bus_in(ver_smart_bus_in[WORD_SIZE -1: 0]),
                    .horizontal_smart_bus_in(hor_smart_bus_in[WORD_SIZE -1: 0]),
                    .vertical_smart_bus_out(top_row_smart_bus_interconnect[WORD_SIZE - 1: 0]),
                    .horizontal_smart_bus_out(left_col_smart_bus_interconnect[WORD_SIZE -1:0])
                );
            end
            else if ( r ==0 && c == CELL_WIDTH - 1)
            begin
                smart_mac #(
                    .WORD_SIZE(WORD_SIZE)
                ) top_right_corner_smart(
                    .clk(clk),
                    .rst(rst),
                    .fsm_op2_select_in(fsm_op2_select_in),
                    .fsm_out_select_in(fsm_out_select_in),
                    .stat_bit_in(stat_bit_in),

                    .left_in(other_col_right_out[2 * (c - 1) * WORD_SIZE - 1 -: WORD_SIZE]),
                    .top_in(top_in_bus[WORD_SIZE - 1 -: WORD_SIZE]),
                    .bottom_out(top_row_bottom_out[(CELL_WIDH + 1) * WORD_SIZE - 1 -: WORD_SIZE]),
                    .right_out(),

                    .select_left_in_smart(1'b0),    // Get data from prev neighbour
                    .select_top_in_smart(caputure_smart_top_sel_in),
                    .select_right_out_smart(latch_smart_right_sel_in),
                    .select_bottom_out_smart(1'b0), // Pass to the next neighbour
                    
                    .vertical_smart_bus_in(),
                    .horizontal_smart_bus_in(),
                    .vertical_smart_bus_out(),
                    .horizontal_smart_bus_out()
                );
            end
            else if (r == CELL_HEIGHT - 1 && c == 0)
            begin
                smart_mac #(
                    .WORD_SIZE(WORD_SIZE)
                ) top_right_corner_smart(
                    .clk(clk),
                    .rst(rst),
                    .fsm_op2_select_in(fsm_op2_select_in),
                    .fsm_out_select_in(fsm_out_select_in),
                    .stat_bit_in(stat_bit_in),

                    .left_in(other_col_right_out[2 * (c - 1) * WORD_SIZE - 1 -: WORD_SIZE]),
                    .top_in(top_in_bus[WORD_SIZE - 1 -: WORD_SIZE]),
                    .bottom_out(top_row_bottom_out[(CELL_WIDH + 1) * WORD_SIZE - 1 -: WORD_SIZE]),
                    .right_out(),

                    .select_left_in_smart(1'b0),    // Get data from prev neighbour
                    .select_top_in_smart(caputure_smart_top_sel_in),
                    .select_right_out_smart(latch_smart_right_sel_in),
                    .select_bottom_out_smart(1'b0), // Pass to the next neighbour
                    
                    .vertical_smart_bus_in(),
                    .horizontal_smart_bus_in(),
                    .vertical_smart_bus_out(),
                    .horizontal_smart_bus_out()
                );
            end
        end
        else if ( r == CELL_HEIGHT - 1 && c == CELL_WIDTH - 1)
            begin
                smart_mac #(
                    .WORD_SIZE(WORD_SIZE)
                ) top_right_corner_smart(
                    .clk(clk),
                    .rst(rst),
                    .fsm_op2_select_in(fsm_op2_select_in),
                    .fsm_out_select_in(fsm_out_select_in),
                    .stat_bit_in(stat_bit_in),

                    .left_in(other_col_right_out[2 * (c - 1) * WORD_SIZE - 1 -: WORD_SIZE]),
                    .top_in(top_in_bus[WORD_SIZE - 1 -: WORD_SIZE]),
                    .bottom_out(top_row_bottom_out[(CELL_WIDH + 1) * WORD_SIZE - 1 -: WORD_SIZE]),
                    .right_out(),

                    .select_left_in_smart(1'b0),    // Get data from prev neighbour
                    .select_top_in_smart(caputure_smart_top_sel_in),
                    .select_right_out_smart(latch_smart_right_sel_in),
                    .select_bottom_out_smart(1'b0), // Pass to the next neighbour
                    
                    .vertical_smart_bus_in(),
                    .horizontal_smart_bus_in(),
                    .vertical_smart_bus_out(),
                    .horizontal_smart_bus_out()
                );
            end
    end
endgenerate


// Instantiate traditional systolic array here
localparam SYSTOLIC_ROWS = CELL_HEIGHT - 2;
localparam SYSTOLIC_COLS = CELL_WIDTH - 2;

traditional_systolic_array
#(
    .ROWS(SYSTOLIC_ROWS),
    .COLS(SYSTOLIC_COLS),
    .WORD_SIZE(WORD_SIZE)

) (
    .clk(clk),
    .rst(rst),

    .ctl_stat_bit_in(stat_bit_in), 
    .ctl_dummy_fsm_op2_select_in(fsm_op2_select_in),
    .ctl_dummy_fsm_out_select_in(fsm_out_select_in),

    .left_in_bus(),
    .top_in_bus(),
    .bottom_out_bus(),
    .right_out_bus()
);

endmodule
