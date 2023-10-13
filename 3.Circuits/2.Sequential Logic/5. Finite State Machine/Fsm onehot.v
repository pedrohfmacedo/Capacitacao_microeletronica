module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);

    always @(*) begin    // This is a combinational always block
        case(state)
            next_state[0]: begin
                if(in) next_state <=  next_state[1];
                else next_state   <=  next_state[0];
            end
            next_state[1]: begin
                if(in) next_state  <=  next_state[2];
                else next_state    <=  next_state[0];
            end
            next_state[2]: begin
                if(in) next_state<=  next_state[3];
                else next_state<=  next_state[0];
            end
            next_state[3]: begin
                if(in) next_state<=  next_state[4];
                else next_state<=  next_state[0];
            end
            next_state[4]: begin
                if(in) next_state<=  next_state[5];
                else next_state<=  next_state[0];
            end
            next_state[5]: begin
                if(in) next_state<=  next_state[6];
                else next_state<=  next_state[8];
            end
            next_state[6]: begin
                if(in) next_state<=  next_state[7];
                else next_state<=  next_state[9];
            end
            next_state[7]: begin
                if(in) next_state<  next_state[7];
                else next_state<=  next_state[0];
            end
            next_state[8]: begin
                if(in) next_state<=  next_state[1];
                else next_state<=  next_state[0];
            end
            next_state[9]: begin
                if(in) next_state<=  next_state[1];
                else next_state<=  next_state[0];
            end
            default:  next_state[0];
        endcase
    end


    assign out1  = state == (S8||S9);
    assign out2 = state == (S7||S9);

endmodule
