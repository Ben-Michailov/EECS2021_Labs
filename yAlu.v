module yAlu(z, zero, a, b, op);
input [31:0] a, b;
input [2:0] op;
output [31:0] z;
output zero;

wire [31:0] slt;
assign slt[31:1] = 0; // upper bits are always 0
//assign ex = 0; // not supported for now
wire z1, zero;
wire[15:0] z16;
wire[7:0] z8;
wire [3:0] z4;
wire [1:0] z2;
or or16[15:0] (z16, z[15:0], z[31:16]);
or or8[7:0](z8, z16[7:0], z16[15:8]);
or or4[3:0](z4, z8[3:0],z8[7:4]);
or or2[1:0](z2, z4[1:0],z4[3:2]);
or or1(z1, z2[0], z2[1]);
not my_not(zero,z1);

// instantiate a circuit to set slt[0]
// Hint: about 2 lines of code

xor my_xor(slt[0], a[31],b[31]);

assign ex = 0; // not supported
// instantiate the components and connect them
// Hint: about 4 lines of code
wire[31:0] and_wire, or_wire, arith_wire;
wire cout;
and my_and[31:0](and_wire,a,b);
or my_or[31:0](or_wire,a,b);
yArith my_arith(arith_wire, cout,a,b,op[2]);
yMux4to1 #(32) my_4to1Mux(z,and_wire,or_wire,arith_wire,slt,op[1:0]);

endmodule