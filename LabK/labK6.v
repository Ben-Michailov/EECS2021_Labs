module labK;
reg a, b, c;
wire z,not_c_output, not_c_input, a_and_not_c_output, b_and_c_output, a_and_not_c_input, b_and_c_input;

not n1(not_c_output, c);
and a1(a_and_not_c_output,a, not_c_input);
and a2(b_and_c_output,b,c);
or o1(z, a_and_not_c_input, b_and_c_input);

assign not_c_input = not_c_output;
assign a_and_not_c_input = a_and_not_c_output;
assign b_and_c_input = b_and_c_output;

initial
begin

    a=1; b=0; c=0;

    #1 $display("a: %b, b: %b, c: %b, z: %b", a,b,c,z);
    $finish;
end

endmodule