module labL;

reg signed [31:0] a,b, expect;
reg signed ok;
reg ctrl;
wire[31:0] z;
wire cout;
yArith my_arith(z,cout,a,b,ctrl);

initial
begin
    repeat(500)
    begin
    
        a =$random;
        b =$random;
        ctrl = $random %2;

        if (ctrl === 0)
            expect = a + b+ctrl;
        else 
            expect = a+(~b)+ctrl;

        #1

        if (expect === z)
            ok =1;

        if(expect !== z)
            $display("FAIL: a: %b, b: %b, cin: %b, z: %b, expect : %b", a,b,ctrl,z, expect);
        /*else
            $display("PASS: a: %b, b: %b, cin: %b, z: %b, expect : %b", a,b,ctrl,z, expect);
        */
        
    end

    $finish;
end

endmodule