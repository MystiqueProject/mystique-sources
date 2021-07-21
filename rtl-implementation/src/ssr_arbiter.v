
module ssr_arbiter
#(
    parameter SSR_BITS_IN = 2
)(
    ssr_bits_in,
    this_ssr_out,
    ssr_bits_out
);

input  [SSR_BITS_IN - 1: 0] ssr_bits_in;
output [SSR_BITS_IN - 2: 0] ssr_bits_out;
output this_ssr_out;

// This is a dummy implementation
// TODO: Ask tushar how this should be implemented

assign ssr_bits_out = ssr_bits_in[SSR_BITS_IN - 1: 1];
assign this_ssr_out = ssr_bits_in[0];

endmodule
