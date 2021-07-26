  .p2align  2,,3
  .syntax    unified
  .text

T4_Mat1:
  .hword  8, 4, 2, 1
  .hword  1, 2, 4, 8
T_exp_ov_192:
//0-671:2295
T_exp_ov_192_192:
  .hword  -1
T_exp_add_192_192:
  .hword  336  // #TERMS(192,192)/4
//0-671:2295 672-1007:4590
T_exp_ov_192_96:
  .hword  -1
T_exp_add_192_96:
  .hword  504  // #TERMS(192,96)/4
T_mul_ov_192:
  .hword  1344, 1511
  .hword  -1
  .hword  63  // #TERMS(192,48)/4
  // max size = 17725 @ 1367
T_col_192_ov:
T_col_ov_192_48:
// overflow ranges: 0-1344: mod 48 1344-2016: 9-38  mod 48 2016-2976: mod 48
  .hword 1344, 0, 0
  .hword 2016, 2, 9, 30, 18
  .hword 2976, 0, -9
  .hword  -1
T_col_add_192_48:
  .hword  1008  // =#shift/8, #iterations*4
T_col_ov_192_96:
// overflow ranges: 0-1920: 24-71  mod 96
  .hword 1920, 2, 24, 48, 48
  .hword  -1
T_col_add_192_96:
  .hword  672  // =#shift/8, #iterations*4
T4_Mat2:
  .hword  2295, 2295, 1530, -510, 2168, -2219, -51
  .hword  -5, 1148, 765, 765, -1339, -1339, 0
  .hword  -2293, -2293, -2294, 1785, 255, 0, 255
  .hword  4, -1149, 1531, 1531, 1339, 1339, 0
  .hword  -2, -2, -1531, 1020, 2168, 2219, -204

