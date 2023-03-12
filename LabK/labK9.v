module labK;
reg a,b,c_in;
reg[1:0] expect;
integer i,j,k;

wire z, c_out;
wire a_xor_b_input, a_xor_b_output;
wire a_and_b_input, a_and_b_output;
wire c_in_and_a_xor_b_input, c_in_and_a_xor_b_output;

xor x1(a_xor_b_output,a,b);
and a1(a_and_b_output,a,b);
xor x2(z, c_in,a_xor_b_input);
and a2(c_in_and_a_xor_b_output, c_in,a_xor_b_input);
or o1(c_out, a_and_b_input, c_in_and_a_xor_b_input);

assign a_xor_b_input = a_xor_b_output;
assign a_and_b_input = a_and_b_output;
assign c_in_and_a_xor_b_input = c_in_and_a_xor_b_output;

initial
begin
    a= 0; b=0; c_in=1;
    for (i =0; i<2; i++)
    begin
        for(j=0; j<2; j++)
        begin
            for(k=0; k<2; k++)
            begin
                a = i; b = j; c_in = k;
                expect = a + b + c_in;
                #1;
                if (expect[0] === z && expect[1] === c_out)
                    $display("PASS: a=%b, b=%b, c_in=%b, z=%b, c_out=%b",a,b,c_in,z,c_out);

                else
                    $display("FAIL: a=%b, b=%b, c_in=%b, z=%b, c_out=%b",a,b,c_in,z,c_out);
                
                //$display("expect[0]:%b, expect[1]:%b",expect[0],expect[1]);
            end
        end
    end
    
    $finish;

end

endmodule