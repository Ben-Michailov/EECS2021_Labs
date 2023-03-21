module labL;

reg[31:0] a0,a1, a2, a3,expect;
reg[1:0] c;
wire[31:0] z;
yMux4to1 # (32) my_mux(z,a0,a1,a2,a3,c);

initial
begin

    repeat(500)
    begin
        a0 =$random;
        a1 =$random;
        a2 =$random;
        a3 =$random;
        c[0] =$random %2;
        c[1] = $random %2;

        if (c[0] === 0)
            begin
                if(c[1]===0)
                begin
                    expect =a0;
                end
                if(c[1]===1)
                begin
                    expect =a2;
                end
            end
        else
            begin
                if(c[1]===0)
                begin
                    expect =a1;
                end
                if(c[1]===1)
                begin
                    expect =a3;
                end
            end

        #1

        if(expect !== z)
            $display("FAIL: a0: %b, a2: %b, a2: %b, a3: %b, c: %b, z: %b", a0,a1,a2,a3,z);


    end

    
    $finish;
end

endmodule