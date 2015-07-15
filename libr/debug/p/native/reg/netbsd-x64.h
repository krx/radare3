return strdup (
"=pc	rip\n"
"=sp	rsp\n"
"=bp	rbp\n"
"=a0	rax\n"
"=a1	rbx\n"
"=a2	rcx\n"
"=a3	rdx\n"
"# no profile defined for x86-64\n"
"gpr	rdi	.64	0	0\n"
"gpr	rsi	.64	8	0\n"
"gpr	rdx	.64	16	0\n"
"gpr	rcx	.64	24	0\n"
"gpr	r8	.64	32	0\n"
"gpr	r9	.64	40	0\n"
"gpr	r10	.64	48	0\n"
"gpr	r11	.64	56	0\n"
"gpr	r12	.64	64	0\n"
"gpr	r13	.64	72	0\n"
"gpr	r14	.64	80	0\n"
"gpr	r15	.64	88	0\n"
"gpr	rbp	.64	96	0\n"
"gpr	rbx	.64	104	0\n"
"gpr	rax	.64	112	0\n"
"gpr	rsp	.64	120	0\n"
"gpr	rip	.64	128	0\n"
"gpr	rflags	.64	136	0	c1p.a.zstido.n.rv\n"
"seg	cs	.64	144	0\n"
"seg	ss	.64	152	0\n"
"seg	ds	.64	160	0\n"
"seg	es	.64	168	0\n"
"seg	fs	.64	176	0\n"
"seg	gs	.64	184	0\n"
"drx	dr0	.32	0	0\n"
"drx	dr1	.32	4	0\n"
"drx	dr2	.32	8	0\n"
"drx	dr3	.32	12	0\n"
"drx	dr6	.32	24	0\n"
"drx	dr7	.32	28	0\n"
);