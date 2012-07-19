`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nikhil Handyal
// 
// Create Date:    	23:36:32 04/25/2012 
// Design Name: 
// Module Name:    	COS_LUT 
// Project Name: 		spectrum_analyzer
// Target Devices: 	Spartan 6
// Tool versions: 	
// Description: 		Cos Lookup Table
//							512 points from 0-pi
//							8.10 fixed point representation
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module COS_LUT(Clk, addr, Dout, reset);

   parameter WIDTH = 18;
   parameter DEPTH = 10;

   input           					Clk, reset;
   
	(* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
   reg    			[WIDTH-1:0]  		mem[(2**DEPTH)-1:0];	
	output reg 		[WIDTH-1:0]   		Dout;
   
	input  			[DEPTH-1:0]    	addr;
	reg    			[DEPTH-1:0]  		addr_reg;

   always @ (posedge Clk) begin
      if (reset) begin
			mem[9'b000000000] = 18'b000000010000000000;
			mem[9'b000000001] = 18'b000000001111111111;
			mem[9'b000000010] = 18'b000000001111111111;
			mem[9'b000000011] = 18'b000000001111111111;
			mem[9'b000000100] = 18'b000000001111111111;
			mem[9'b000000101] = 18'b000000001111111111;
			mem[9'b000000110] = 18'b000000001111111111;
			mem[9'b000000111] = 18'b000000001111111111;
			mem[9'b000001000] = 18'b000000001111111110;
			mem[9'b000001001] = 18'b000000001111111110;
			mem[9'b000001010] = 18'b000000001111111110;
			mem[9'b000001011] = 18'b000000001111111101;
			mem[9'b000001100] = 18'b000000001111111101;
			mem[9'b000001101] = 18'b000000001111111100;
			mem[9'b000001110] = 18'b000000001111111100;
			mem[9'b000001111] = 18'b000000001111111011;
			mem[9'b000010000] = 18'b000000001111111011;
			mem[9'b000010001] = 18'b000000001111111010;
			mem[9'b000010010] = 18'b000000001111111001;
			mem[9'b000010011] = 18'b000000001111111001;
			mem[9'b000010100] = 18'b000000001111111000;
			mem[9'b000010101] = 18'b000000001111110111;
			mem[9'b000010110] = 18'b000000001111110110;
			mem[9'b000010111] = 18'b000000001111110101;
			mem[9'b000011000] = 18'b000000001111110100;
			mem[9'b000011001] = 18'b000000001111110011;
			mem[9'b000011010] = 18'b000000001111110010;
			mem[9'b000011011] = 18'b000000001111110001;
			mem[9'b000011100] = 18'b000000001111110000;
			mem[9'b000011101] = 18'b000000001111101111;
			mem[9'b000011110] = 18'b000000001111101110;
			mem[9'b000011111] = 18'b000000001111101101;
			mem[9'b000100000] = 18'b000000001111101100;
			mem[9'b000100001] = 18'b000000001111101011;
			mem[9'b000100010] = 18'b000000001111101001;
			mem[9'b000100011] = 18'b000000001111101000;
			mem[9'b000100100] = 18'b000000001111100111;
			mem[9'b000100101] = 18'b000000001111100101;
			mem[9'b000100110] = 18'b000000001111100100;
			mem[9'b000100111] = 18'b000000001111100010;
			mem[9'b000101000] = 18'b000000001111100001;
			mem[9'b000101001] = 18'b000000001111011111;
			mem[9'b000101010] = 18'b000000001111011110;
			mem[9'b000101011] = 18'b000000001111011100;
			mem[9'b000101100] = 18'b000000001111011010;
			mem[9'b000101101] = 18'b000000001111011001;
			mem[9'b000101110] = 18'b000000001111010111;
			mem[9'b000101111] = 18'b000000001111010101;
			mem[9'b000110000] = 18'b000000001111010011;
			mem[9'b000110001] = 18'b000000001111010010;
			mem[9'b000110010] = 18'b000000001111010000;
			mem[9'b000110011] = 18'b000000001111001110;
			mem[9'b000110100] = 18'b000000001111001100;
			mem[9'b000110101] = 18'b000000001111001010;
			mem[9'b000110110] = 18'b000000001111001000;
			mem[9'b000110111] = 18'b000000001111000110;
			mem[9'b000111000] = 18'b000000001111000100;
			mem[9'b000111001] = 18'b000000001111000010;
			mem[9'b000111010] = 18'b000000001110111111;
			mem[9'b000111011] = 18'b000000001110111101;
			mem[9'b000111100] = 18'b000000001110111011;
			mem[9'b000111101] = 18'b000000001110111001;
			mem[9'b000111110] = 18'b000000001110110110;
			mem[9'b000111111] = 18'b000000001110110100;
			mem[9'b001000000] = 18'b000000001110110010;
			mem[9'b001000001] = 18'b000000001110101111;
			mem[9'b001000010] = 18'b000000001110101101;
			mem[9'b001000011] = 18'b000000001110101010;
			mem[9'b001000100] = 18'b000000001110101000;
			mem[9'b001000101] = 18'b000000001110100101;
			mem[9'b001000110] = 18'b000000001110100010;
			mem[9'b001000111] = 18'b000000001110100000;
			mem[9'b001001000] = 18'b000000001110011101;
			mem[9'b001001001] = 18'b000000001110011010;
			mem[9'b001001010] = 18'b000000001110011000;
			mem[9'b001001011] = 18'b000000001110010101;
			mem[9'b001001100] = 18'b000000001110010010;
			mem[9'b001001101] = 18'b000000001110001111;
			mem[9'b001001110] = 18'b000000001110001100;
			mem[9'b001001111] = 18'b000000001110001010;
			mem[9'b001010000] = 18'b000000001110000111;
			mem[9'b001010001] = 18'b000000001110000100;
			mem[9'b001010010] = 18'b000000001110000001;
			mem[9'b001010011] = 18'b000000001101111110;
			mem[9'b001010100] = 18'b000000001101111010;
			mem[9'b001010101] = 18'b000000001101110111;
			mem[9'b001010110] = 18'b000000001101110100;
			mem[9'b001010111] = 18'b000000001101110001;
			mem[9'b001011000] = 18'b000000001101101110;
			mem[9'b001011001] = 18'b000000001101101011;
			mem[9'b001011010] = 18'b000000001101100111;
			mem[9'b001011011] = 18'b000000001101100100;
			mem[9'b001011100] = 18'b000000001101100001;
			mem[9'b001011101] = 18'b000000001101011101;
			mem[9'b001011110] = 18'b000000001101011010;
			mem[9'b001011111] = 18'b000000001101010110;
			mem[9'b001100000] = 18'b000000001101010011;
			mem[9'b001100001] = 18'b000000001101001111;
			mem[9'b001100010] = 18'b000000001101001100;
			mem[9'b001100011] = 18'b000000001101001000;
			mem[9'b001100100] = 18'b000000001101000101;
			mem[9'b001100101] = 18'b000000001101000001;
			mem[9'b001100110] = 18'b000000001100111101;
			mem[9'b001100111] = 18'b000000001100111010;
			mem[9'b001101000] = 18'b000000001100110110;
			mem[9'b001101001] = 18'b000000001100110010;
			mem[9'b001101010] = 18'b000000001100101110;
			mem[9'b001101011] = 18'b000000001100101011;
			mem[9'b001101100] = 18'b000000001100100111;
			mem[9'b001101101] = 18'b000000001100100011;
			mem[9'b001101110] = 18'b000000001100011111;
			mem[9'b001101111] = 18'b000000001100011011;
			mem[9'b001110000] = 18'b000000001100010111;
			mem[9'b001110001] = 18'b000000001100010011;
			mem[9'b001110010] = 18'b000000001100001111;
			mem[9'b001110011] = 18'b000000001100001011;
			mem[9'b001110100] = 18'b000000001100000111;
			mem[9'b001110101] = 18'b000000001100000011;
			mem[9'b001110110] = 18'b000000001011111111;
			mem[9'b001110111] = 18'b000000001011111010;
			mem[9'b001111000] = 18'b000000001011110110;
			mem[9'b001111001] = 18'b000000001011110010;
			mem[9'b001111010] = 18'b000000001011101110;
			mem[9'b001111011] = 18'b000000001011101001;
			mem[9'b001111100] = 18'b000000001011100101;
			mem[9'b001111101] = 18'b000000001011100001;
			mem[9'b001111110] = 18'b000000001011011100;
			mem[9'b001111111] = 18'b000000001011011000;
			mem[9'b010000000] = 18'b000000001011010100;
			mem[9'b010000001] = 18'b000000001011001111;
			mem[9'b010000010] = 18'b000000001011001011;
			mem[9'b010000011] = 18'b000000001011000110;
			mem[9'b010000100] = 18'b000000001011000010;
			mem[9'b010000101] = 18'b000000001010111101;
			mem[9'b010000110] = 18'b000000001010111000;
			mem[9'b010000111] = 18'b000000001010110100;
			mem[9'b010001000] = 18'b000000001010101111;
			mem[9'b010001001] = 18'b000000001010101011;
			mem[9'b010001010] = 18'b000000001010100110;
			mem[9'b010001011] = 18'b000000001010100001;
			mem[9'b010001100] = 18'b000000001010011100;
			mem[9'b010001101] = 18'b000000001010011000;
			mem[9'b010001110] = 18'b000000001010010011;
			mem[9'b010001111] = 18'b000000001010001110;
			mem[9'b010010000] = 18'b000000001010001001;
			mem[9'b010010001] = 18'b000000001010000100;
			mem[9'b010010010] = 18'b000000001001111111;
			mem[9'b010010011] = 18'b000000001001111010;
			mem[9'b010010100] = 18'b000000001001110101;
			mem[9'b010010101] = 18'b000000001001110001;
			mem[9'b010010110] = 18'b000000001001101100;
			mem[9'b010010111] = 18'b000000001001100111;
			mem[9'b010011000] = 18'b000000001001100001;
			mem[9'b010011001] = 18'b000000001001011100;
			mem[9'b010011010] = 18'b000000001001010111;
			mem[9'b010011011] = 18'b000000001001010010;
			mem[9'b010011100] = 18'b000000001001001101;
			mem[9'b010011101] = 18'b000000001001001000;
			mem[9'b010011110] = 18'b000000001001000011;
			mem[9'b010011111] = 18'b000000001000111110;
			mem[9'b010100000] = 18'b000000001000111000;
			mem[9'b010100001] = 18'b000000001000110011;
			mem[9'b010100010] = 18'b000000001000101110;
			mem[9'b010100011] = 18'b000000001000101001;
			mem[9'b010100100] = 18'b000000001000100011;
			mem[9'b010100101] = 18'b000000001000011110;
			mem[9'b010100110] = 18'b000000001000011001;
			mem[9'b010100111] = 18'b000000001000010011;
			mem[9'b010101000] = 18'b000000001000001110;
			mem[9'b010101001] = 18'b000000001000001001;
			mem[9'b010101010] = 18'b000000001000000011;
			mem[9'b010101011] = 18'b000000000111111110;
			mem[9'b010101100] = 18'b000000000111111000;
			mem[9'b010101101] = 18'b000000000111110011;
			mem[9'b010101110] = 18'b000000000111101101;
			mem[9'b010101111] = 18'b000000000111101000;
			mem[9'b010110000] = 18'b000000000111100010;
			mem[9'b010110001] = 18'b000000000111011101;
			mem[9'b010110010] = 18'b000000000111010111;
			mem[9'b010110011] = 18'b000000000111010010;
			mem[9'b010110100] = 18'b000000000111001100;
			mem[9'b010110101] = 18'b000000000111000110;
			mem[9'b010110110] = 18'b000000000111000001;
			mem[9'b010110111] = 18'b000000000110111011;
			mem[9'b010111000] = 18'b000000000110110101;
			mem[9'b010111001] = 18'b000000000110110000;
			mem[9'b010111010] = 18'b000000000110101010;
			mem[9'b010111011] = 18'b000000000110100100;
			mem[9'b010111100] = 18'b000000000110011110;
			mem[9'b010111101] = 18'b000000000110011001;
			mem[9'b010111110] = 18'b000000000110010011;
			mem[9'b010111111] = 18'b000000000110001101;
			mem[9'b011000000] = 18'b000000000110000111;
			mem[9'b011000001] = 18'b000000000110000010;
			mem[9'b011000010] = 18'b000000000101111100;
			mem[9'b011000011] = 18'b000000000101110110;
			mem[9'b011000100] = 18'b000000000101110000;
			mem[9'b011000101] = 18'b000000000101101010;
			mem[9'b011000110] = 18'b000000000101100100;
			mem[9'b011000111] = 18'b000000000101011110;
			mem[9'b011001000] = 18'b000000000101011000;
			mem[9'b011001001] = 18'b000000000101010011;
			mem[9'b011001010] = 18'b000000000101001101;
			mem[9'b011001011] = 18'b000000000101000111;
			mem[9'b011001100] = 18'b000000000101000001;
			mem[9'b011001101] = 18'b000000000100111011;
			mem[9'b011001110] = 18'b000000000100110101;
			mem[9'b011001111] = 18'b000000000100101111;
			mem[9'b011010000] = 18'b000000000100101001;
			mem[9'b011010001] = 18'b000000000100100011;
			mem[9'b011010010] = 18'b000000000100011101;
			mem[9'b011010011] = 18'b000000000100010111;
			mem[9'b011010100] = 18'b000000000100010001;
			mem[9'b011010101] = 18'b000000000100001011;
			mem[9'b011010110] = 18'b000000000100000100;
			mem[9'b011010111] = 18'b000000000011111110;
			mem[9'b011011000] = 18'b000000000011111000;
			mem[9'b011011001] = 18'b000000000011110010;
			mem[9'b011011010] = 18'b000000000011101100;
			mem[9'b011011011] = 18'b000000000011100110;
			mem[9'b011011100] = 18'b000000000011100000;
			mem[9'b011011101] = 18'b000000000011011010;
			mem[9'b011011110] = 18'b000000000011010100;
			mem[9'b011011111] = 18'b000000000011001101;
			mem[9'b011100000] = 18'b000000000011000111;
			mem[9'b011100001] = 18'b000000000011000001;
			mem[9'b011100010] = 18'b000000000010111011;
			mem[9'b011100011] = 18'b000000000010110101;
			mem[9'b011100100] = 18'b000000000010101111;
			mem[9'b011100101] = 18'b000000000010101000;
			mem[9'b011100110] = 18'b000000000010100010;
			mem[9'b011100111] = 18'b000000000010011100;
			mem[9'b011101000] = 18'b000000000010010110;
			mem[9'b011101001] = 18'b000000000010010000;
			mem[9'b011101010] = 18'b000000000010001001;
			mem[9'b011101011] = 18'b000000000010000011;
			mem[9'b011101100] = 18'b000000000001111101;
			mem[9'b011101101] = 18'b000000000001110111;
			mem[9'b011101110] = 18'b000000000001110000;
			mem[9'b011101111] = 18'b000000000001101010;
			mem[9'b011110000] = 18'b000000000001100100;
			mem[9'b011110001] = 18'b000000000001011110;
			mem[9'b011110010] = 18'b000000000001010111;
			mem[9'b011110011] = 18'b000000000001010001;
			mem[9'b011110100] = 18'b000000000001001011;
			mem[9'b011110101] = 18'b000000000001000101;
			mem[9'b011110110] = 18'b000000000000111110;
			mem[9'b011110111] = 18'b000000000000111000;
			mem[9'b011111000] = 18'b000000000000110010;
			mem[9'b011111001] = 18'b000000000000101011;
			mem[9'b011111010] = 18'b000000000000100101;
			mem[9'b011111011] = 18'b000000000000011111;
			mem[9'b011111100] = 18'b000000000000011001;
			mem[9'b011111101] = 18'b000000000000010010;
			mem[9'b011111110] = 18'b000000000000001100;
			mem[9'b011111111] = 18'b000000000000000110;
			mem[9'b100000000] = 18'b000000000000000000;
			mem[9'b100000001] = 18'b111111111111111001;
			mem[9'b100000010] = 18'b111111111111110011;
			mem[9'b100000011] = 18'b111111111111101101;
			mem[9'b100000100] = 18'b111111111111100110;
			mem[9'b100000101] = 18'b111111111111100000;
			mem[9'b100000110] = 18'b111111111111011010;
			mem[9'b100000111] = 18'b111111111111010100;
			mem[9'b100001000] = 18'b111111111111001101;
			mem[9'b100001001] = 18'b111111111111000111;
			mem[9'b100001010] = 18'b111111111111000001;
			mem[9'b100001011] = 18'b111111111110111010;
			mem[9'b100001100] = 18'b111111111110110100;
			mem[9'b100001101] = 18'b111111111110101110;
			mem[9'b100001110] = 18'b111111111110101000;
			mem[9'b100001111] = 18'b111111111110100001;
			mem[9'b100010000] = 18'b111111111110011011;
			mem[9'b100010001] = 18'b111111111110010101;
			mem[9'b100010010] = 18'b111111111110001111;
			mem[9'b100010011] = 18'b111111111110001000;
			mem[9'b100010100] = 18'b111111111110000010;
			mem[9'b100010101] = 18'b111111111101111100;
			mem[9'b100010110] = 18'b111111111101110110;
			mem[9'b100010111] = 18'b111111111101101111;
			mem[9'b100011000] = 18'b111111111101101001;
			mem[9'b100011001] = 18'b111111111101100011;
			mem[9'b100011010] = 18'b111111111101011101;
			mem[9'b100011011] = 18'b111111111101010111;
			mem[9'b100011100] = 18'b111111111101010000;
			mem[9'b100011101] = 18'b111111111101001010;
			mem[9'b100011110] = 18'b111111111101000100;
			mem[9'b100011111] = 18'b111111111100111110;
			mem[9'b100100000] = 18'b111111111100111000;
			mem[9'b100100001] = 18'b111111111100110010;
			mem[9'b100100010] = 18'b111111111100101011;
			mem[9'b100100011] = 18'b111111111100100101;
			mem[9'b100100100] = 18'b111111111100011111;
			mem[9'b100100101] = 18'b111111111100011001;
			mem[9'b100100110] = 18'b111111111100010011;
			mem[9'b100100111] = 18'b111111111100001101;
			mem[9'b100101000] = 18'b111111111100000111;
			mem[9'b100101001] = 18'b111111111100000001;
			mem[9'b100101010] = 18'b111111111011111011;
			mem[9'b100101011] = 18'b111111111011110100;
			mem[9'b100101100] = 18'b111111111011101110;
			mem[9'b100101101] = 18'b111111111011101000;
			mem[9'b100101110] = 18'b111111111011100010;
			mem[9'b100101111] = 18'b111111111011011100;
			mem[9'b100110000] = 18'b111111111011010110;
			mem[9'b100110001] = 18'b111111111011010000;
			mem[9'b100110010] = 18'b111111111011001010;
			mem[9'b100110011] = 18'b111111111011000100;
			mem[9'b100110100] = 18'b111111111010111110;
			mem[9'b100110101] = 18'b111111111010111000;
			mem[9'b100110110] = 18'b111111111010110010;
			mem[9'b100110111] = 18'b111111111010101100;
			mem[9'b100111000] = 18'b111111111010100111;
			mem[9'b100111001] = 18'b111111111010100001;
			mem[9'b100111010] = 18'b111111111010011011;
			mem[9'b100111011] = 18'b111111111010010101;
			mem[9'b100111100] = 18'b111111111010001111;
			mem[9'b100111101] = 18'b111111111010001001;
			mem[9'b100111110] = 18'b111111111010000011;
			mem[9'b100111111] = 18'b111111111001111101;
			mem[9'b101000000] = 18'b111111111001111000;
			mem[9'b101000001] = 18'b111111111001110010;
			mem[9'b101000010] = 18'b111111111001101100;
			mem[9'b101000011] = 18'b111111111001100110;
			mem[9'b101000100] = 18'b111111111001100001;
			mem[9'b101000101] = 18'b111111111001011011;
			mem[9'b101000110] = 18'b111111111001010101;
			mem[9'b101000111] = 18'b111111111001001111;
			mem[9'b101001000] = 18'b111111111001001010;
			mem[9'b101001001] = 18'b111111111001000100;
			mem[9'b101001010] = 18'b111111111000111110;
			mem[9'b101001011] = 18'b111111111000111001;
			mem[9'b101001100] = 18'b111111111000110011;
			mem[9'b101001101] = 18'b111111111000101101;
			mem[9'b101001110] = 18'b111111111000101000;
			mem[9'b101001111] = 18'b111111111000100010;
			mem[9'b101010000] = 18'b111111111000011101;
			mem[9'b101010001] = 18'b111111111000010111;
			mem[9'b101010010] = 18'b111111111000010010;
			mem[9'b101010011] = 18'b111111111000001100;
			mem[9'b101010100] = 18'b111111111000000111;
			mem[9'b101010101] = 18'b111111111000000001;
			mem[9'b101010110] = 18'b111111110111111100;
			mem[9'b101010111] = 18'b111111110111110110;
			mem[9'b101011000] = 18'b111111110111110001;
			mem[9'b101011001] = 18'b111111110111101100;
			mem[9'b101011010] = 18'b111111110111100110;
			mem[9'b101011011] = 18'b111111110111100001;
			mem[9'b101011100] = 18'b111111110111011100;
			mem[9'b101011101] = 18'b111111110111010110;
			mem[9'b101011110] = 18'b111111110111010001;
			mem[9'b101011111] = 18'b111111110111001100;
			mem[9'b101100000] = 18'b111111110111000111;
			mem[9'b101100001] = 18'b111111110111000001;
			mem[9'b101100010] = 18'b111111110110111100;
			mem[9'b101100011] = 18'b111111110110110111;
			mem[9'b101100100] = 18'b111111110110110010;
			mem[9'b101100101] = 18'b111111110110101101;
			mem[9'b101100110] = 18'b111111110110101000;
			mem[9'b101100111] = 18'b111111110110100011;
			mem[9'b101101000] = 18'b111111110110011110;
			mem[9'b101101001] = 18'b111111110110011000;
			mem[9'b101101010] = 18'b111111110110010011;
			mem[9'b101101011] = 18'b111111110110001110;
			mem[9'b101101100] = 18'b111111110110001010;
			mem[9'b101101101] = 18'b111111110110000101;
			mem[9'b101101110] = 18'b111111110110000000;
			mem[9'b101101111] = 18'b111111110101111011;
			mem[9'b101110000] = 18'b111111110101110110;
			mem[9'b101110001] = 18'b111111110101110001;
			mem[9'b101110010] = 18'b111111110101101100;
			mem[9'b101110011] = 18'b111111110101100111;
			mem[9'b101110100] = 18'b111111110101100011;
			mem[9'b101110101] = 18'b111111110101011110;
			mem[9'b101110110] = 18'b111111110101011001;
			mem[9'b101110111] = 18'b111111110101010100;
			mem[9'b101111000] = 18'b111111110101010000;
			mem[9'b101111001] = 18'b111111110101001011;
			mem[9'b101111010] = 18'b111111110101000111;
			mem[9'b101111011] = 18'b111111110101000010;
			mem[9'b101111100] = 18'b111111110100111101;
			mem[9'b101111101] = 18'b111111110100111001;
			mem[9'b101111110] = 18'b111111110100110100;
			mem[9'b101111111] = 18'b111111110100110000;
			mem[9'b110000000] = 18'b111111110100101011;
			mem[9'b110000001] = 18'b111111110100100111;
			mem[9'b110000010] = 18'b111111110100100011;
			mem[9'b110000011] = 18'b111111110100011110;
			mem[9'b110000100] = 18'b111111110100011010;
			mem[9'b110000101] = 18'b111111110100010110;
			mem[9'b110000110] = 18'b111111110100010001;
			mem[9'b110000111] = 18'b111111110100001101;
			mem[9'b110001000] = 18'b111111110100001001;
			mem[9'b110001001] = 18'b111111110100000101;
			mem[9'b110001010] = 18'b111111110100000000;
			mem[9'b110001011] = 18'b111111110011111100;
			mem[9'b110001100] = 18'b111111110011111000;
			mem[9'b110001101] = 18'b111111110011110100;
			mem[9'b110001110] = 18'b111111110011110000;
			mem[9'b110001111] = 18'b111111110011101100;
			mem[9'b110010000] = 18'b111111110011101000;
			mem[9'b110010001] = 18'b111111110011100100;
			mem[9'b110010010] = 18'b111111110011100000;
			mem[9'b110010011] = 18'b111111110011011100;
			mem[9'b110010100] = 18'b111111110011011000;
			mem[9'b110010101] = 18'b111111110011010100;
			mem[9'b110010110] = 18'b111111110011010001;
			mem[9'b110010111] = 18'b111111110011001101;
			mem[9'b110011000] = 18'b111111110011001001;
			mem[9'b110011001] = 18'b111111110011000101;
			mem[9'b110011010] = 18'b111111110011000010;
			mem[9'b110011011] = 18'b111111110010111110;
			mem[9'b110011100] = 18'b111111110010111010;
			mem[9'b110011101] = 18'b111111110010110111;
			mem[9'b110011110] = 18'b111111110010110011;
			mem[9'b110011111] = 18'b111111110010110000;
			mem[9'b110100000] = 18'b111111110010101100;
			mem[9'b110100001] = 18'b111111110010101001;
			mem[9'b110100010] = 18'b111111110010100101;
			mem[9'b110100011] = 18'b111111110010100010;
			mem[9'b110100100] = 18'b111111110010011110;
			mem[9'b110100101] = 18'b111111110010011011;
			mem[9'b110100110] = 18'b111111110010011000;
			mem[9'b110100111] = 18'b111111110010010100;
			mem[9'b110101000] = 18'b111111110010010001;
			mem[9'b110101001] = 18'b111111110010001110;
			mem[9'b110101010] = 18'b111111110010001011;
			mem[9'b110101011] = 18'b111111110010001000;
			mem[9'b110101100] = 18'b111111110010000101;
			mem[9'b110101101] = 18'b111111110010000001;
			mem[9'b110101110] = 18'b111111110001111110;
			mem[9'b110101111] = 18'b111111110001111011;
			mem[9'b110110000] = 18'b111111110001111000;
			mem[9'b110110001] = 18'b111111110001110101;
			mem[9'b110110010] = 18'b111111110001110011;
			mem[9'b110110011] = 18'b111111110001110000;
			mem[9'b110110100] = 18'b111111110001101101;
			mem[9'b110110101] = 18'b111111110001101010;
			mem[9'b110110110] = 18'b111111110001100111;
			mem[9'b110110111] = 18'b111111110001100101;
			mem[9'b110111000] = 18'b111111110001100010;
			mem[9'b110111001] = 18'b111111110001011111;
			mem[9'b110111010] = 18'b111111110001011101;
			mem[9'b110111011] = 18'b111111110001011010;
			mem[9'b110111100] = 18'b111111110001010111;
			mem[9'b110111101] = 18'b111111110001010101;
			mem[9'b110111110] = 18'b111111110001010010;
			mem[9'b110111111] = 18'b111111110001010000;
			mem[9'b111000000] = 18'b111111110001001101;
			mem[9'b111000001] = 18'b111111110001001011;
			mem[9'b111000010] = 18'b111111110001001001;
			mem[9'b111000011] = 18'b111111110001000110;
			mem[9'b111000100] = 18'b111111110001000100;
			mem[9'b111000101] = 18'b111111110001000010;
			mem[9'b111000110] = 18'b111111110001000000;
			mem[9'b111000111] = 18'b111111110000111101;
			mem[9'b111001000] = 18'b111111110000111011;
			mem[9'b111001001] = 18'b111111110000111001;
			mem[9'b111001010] = 18'b111111110000110111;
			mem[9'b111001011] = 18'b111111110000110101;
			mem[9'b111001100] = 18'b111111110000110011;
			mem[9'b111001101] = 18'b111111110000110001;
			mem[9'b111001110] = 18'b111111110000101111;
			mem[9'b111001111] = 18'b111111110000101101;
			mem[9'b111010000] = 18'b111111110000101100;
			mem[9'b111010001] = 18'b111111110000101010;
			mem[9'b111010010] = 18'b111111110000101000;
			mem[9'b111010011] = 18'b111111110000100110;
			mem[9'b111010100] = 18'b111111110000100101;
			mem[9'b111010101] = 18'b111111110000100011;
			mem[9'b111010110] = 18'b111111110000100001;
			mem[9'b111010111] = 18'b111111110000100000;
			mem[9'b111011000] = 18'b111111110000011110;
			mem[9'b111011001] = 18'b111111110000011101;
			mem[9'b111011010] = 18'b111111110000011011;
			mem[9'b111011011] = 18'b111111110000011010;
			mem[9'b111011100] = 18'b111111110000011000;
			mem[9'b111011101] = 18'b111111110000010111;
			mem[9'b111011110] = 18'b111111110000010110;
			mem[9'b111011111] = 18'b111111110000010100;
			mem[9'b111100000] = 18'b111111110000010011;
			mem[9'b111100001] = 18'b111111110000010010;
			mem[9'b111100010] = 18'b111111110000010001;
			mem[9'b111100011] = 18'b111111110000010000;
			mem[9'b111100100] = 18'b111111110000001111;
			mem[9'b111100101] = 18'b111111110000001110;
			mem[9'b111100110] = 18'b111111110000001101;
			mem[9'b111100111] = 18'b111111110000001100;
			mem[9'b111101000] = 18'b111111110000001011;
			mem[9'b111101001] = 18'b111111110000001010;
			mem[9'b111101010] = 18'b111111110000001001;
			mem[9'b111101011] = 18'b111111110000001000;
			mem[9'b111101100] = 18'b111111110000000111;
			mem[9'b111101101] = 18'b111111110000000110;
			mem[9'b111101110] = 18'b111111110000000110;
			mem[9'b111101111] = 18'b111111110000000101;
			mem[9'b111110000] = 18'b111111110000000100;
			mem[9'b111110001] = 18'b111111110000000100;
			mem[9'b111110010] = 18'b111111110000000011;
			mem[9'b111110011] = 18'b111111110000000011;
			mem[9'b111110100] = 18'b111111110000000010;
			mem[9'b111110101] = 18'b111111110000000010;
			mem[9'b111110110] = 18'b111111110000000001;
			mem[9'b111110111] = 18'b111111110000000001;
			mem[9'b111111000] = 18'b111111110000000001;
			mem[9'b111111001] = 18'b111111110000000000;
			mem[9'b111111010] = 18'b111111110000000000;
			mem[9'b111111011] = 18'b111111110000000000;
			mem[9'b111111100] = 18'b111111110000000000;
			mem[9'b111111101] = 18'b111111110000000000;
			mem[9'b111111110] = 18'b111111110000000000;
			mem[9'b111111111] = 18'b111111110000000000;
		end
      else begin
			addr_reg  <= addr;							// infered as input register
			Dout <= mem[addr_reg];
      end
    end
    
endmodule