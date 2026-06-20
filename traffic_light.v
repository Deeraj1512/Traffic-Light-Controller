module traffic_light (
    input clk,          // Clock signal
    input rst,          // Reset signal
    output reg red,     // RED light
    output reg yellow,  // YELLOW light
    output reg green    // GREEN light
);

// State encoding
parameter RED_STATE    = 2'b00;
parameter GREEN_STATE  = 2'b01;
parameter YELLOW_STATE = 2'b10;

// State register
reg [1:0] current_state, next_state;

// Counter for timing (simulating seconds)
reg [3:0] counter;

// State transition (sequential logic)
always @(posedge clk or posedge rst) begin
    if (rst) begin
        current_state <= RED_STATE;
        counter <= 0;
    end else begin
        if (counter == 4'd9) begin   // Change state every 10 clock cycles
            current_state <= next_state;
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end
end

// Next state logic (combinational)
always @(*) begin
    case (current_state)
        RED_STATE:    next_state = GREEN_STATE;
        GREEN_STATE:  next_state = YELLOW_STATE;
        YELLOW_STATE: next_state = RED_STATE;
        default:      next_state = RED_STATE;
    endcase
end

// Output logic
always @(*) begin
    red    = 0;
    yellow = 0;
    green  = 0;
    case (current_state)
        RED_STATE:    red    = 1;
        GREEN_STATE:  green  = 1;
        YELLOW_STATE: yellow = 1;
    endcase
end

endmodule