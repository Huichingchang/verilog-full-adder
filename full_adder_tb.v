`timescale 1ns/1ps
module full_adder_tb;
	reg a,b,cin;
	wire sum, carry;
	integer f;
	
	full_adder uut(
		.a(a),
		.b(b),
		.cin(cin),
		.sum(sum),
		.carry(carry)
	);
	
	initial begin
		$dumpfile("full_adder.vcd");
		$dumpvars(0,full_adder_tb);
		
		f=$fopen("C:/VerilogProjects/verilog-full-adder/monitor_log.txt","w");
		if(!f) begin
			$display("Failed to open file.");
			$finish;
		end
		$display("File opened");
		
		a=0; b=0;cin=0; #10;
		$display("現在寫入中: a=%b b=%b cin=%b sum=%b carry=%b", a,b,cin,sum,carry);
		$fwrite(f,"a=%b, b=%b, cin=%b, sum=%b, carry=%b @ %0t ns\n", a,b,cin,sum,carry,$time);
		a=0; b=0;cin=1; #10;
		$display("現在寫入中: a=%b b=%b cin=%b sum=%b carry=%b", a,b,cin,sum,carry);
		$fwrite(f,"a=%b, b=%b, cin=%b, sum=%b, carry=%b @ %0t ns\n", a,b,cin,sum,carry,$time);
		a=0; b=1; #10;

		a=0; b=1;cin=0; #10;
		$display("現在寫入中: a=%b b=%b cin=%b sum=%b carry=%b", a,b,cin,sum,carry);
		$fwrite(f,"a=%b, b=%b, cin=%b, sum=%b, carry=%b @ %0t ns\n", a,b,cin,sum,carry,$time);
		a=0; b=1;cin=1; #10;
		$display("現在寫入中: a=%b b=%b cin=%b sum=%b carry=%b", a,b,cin,sum,carry);
		$fwrite(f,"a=%b, b=%b, cin=%b, sum=%b, carry=%b @ %0t ns\n", a,b,cin,sum,carry,$time);

		a=1; b=0;cin=0;#10;
		$display("現在寫入中: a=%b b=%b cin=%b sum=%b carry=%b", a,b,cin,sum,carry);
		$fwrite(f,"a=%b, b=%b, cin=%b, sum=%b, carry=%b @ %0t ns\n", a,b,cin,sum,carry,$time);
		a=1; b=0;cin=1;#10;
		$display("現在寫入中: a=%b b=%b cin=%b sum=%b carry=%b", a,b,cin,sum,carry);
		$fwrite(f,"a=%b, b=%b, cin=%b, sum=%b, carry=%b @ %0t ns\n", a,b,cin,sum,carry,$time);

		a=1; b=1;cin=0; #10;
		$display("現在寫入中: a=%b b=%b cin=%b sum=%b carry=%b", a,b,cin,sum,carry);
		$fwrite(f,"a=%b, b=%b, cin=%b, sum=%b, carry=%b @ %0t ns\n", a,b,cin,sum,carry,$time);
		a=1; b=1;cin=1; #10;
		$display("現在寫入中: a=%b b=%b cin=%b sum=%b carry=%b", a,b,cin,sum,carry);
		$fwrite(f,"a=%b, b=%b, cin=%b, sum=%b, carry=%b @ %0t ns\n", a,b,cin,sum,carry,$time);

		$fclose(f);
		$display("Simulation done.");
		#100;
		$finish;
	end
endmodule
		