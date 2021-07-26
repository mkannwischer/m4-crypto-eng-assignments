	.p2align	2,,3
	.syntax		unified
	.text

T6_Mat1:
	.hword	1, 2, 4, 8, 16, 32
	.hword	32, 16, 8, 4, 2, 1
	.hword	1, 4, 16, 64, 256, 1024
	.hword	1024, 256, 64, 16, 4, 1
T_exp_ov_128:
//0-703:2295
T_exp_ov_128_128:
	.hword	-1
T_exp_add_128_128:
	.hword	352	// #TERMS(128,128)/4
//0-703:2295 704-1055:4590
T_exp_ov_128_64:
	.hword	-1
T_exp_add_128_64:
	.hword	528	// #TERMS(128,64)/4
//0-703:2295 704-1407:4590 1408-1583:9180
T_exp_ov_128_32:
	.hword	-1
T_exp_add_128_32:
	.hword	792	// #TERMS(128,32)/4
T_mul_ov_128:
	.hword	2288, 2375
	.hword	-1
	.hword	297	// #TERMS(128,16)/4
