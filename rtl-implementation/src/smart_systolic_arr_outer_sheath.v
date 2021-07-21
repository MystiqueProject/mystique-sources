//`include "smart_mac.v"
//`include "smart_systolic_arr_inner_sheath.v"

module smart_systolic_outer_sheath
#(
    parameter WORD_SIZE = 16, 
    parameter CELL_HEIGHT = 4,         
    parameter CELL_WIDTH = 4
)(
    clk,
    rst,

    ctl_stat_bit_in, 
    ctl_dummy_fsm_op2_select_in,
    ctl_dummy_fsm_out_select_in,

    capture_smart_top_select_in,
    capture_smart_left_select_in,
    latch_smart_bottom_select_in,
    latch_smart_right_select_in,

    top_in_bus,
    left_in_bus,
    bottom_out_bus,
    right_out_bus, 

    hor_smart_bus_in,
    ver_smart_bus_in,
    hor_smart_bus_out,
    ver_smart_bus_out
);

input clk;
input rst;

input ctl_stat_bit_in; 
input ctl_dummy_fsm_op2_select_in;
input ctl_dummy_fsm_out_select_in;

input capture_smart_top_select_in;
input capture_smart_left_select_in;
input latch_smart_bottom_select_in;
input latch_smart_right_select_in;

input [CELL_WIDTH  * WORD_SIZE - 1 : 0] top_in_bus;
input [CELL_HEIGHT * WORD_SIZE - 1 : 0] left_in_bus;
output [CELL_WIDTH * WORD_SIZE - 1 : 0] bottom_out_bus;
output [CELL_HEIGHT * WORD_SIZE - 1 : 0] right_out_bus;

input [ CELL_HEIGHT * WORD_SIZE - 1 : 0] hor_smart_bus_in;
input [ CELL_WIDTH * WORD_SIZE - 1 : 0] ver_smart_bus_in;
output [CELL_HEIGHT * WORD_SIZE - 1 : 0] hor_smart_bus_out;
output [CELL_WIDTH * WORD_SIZE - 1 : 0] ver_smart_bus_out;

// Wires going into and out inner sheath
wire [CELL_HEIGHT * WORD_SIZE -1 : 0 ] inner_sheath_left_in;
wire [CELL_WIDTH * WORD_SIZE -1 : 0 ] inner_sheath_top_in;

wire [CELL_HEIGHT * WORD_SIZE -1 : 0 ] inner_sheath_right_out;
wire [CELL_WIDTH * WORD_SIZE -1 : 0 ] inner_sheath_bottom_out;

// SMART buses into and out of inner sheath
wire [CELL_HEIGHT * WORD_SIZE -1 : 0 ] inner_sheath_hor_smart_bus_in;
wire [CELL_WIDTH * WORD_SIZE -1 : 0 ] inner_sheath_ver_smart_bus_in;

wire [CELL_HEIGHT * WORD_SIZE -1 : 0 ] inner_sheath_hor_smart_bus_out;
wire [CELL_WIDTH * WORD_SIZE -1 : 0 ] inner_sheath_ver_smart_bus_out;

wire tie_low = 1'b0;

// Top left
smart_mac #( 
    .WORD_SIZE(WORD_SIZE)
) top_row_mac_left(
    .clk(clk),
    .rst(rst), 

    .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
    .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
    .stat_bit_in(ctl_stat_bit_in),

    .select_left_in_smart(capture_smart_left_select_in),                        
    .select_top_in_smart(capture_smart_top_select_in),

    .select_right_out_smart(tie_low),
    .select_bottom_out_smart(tie_low),

    .left_in(left_in_bus[WORD_SIZE - 1 : 0]),
    .top_in(top_in_bus[WORD_SIZE - 1 : 0]),
    .right_out(inner_sheath_left_in[WORD_SIZE - 1: 0]),
    .bottom_out(inner_sheath_top_in[WORD_SIZE - 1: 0]),

    .vertical_smart_bus_in(ver_smart_bus_in[WORD_SIZE - 1: 0]),
    .horizontal_smart_bus_in(hor_smart_bus_in[WORD_SIZE - 1: 0]),
    .vertical_smart_bus_out(inner_sheath_ver_smart_bus_in[WORD_SIZE - 1: 0]),
    .horizontal_smart_bus_out(inner_sheath_hor_smart_bus_in[WORD_SIZE - 1: 0])
);


