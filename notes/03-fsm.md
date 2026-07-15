# Tuan 3 - FSM (Finite State Machine / May trang thai)

## FSM la gi?
May luon o MOT trong vai trang thai, va chuyen trang thai theo quy tac.
Vi du de nhat: den giao thong (Xanh -> Vang -> Do -> Xanh...).

## 3 thanh phan cua FSM
1. States (trang thai): cac "che do" may co the o
2. Transitions (chuyen tiep): khi nao nhay sang trang thai khac (theo clock + input)
3. Outputs (ngo ra): moi trang thai xuat ra gi

## Cau truc code FSM chuan = 3 KHOI
1. Thanh ghi trang thai (TUAN TU): always @(posedge clk), dung non-blocking <=
2. Logic trang thai ke (TO HOP): always @(*) + case
3. Logic ngo ra (TO HOP): always @(*), gan gia tri mac dinh truoc de TRANH LATCH

## Moore vs Mealy
- Moore: output chi phu thuoc TRANG THAI hien tai
- Mealy: output phu thuoc trang thai + INPUT

## Muc tieu Tuan 3
- [x] Hieu khai niem FSM (Moore/Mealy, so do trang thai)
- [ ] Code traffic_light FSM (den giao thong)
- [ ] Code sequence detector "1011"
- [ ] Xem waveform trang thai nhay theo clock

## Nguon hoc
- Nandland: "State Machine" (de hieu nhat cho nguoi moi)
- ChipVerify: Verilog FSM tutorial
- HDLBits: Circuits -> Sequential -> Finite State Machines
- Neso Academy: Mealy/Moore machines
