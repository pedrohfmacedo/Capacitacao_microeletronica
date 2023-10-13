module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT=0, RIGHT=1, FALL_R=2, FALL_L=4;
    
    reg[1:0] state, next_state;

    always @(*) begin
        case(state)
            LEFT:begin
            	if (bump_left) next_state = RIGHT;
                else if(ground) next_state = FALL_L;
            	else next_state = LEFT;
            end
            RIGHT:begin
            	if(bump_right) next_state = LEFT;
                else if(ground) next_state = FALL_R;
            	else next_state = RIGHT;
            end
            FALL_L:begin
                if(ground) next_state = FALL_L;
            	else next_state = LEFT;
            end
            FALL_R:begin
                if(ground) next_state = FALL_R;
            	else next_state = RIGHT;
            end
                
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state<=LEFT;
        else state<=next_state;
    end
    
    // Output logic
    assign walk_left = (state == LEFT)&(ground);
    assign walk_right = (state == RIGHT)&(ground);
    assign aaah = (state == ground);

endmodule