// Top right
smart_mac #( 
    .WORD_SIZE(WORD_SIZE)
) top_row_mac_right(
    .clk(clk),
    .rst(rst), 

    .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
    .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
    .stat_bit_in(ctl_stat_bit_in),

    .select_left_in_smart(tie_low),                        
    .select_top_in_smart(capture_smart_top_select_in),

    .select_right_out_smart(latch_smart_right_select_in),
    .select_bottom_out_smart(tie_low),

    .left_in(inner_sheath_right_out[WORD_SIZE - 1 : 0]),
    .top_in(top_in_bus[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE]),
    .right_out(right_out_bus[WORD_SIZE - 1: 0]),
    .bottom_out(inner_sheath_top_in[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE]),

    .vertical_smart_bus_in(ver_smart_bus_in[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE]),
    .horizontal_smart_bus_in(inner_sheath_hor_smart_bus_out[WORD_SIZE - 1: 0]),
    .vertical_smart_bus_out(inner_sheath_ver_smart_bus_in[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE]),
    .horizontal_smart_bus_out(hor_smart_bus_out[WORD_SIZE - 1 : 0])
);

// Bottom left
smart_mac #( 
    .WORD_SIZE(WORD_SIZE)
) bot_row_mac_left(
    .clk(clk),
    .rst(rst), 

    .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
    .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
    .stat_bit_in(ctl_stat_bit_in),

    .select_left_in_smart(capture_smart_left_select_in),                        
    .select_top_in_smart(tie_low),

    .select_right_out_smart(tie_low),
    .select_bottom_out_smart(latch_smart_bottom_select_in),

    .left_in(left_in_bus[CELL_HEIGHT * WORD_SIZE - 1 -: WORD_SIZE]),
    .top_in(inner_sheath_bottom_out[WORD_SIZE - 1: 0]),
    .right_out(inner_sheath_left_in[CELL_HEIGHT * WORD_SIZE - 1 -: WORD_SIZE]),
    .bottom_out(bottom_out_bus[WORD_SIZE - 1: 0]),

    .vertical_smart_bus_in(inner_sheath_ver_smart_bus_out[WORD_SIZE - 1: 0]),
    .horizontal_smart_bus_in(hor_smart_bus_in[CELL_HEIGHT * WORD_SIZE - 1 -: WORD_SIZE]),
    .vertical_smart_bus_out(ver_smart_bus_out[WORD_SIZE - 1 : 0]),
    .horizontal_smart_bus_out(inner_sheath_hor_smart_bus_in[CELL_HEIGHT * WORD_SIZE - 1 -: WORD_SIZE])
);

// Bottom right
smart_mac #( 
    .WORD_SIZE(WORD_SIZE)
) bot_row_mac_right(
    .clk(clk),
    .rst(rst), 

    .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
    .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
    .stat_bit_in(ctl_stat_bit_in),

    .select_left_in_smart(tie_low),                        
    .select_top_in_smart(tie_low),

    .select_right_out_smart(latch_smart_right_select_in),
    .select_bottom_out_smart(latch_smart_bottom_select_in),

    .left_in(inner_sheath_right_out[CELL_HEIGHT * WORD_SIZE - 1 -: WORD_SIZE]),
    .top_in(inner_sheath_bottom_out[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE]),
    .right_out(right_out_bus[CELL_HEIGHT * WORD_SIZE - 1 -: WORD_SIZE]),
    .bottom_out(bottom_out_bus[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE]),

    .vertical_smart_bus_in(inner_sheath_ver_smart_bus_out[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE]),
    .horizontal_smart_bus_in(inner_sheath_hor_smart_bus_out[CELL_HEIGHT * WORD_SIZE - 1 -: WORD_SIZE]),
    .vertical_smart_bus_out(ver_smart_bus_out[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE]),
    .horizontal_smart_bus_out(hor_smart_bus_out[CELL_HEIGHT * WORD_SIZE - 1 -: WORD_SIZE])
);

