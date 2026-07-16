// ============================================================
//  traffic_light.v - FSM den giao thong (Moore)
//  XANH -> VANG -> DO -> XANH -> ...
// ============================================================
module traffic_light (
  input  wire clk,
  input  wire rst,
  output reg  den_xanh,
  output reg  den_vang,
  output reg  den_do
);

  localparam XANH = 2'b00;
  localparam VANG = 2'b01;
  localparam DO   = 2'b10;

  reg [1:0] tt_hien_tai;   // trang thai dang o
  reg [1:0] tt_ke_tiep;    // trang thai se nhay toi

  // KHOI 1: Thanh ghi trang thai (TUAN TU)
  always @(posedge clk) begin
    if (rst) tt_hien_tai <= XANH;
    else     tt_hien_tai <= tt_ke_tiep;
  end

  // KHOI 2: Logic trang thai ke (TO HOP)
  always @(*) begin
    case (tt_hien_tai)
      XANH:    tt_ke_tiep = VANG;
      VANG:    tt_ke_tiep = DO;
      DO:      tt_ke_tiep = XANH;
      default: tt_ke_tiep = XANH;
    endcase
  end

  // KHOI 3: Logic ngo ra (TO HOP) - gan mac dinh de tranh latch
  always @(*) begin
    den_xanh = 0; den_vang = 0; den_do = 0;
    case (tt_hien_tai)
      XANH: den_xanh = 1;
      VANG: den_vang = 1;
      DO:   den_do   = 1;
    endcase
  end
endmodule


// ---------------- TESTBENCH ----------------
module tb_traffic_light;
  reg clk = 0, rst;
  wire den_xanh, den_vang, den_do;

  traffic_light dut (.clk(clk), .rst(rst),
                     .den_xanh(den_xanh), .den_vang(den_vang), .den_do(den_do));

  always #5 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_traffic_light);
    rst = 1; #12;
    rst = 0;
    #100;
    $finish;
  end

  always @(posedge clk)
    $display("t=%3t | xanh=%b vang=%b do=%b", $time, den_xanh, den_vang, den_do);
endmodule
