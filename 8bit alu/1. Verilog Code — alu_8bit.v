module alu_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] ALU_Sel,
    output reg [7:0] Result,
    output reg Carry,
    output Zero
);

    always @(*) begin
        Carry = 1'b0;

        case (ALU_Sel)

            3'b000: begin
                {Carry, Result} = A + B;       // Addition
            end

            3'b001: begin
                {Carry, Result} = A - B;       // Subtraction
            end

            3'b010: begin
                Result = A & B;                // AND
            end

            3'b011: begin
                Result = A | B;                // OR
            end

            3'b100: begin
                Result = A ^ B;                // XOR
            end

            3'b101: begin
                Result = ~A;                   // NOT
            end

            default: begin
                Result = 8'b00000000;
                Carry = 1'b0;
            end

        endcase
    end

    assign Zero = (Result == 8'b00000000);

endmodule