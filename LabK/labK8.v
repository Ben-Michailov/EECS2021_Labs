module labK;
reg a, b, c, flag, expect;
wire z,not_c_output, not_c_input, a_and_not_c_output, b_and_c_output, 
a_and_not_c_input, b_and_c_input;
integer i, j, k;

not n1(not_c_output, c);
and a1(a_and_not_c_output,a, not_c_input);
and a2(b_and_c_output,b,c);
or o1(z, a_and_not_c_input, b_and_c_input);

assign not_c_input = not_c_output;
assign a_and_not_c_input = a_and_not_c_output;
assign b_and_c_input = b_and_c_output;

initial
begin

    for (i=0; i<2;i++)
    begin
        for (j=0; j<2; j++)
        begin
            for (k=0; k<2;k++)
            begin
                a = i; b =j; c= k;
                expect = (a & ~c) ^ (b & c);
                #1 
    
                if(expect === z)
                    $display("PASS: a: %b, b: %b, c: %b, z: %b", a,b,c,z);
                else
                    $display("FAIL: a: %b, b: %b, c: %b, z: %b", a,b,c,z);
            end
        end
    end

    

    
    $finish;
end

endmodule