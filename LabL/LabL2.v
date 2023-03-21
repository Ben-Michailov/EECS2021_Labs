module labL;

reg[1:0] a,b, expect;
reg c;
wire[1:0] z;
integer i,j,k,l,m;
yMux2 my_mux(z,a,b,c);

initial
begin
    for(i=0; i<2; i++)
    begin
        for (j=0; j<2; j++)
        begin
            for (k=0; k<2; k++)
            begin
                for (l=0; l<2; l++)
                begin
                    for(m=0; m<2; m++)
                    begin
                        a[0]=i;a[1]=j; 
                        b[0]=k;b[1]=l;
                        c=m;

                        if (c === 0)
                            expect =a;
                        else
                            expect =b;
                        
                        #1 

                        if(expect === z)
                            $display("PASS: a: %b, b: %b, c: %b, z: %b", a,b,c,z);
                        else
                            $display("FAIL: a: %b, b: %b, c: %b, z: %b", a,b,c,z);
                    end
                end
                
            end
        end
    end

    $finish;
end

endmodule