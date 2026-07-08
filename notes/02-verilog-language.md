# Tuan 2 - Verilog Language (qua HDLBits)

Da hoan thanh >30 bai HDLBits: Basics, Vectors, Modules Hierarchy, Procedures.

## 1. Vectors (bo bit)
- Khai bao: `wire [3:0] a;` -> 4 bit, a[3] la bit cao nhat (MSB).
- Part select: `a[2:1]` lay 2 bit giua.
- Noi bit (concatenation): `{a, b}` gom a va b lai.
- Lap (replication): `{4{a}}` = aaaa.

## 2. Modules: Hierarchy (ghep module con)
- Instantiate theo TEN cong (an toan nhat): `.a(x), .y(z)`.
- Ghep nhieu module con -> mach lon (vd 4 full_adder -> adder 4-bit).

## 3. Procedures (always block) - QUAN TRONG
- `always @(*)`      -> mach TO HOP (combinational)
- `always @(posedge clk)` -> mach TUAN TU (sequential, theo clock)
- Trong mach to hop: dung blocking `=`
- Trong mach tuan tu: dung non-blocking `<=`

## 4. Avoiding latches (BAY phong van)
- Latch vo y xay ra khi always @(*) khong gan gia tri cho MOI nhanh.
- Cach tranh: gan gia tri mac dinh o dau, hoac dam bao moi if/case deu co else/default.

## 5. Cai khac
- Ternary `? :` : `y = sel ? b : a;` (chinh la mux!)
- case, priority encoder, casez.

## Con lam tiep
- [ ] Conditional (dang lam)
- [ ] Circuits -> Sequential -> FSM (Tuan 3)
- [ ] Verification: Writing Testbenches (rat hop DV!)
