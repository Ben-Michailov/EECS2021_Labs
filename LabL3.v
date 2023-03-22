module labL;

reg[31:0] a,b, expect;
reg c;
wire[31:0] z;
yMux # (32) my_mux(z,a,b,c);

initial
begin

repeat(500)
begin
    a =$random;
    b =$random;
    c =$random %2;

    if (c === 0)
        expect = a;
    else
        expect = b;

    #1 

    if(expect !== z)
        $display("FAIL: a: %b, b: %b, c: %b, z: %b", a,b,c,z);

    //$display("PASS: a: %b, b: %b, c: %b, z: %b", a,b,c,z);

end

    
    $finish;
end

endmodule