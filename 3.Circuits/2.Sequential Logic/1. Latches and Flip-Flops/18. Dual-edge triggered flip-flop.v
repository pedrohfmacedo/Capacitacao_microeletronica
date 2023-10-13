module top_module (
    input clk,
    input d,
    output q
);
    wire fio,fio2;
    always @(posedge clk)begin
        fio<=d;
    end
    always @(negedge clk)begin
        fio2<=d;
    end
    always @(clk) begin
        if(clk) q<=fio;
        else q<=fio2;
    end
endmodule

