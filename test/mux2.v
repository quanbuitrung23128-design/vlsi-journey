// Mux 2:1 - file test cai dat toolchain
module mux2 (
  input  wire a,
  input  wire b,
  input  wire sel,
  output wire y
);
  assign y = sel ? b : a;
endmodule

module tb_mux2;
  reg a, b, sel;
  wire y;

  mux2 dut (.a(a), .b(b), .sel(sel), .y(y));

  initial begin
    $dumpfile("mux2.vcd");   // tao file waveform cho GTKWave
    $dumpvars(0, tb_mux2);

    a=0; b=1; sel=0; #10;
    $display("sel=%b a=%b b=%b -> y=%b", sel, a, b, y);
    sel=1; #10;
    $display("sel=%b a=%b b=%b -> y=%b", sel, a, b, y);

    if (y === 1'b1) $display("PASS: toolchain hoat dong OK");
    else            $display("FAIL");
    $finish;
  end
endmodule