assign inner_sheath_hor_smart_bus_in[(CELL_WIDTH - 1) * WORD_SIZE - 1: WORD_SIZE] 
                    = hor_smart_bus_in [(CELL_WIDTH - 1) * WORD_SIZE - 1: WORD_SIZE];
assign inner_sheath_ver_smart_bus_in[(CELL_WIDTH - 1) * WORD_SIZE - 1: WORD_SIZE] 
                    = ver_smart_bus_in [(CELL_WIDTH - 1) * WORD_SIZE - 1: WORD_SIZE];
assign hor_smart_bus_out[(CELL_WIDTH - 1) * WORD_SIZE - 1: WORD_SIZE] 
                    = inner_sheath_hor_smart_bus_out [(CELL_WIDTH - 1) * WORD_SIZE - 1: WORD_SIZE];
assign ver_smart_bus_out[(CELL_WIDTH - 1) * WORD_SIZE - 1: WORD_SIZE] 
                    = inner_sheath_ver_smart_bus_out [(CELL_WIDTH - 1) * WORD_SIZE - 1: WORD_SIZE];


assign inner_sheath_top_in[(CELL_WIDTH - 1) * WORD_SIZE -1: WORD_SIZE] 
                    = top_in_bus[(CELL_WIDTH - 1) * WORD_SIZE - 1: WORD_SIZE];
assign inner_sheath_left_in[(CELL_HEIGHT - 1) * WORD_SIZE -1: WORD_SIZE] 
                    = left_in_bus[(CELL_HEIGHT - 1) * WORD_SIZE - 1: WORD_SIZE];
assign bottom_out_bus[(CELL_WIDTH - 1) * WORD_SIZE -1: WORD_SIZE] 
                    = inner_sheath_bottom_out[(CELL_WIDTH - 1) * WORD_SIZE -1: WORD_SIZE];
assign right_out_bus[(CELL_HEIGHT - 1) * WORD_SIZE -1: WORD_SIZE] 
                    =  inner_sheath_right_out[(CELL_HEIGHT - 1) * WORD_SIZE -1: WORD_SIZE];


// Inner sheath
smart_systolic_arr_inner_sheath #(
    .WORD_SIZE(WORD_SIZE),
    .CELL_HEIGHT(CELL_HEIGHT),
    .CELL_WIDTH(CELL_WIDTH)

) cell_inner_sheath (
    .clk(clk),
    .rst(rst),

    .ctl_stat_bit_in(ctl_stat_bit_in), 
    .ctl_dummy_fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
    .ctl_dummy_fsm_out_select_in(ctl_dummy_fsm_out_select_in),

    .capture_smart_top_select_in(capture_smart_top_select_in),
    .capture_smart_left_select_in(capture_smart_left_select_in),
    .latch_smart_bottom_select_in(latch_smart_bottom_select_in),
    .latch_smart_right_select_in(latch_smart_right_select_in),

    .top_in_bus(inner_sheath_top_in),
    .left_in_bus(inner_sheath_left_in),
    .bottom_out_bus(inner_sheath_bottom_out),
    .right_out_bus(inner_sheath_right_out),

    .hor_smart_bus_in(inner_sheath_hor_smart_bus_in),
    .ver_smart_bus_in(inner_sheath_ver_smart_bus_in),
    .hor_smart_bus_out(inner_sheath_hor_smart_bus_out),
    .ver_smart_bus_out(inner_sheath_ver_smart_bus_out)

);

endmodule
