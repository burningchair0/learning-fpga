module top (				// Declaring inputs and outputs according to the configuration file (karnix_cabga256.lpf)
	input wire clk25,		// For testing, frequency of clk25 must be set lower in configuration file (25 KHz for example) to see different pulse width on LED
	input wire [1:0] key,
	output wire [3:0] led 
);
	
	servo_pdm # (			// Creating an instance of servo_pdm module (servo_pdm.sv)
		.clk_hz(25000000),	 
		.cyc_hz(50),
	) servo_inst (
		.clk(clk25),
		.en(key[0]),
		.rst(key[1]),
		.duty(8'd0),		// Duty cycle is manually set here for test purposes
		.pdm(led [0])		// LED lights up showing pulse width
	);

endmodule
