module labL;

reg[31:0] a,b, expect;
reg ok;
reg cin;
wire[31:0] z;
wire cout;
yAdder my_adder(z,cout,a,b,cin);

initial
begin
    repeat(500)
    begin
    
        a =$random;
        b =$random;
        cin =0;

        expect = a + b+cin;

        #1

        if (expect === z)
            ok =1;

        if(expect !== z)
            $display("FAIL: a: %b, b: %b, cin: %b, z: %b, expect : %b", a,b,cin,z, expect);
        /*else
            $display("PASS: a: %b, b: %b, cin: %b, z: %b, expect : %b", a,b,cin,z, expect);

        */
    end

    $finish;
end

endmodule