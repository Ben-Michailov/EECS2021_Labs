module labL;

reg a,b,cin;
reg[1:0] expect;
wire z, cout;
integer i,j,k;
yAdder1 my_adder(z,cout,a,b,cin);

initial
begin
    for(i=0; i<2; i++)
    begin
        for (j=0; j<2; j++)
        begin
            for (k=0; k<2; k++)
            begin
                a=i;b=j;cin=k;

                expect = a + b +cin;
                
                #1 

                if(expect[0] !== z || expect[1] !==cout)
                    $display("FAIL: a: %b, b: %b, cin: %b, z: %b, cout: %b,", a,b,cin,z,cout);
            end
        end
    end

    $finish;
end

endmodule