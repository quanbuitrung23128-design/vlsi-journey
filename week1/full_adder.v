// ============================================================
//  full_adder.v  -  Bo cong 1-bit (Full Adder)
//  Tuan 1 - Lam khuon mau cho cac module sau
// ============================================================
//  KIEN THUC: cong 2 bit a, b cung bit nho vao (cin)
//    sum  = tong (bit ket qua)
//    cout = bit nho ra (carry out)
//  Bang chan tri:
//    a b cin | cout sum
//    0 0  0  |  0   0
//    0 0  1  |  0   1
//    0 1  0  |  0   1
//    0 1  1  |  1   0
//    1 0  0  |  0   1
//    1 0  1  |  1   0
//    1 1  0  |  1   0
//    1 1  1  |  1   1
// ============================================================


// ---------- PHAN 1: DESIGN (mach that, se duoc tong hop) ----------
module full_adder (
  input  wire a,      // input dau vao 1
  input  wire b,      // input dau vao 2
  input  wire cin,    // carry in (bit nho vao)
  output wire sum,    // tong
  output wire cout    // carry out (bit nho ra)
);

  // Mach to hop => dung 'assign' (continuous assignment)
  assign sum  = a ^ b ^ cin;                 // XOR ba dau vao
  assign cout = (a & b) | (b & cin) | (a & cin);  // co it nhat 2 bit '1'

endmodule


// ---------- PHAN 2: TESTBENCH (chi de mo phong, KHONG tong hop) ----------
// Quy uoc: ten testbench = tb_<ten_module>
module tb_full_adder;

  // 1) Khai bao tin hieu lai testbench:
  //    - input cua DUT -> khai bao 'reg' (vi ta GAN gia tri cho no)
  //    - output cua DUT -> khai bao 'wire' (vi ta CHI DOC)
  reg  a, b, cin;
  wire sum, cout;

  // Bien dem so ca sai (thoi quen tot cua Verification: tu kiem tra)
  integer errors = 0;

  // 2) Tao instance cua DUT (Design Under Test) - noi day theo TEN cong (.port(tin_hieu))
  full_adder dut (
    .a(a), .b(b), .cin(cin),
    .sum(sum), .cout(cout)
  );

  // 3) Task tu kiem tra: cho input, doi 1 chut, so ket qua thuc te voi ket qua mong doi
  task check(input ra, input rb, input rcin,
             input exp_sum, input exp_cout);
    begin
      a = ra; b = rb; cin = rcin;     // dat input
      #5;                              // doi tin hieu on dinh (mach to hop)
      if (sum === exp_sum && cout === exp_cout)
        $display("OK   a=%b b=%b cin=%b -> sum=%b cout=%b", a, b, cin, sum, cout);
      else begin
        $display("SAI  a=%b b=%b cin=%b -> sum=%b cout=%b (mong doi sum=%b cout=%b)",
                  a, b, cin, sum, cout, exp_sum, exp_cout);
        errors = errors + 1;
      end
    end
  endtask

  // 4) Kich ban mo phong
  initial begin
    // Tao file waveform de mo bang GTKWave
    $dumpfile("full_adder.vcd");
    $dumpvars(0, tb_full_adder);

    // Thu het 8 to hop dau vao (kem ket qua mong doi)
    //      a  b  cin  sum  cout
    check(0, 0,  0,    0,   0);
    check(0, 0,  1,    1,   0);
    check(0, 1,  0,    1,   0);
    check(0, 1,  1,    0,   1);
    check(1, 0,  0,    1,   0);
    check(1, 0,  1,    0,   1);
    check(1, 1,  0,    0,   1);
    check(1, 1,  1,    1,   1);

    // Tong ket
    $display("-------------------------------------");
    if (errors == 0) $display("PASS: tat ca 8 ca dung!");
    else             $display("FAIL: co %0d ca sai", errors);

    $finish;  // ket thuc mo phong
  end

endmodule
