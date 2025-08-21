`timescale 1ns / 1ps


module vedic_mult_32bit_tb();

reg [31:0]a,b;
wire [63:0]out;

signed_vedic_mult_32bit svm(.a(a),.b(b),.out(out));

initial begin

    a = 32'b00000000_00000000_00000000_00000010; // or a = 32'h00000002; or a = (2)decimal
    b = 32'b00000000_00000000_00000000_00000011; // or b = 32'h00000003; or b = (3)decimal
    
    #50
    
    a = 32'b11111111_11111111_11111111_11111110; // or a = 32'hFFFFFFFE; or a = (-2)decimal
    b = 32'b00000000_00000000_00000000_00000011; // or b = 32'h00000003; or b = (3)decimal
    
    #50
    
    a = 32'b00000000_00000000_00000000_00000010; // or a = 32'h00000002; or a = (2)decimal
    b = 32'b11111111_11111111_11111111_11111101; // or b = 32'hFFFFFFFD; or b = (-3)decimal
    
    #50
    
    a = 32'b11111111_11111111_11111111_11111110; // or a = 32'hFFFFFFFE; or a = (-2)decimal 
    b = 32'b11111111_11111111_11111111_11111101; // or b = 32'hFFFFFFFD; or b = (-3)decimal
    
    #50
    
    $finish;
    
    
end

endmodule
