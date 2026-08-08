`timescale 1ns/1ps

module alu_8bit_tb;

    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] ALU_Sel;

    wire [7:0] Result;
    wire Carry;
    wire Zero;

    // Instantiate ALU
    alu_8bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .Result(Result),
        .Carry(Carry),
        .Zero(Zero)
    );

    initial begin

        // Addition
        A = 8'd25;
        B = 8'd15;
        ALU_Sel = 3'b000;
        #10;

        // Subtraction
        A = 8'd25;
        B = 8'd15;
        ALU_Sel = 3'b001;
        #10;

        // AND
        A = 8'hF0;
        B = 8'h0F;
        ALU_Sel = 3'b010;
        #10;

        // OR
        A = 8'hF0;
        B = 8'h0F;
        ALU_Sel = 3'b011;
        #10;

        // XOR
        A = 8'hF0;
        B = 8'h0F;
        ALU_Sel = 3'b100;
        #10;

        // NOT
        A = 8'h55;
        B = 8'h00;
        ALU_Sel = 3'b101;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | A=%h | B=%h | Sel=%b | Result=%h | Carry=%b | Zero=%b",
                 $time, A, B, ALU_Sel, Result, Carry, Zero);
    end

endmodule