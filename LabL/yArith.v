module yArith(z, cout, a, b, ctrl);
    // add if ctrl=0, subtract if ctrl=1
    output [31:0] z;
    output cout;
    input [31:0] a, b;
    input ctrl;
    wire[31:0] notB, tmp;
    wire cin;
    // instantiate the components and connect them
    // Hint: about 4 lines of code
    yAdder my_adder(z,cout,a,tmp,cin);
    assign cin = ctrl;
    assign notB = ~b;
    yMux #(32) my_mux(tmp, b, notB, ctrl);
endmodule