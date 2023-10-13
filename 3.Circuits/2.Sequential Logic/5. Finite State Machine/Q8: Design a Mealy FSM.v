module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter a = 0, b = 1, c=2,d = 3;
    reg[1:0] next_state, state;
    always@(state, x)begin
        case(state)
            a:begin next_state = x?a:b; end
            b:begin next_state = x?c:b; end
            c:begin next_state = x?a:d; end
            d:begin next_state = x?c:b; end
        endcase
    end
    always@(posedge clk, negedge aresetn)begin
        if(~aresetn) state<=a;
        else state<=next_state;
    end
    
    assign z = (state==c);

endmodule
