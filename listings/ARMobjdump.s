a.out:     file format elf64-littleaarch64

Disassembly of section .plt:

00000000000006a0 <atoi@plt-0x20>:
 6a0:	a9bf7bf0 	stp	x16, x30, [sp,#-16]!
 6a4:	90000090 	adrp	x16, 10000 <main+0xf71c>
 6a8:	f9468611 	ldr	x17, [x16,#3336]
 6ac:	91342210 	add	x16, x16, #0xd08
 6b0:	d61f0220 	br	x17
 6b4:	d503201f 	nop
 6b8:	d503201f 	nop
 6bc:	d503201f 	nop

00000000000006c0 <atoi@plt>:
 6c0:	90000090 	adrp	x16, 10000 <main+0xf71c>
 6c4:	f9468a11 	ldr	x17, [x16,#3344]
 6c8:	91344210 	add	x16, x16, #0xd10
 6cc:	d61f0220 	br	x17

00000000000006d0 <printf@plt>:
 6d0:	90000090 	adrp	x16, 10000 <main+0xf71c>
 6d4:	f9468e11 	ldr	x17, [x16,#3352]
 6d8:	91346210 	add	x16, x16, #0xd18
 6dc:	d61f0220 	br	x17

00000000000006e0 <sin@plt>:
 6e0:	90000090 	adrp	x16, 10000 <main+0xf71c>
 6e4:	f9469211 	ldr	x17, [x16,#3360]
 6e8:	91348210 	add	x16, x16, #0xd20
 6ec:	d61f0220 	br	x17

00000000000006f0 <__libc_init@plt>:
 6f0:	90000090 	adrp	x16, 10000 <main+0xf71c>
 6f4:	f9469611 	ldr	x17, [x16,#3368]
 6f8:	9134a210 	add	x16, x16, #0xd28
 6fc:	d61f0220 	br	x17

0000000000000700 <__cxa_atexit@plt>:
 700:	90000090 	adrp	x16, 10000 <main+0xf71c>
 704:	f9469a11 	ldr	x17, [x16,#3376]
 708:	9134c210 	add	x16, x16, #0xd30
 70c:	d61f0220 	br	x17

Disassembly of section .text:

0000000000000710 <_start>:
 710:	8b3f63e0 	add	x0, sp, xzr
 714:	14000007 	b	730 <do_arm64_start>

0000000000000718 <__atexit_handler_wrapper>:
 718:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 71c:	910003fd 	mov	x29, sp
 720:	b4000040 	cbz	x0, 728 <__atexit_handler_wrapper+0x10>
 724:	d63f0000 	blr	x0
 728:	a8c17bfd 	ldp	x29, x30, [sp],#16
 72c:	d65f03c0 	ret

0000000000000730 <do_arm64_start>:
 730:	90000082 	adrp	x2, 10000 <main+0xf71c>
 734:	90000086 	adrp	x6, 10000 <main+0xf71c>
 738:	90000085 	adrp	x5, 10000 <main+0xf71c>
 73c:	90000084 	adrp	x4, 10000 <main+0xf71c>
 740:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 744:	d2800001 	mov	x1, #0x0                   	// #0
 748:	910003fd 	mov	x29, sp
 74c:	f94670c6 	ldr	x6, [x6,#3296]
 750:	910063a3 	add	x3, x29, #0x18
 754:	f94678a5 	ldr	x5, [x5,#3312]
 758:	f9467484 	ldr	x4, [x4,#3304]
 75c:	f9466c42 	ldr	x2, [x2,#3288]
 760:	f9000fa6 	str	x6, [x29,#24]
 764:	f90013a5 	str	x5, [x29,#32]
 768:	f90017a4 	str	x4, [x29,#40]
 76c:	97ffffe1 	bl	6f0 <__libc_init@plt>

0000000000000770 <atexit>:
 770:	aa0003e1 	mov	x1, x0
 774:	90000082 	adrp	x2, 10000 <main+0xf71c>
 778:	90000000 	adrp	x0, 0 <note_android_ident-0x1e0>
 77c:	9134e042 	add	x2, x2, #0xd38
 780:	911c6000 	add	x0, x0, #0x718
 784:	17ffffdf 	b	700 <__cxa_atexit@plt>

0000000000000788 <falseFunc>:
 788:	d10083ff 	sub	sp, sp, #0x20
 78c:	320003e8 	orr	w8, wzr, #0x1
 790:	b9001fe0 	str	w0, [sp,#28]
 794:	f9000be1 	str	x1, [sp,#16]
 798:	f9400be1 	ldr	x1, [sp,#16]
 79c:	b9400020 	ldr	w0, [x1]
 7a0:	11000400 	add	w0, w0, #0x1
 7a4:	b9000020 	str	w0, [x1]
 7a8:	f90007ff 	str	xzr, [sp,#8]
 7ac:	b90007e8 	str	w8, [sp,#4]
 7b0:	b94007e8 	ldr	w8, [sp,#4]
 7b4:	b9401fe9 	ldr	w9, [sp,#28]
 7b8:	6b09011f 	cmp	w8, w9
 7bc:	54000182 	b.cs	7ec <falseFunc+0x64>
 7c0:	1e6e1000 	fmov	d0, #1.000000000000000000e+00
 7c4:	b94007e8 	ldr	w8, [sp,#4]
 7c8:	1e630101 	ucvtf	d1, w8
 7cc:	1e611800 	fdiv	d0, d0, d1
 7d0:	fd4007e1 	ldr	d1, [sp,#8]
 7d4:	1e602820 	fadd	d0, d1, d0
 7d8:	fd0007e0 	str	d0, [sp,#8]
 7dc:	b94007e8 	ldr	w8, [sp,#4]
 7e0:	11000508 	add	w8, w8, #0x1
 7e4:	b90007e8 	str	w8, [sp,#4]
 7e8:	17fffff2 	b	7b0 <falseFunc+0x28>
 7ec:	fd4007e0 	ldr	d0, [sp,#8]
 7f0:	910083ff 	add	sp, sp, #0x20
 7f4:	d65f03c0 	ret

00000000000007f8 <trueFunc>:
 7f8:	d10083ff 	sub	sp, sp, #0x20
 7fc:	320003e8 	orr	w8, wzr, #0x1
 800:	b9001fe0 	str	w0, [sp,#28]
 804:	f9000be1 	str	x1, [sp,#16]
 808:	f9400be1 	ldr	x1, [sp,#16]
 80c:	b9400020 	ldr	w0, [x1]
 810:	11000400 	add	w0, w0, #0x1
 814:	b9000020 	str	w0, [x1]
 818:	f90007ff 	str	xzr, [sp,#8]
 81c:	b90007e8 	str	w8, [sp,#4]
 820:	b94007e8 	ldr	w8, [sp,#4]
 824:	b9401fe9 	ldr	w9, [sp,#28]
 828:	6b09011f 	cmp	w8, w9
 82c:	54000182 	b.cs	85c <trueFunc+0x64>
 830:	1e6e1000 	fmov	d0, #1.000000000000000000e+00
 834:	b94007e8 	ldr	w8, [sp,#4]
 838:	1e630101 	ucvtf	d1, w8
 83c:	1e611800 	fdiv	d0, d0, d1
 840:	fd4007e1 	ldr	d1, [sp,#8]
 844:	1e602820 	fadd	d0, d1, d0
 848:	fd0007e0 	str	d0, [sp,#8]
 84c:	b94007e8 	ldr	w8, [sp,#4]
 850:	11000508 	add	w8, w8, #0x1
 854:	b90007e8 	str	w8, [sp,#4]
 858:	17fffff2 	b	820 <trueFunc+0x28>
 85c:	fd4007e0 	ldr	d0, [sp,#8]
 860:	910083ff 	add	sp, sp, #0x20
 864:	d65f03c0 	ret

0000000000000868 <condition>:
 868:	d10103ff 	sub	sp, sp, #0x40
 86c:	a9037bfd 	stp	x29, x30, [sp,#48]
 870:	9100c3fd 	add	x29, sp, #0x30
 874:	1e6e1000 	fmov	d0, #1.000000000000000000e+00
 878:	1e629001 	fmov	d1, #5.000000000000000000e+00
 87c:	b81fc3a0 	stur	w0, [x29,#-4]
 880:	b81f83a1 	stur	w1, [x29,#-8]
 884:	b85fc3a0 	ldur	w0, [x29,#-4]
 888:	b85fc3a1 	ldur	w1, [x29,#-4]
 88c:	1b017c00 	mul	w0, w0, w1
 890:	1e630002 	ucvtf	d2, w0
 894:	fd000be0 	str	d0, [sp,#16]
 898:	4ea21c40 	mov	v0.16b, v2.16b
 89c:	fd0007e1 	str	d1, [sp,#8]
 8a0:	97ffff90 	bl	6e0 <sin@plt>
 8a4:	fc1f03a0 	stur	d0, [x29,#-16]
 8a8:	b85f83a0 	ldur	w0, [x29,#-8]
 8ac:	1e630000 	ucvtf	d0, w0
 8b0:	fd4007e1 	ldr	d1, [sp,#8]
 8b4:	1e611800 	fdiv	d0, d0, d1
 8b8:	fd400be2 	ldr	d2, [sp,#16]
 8bc:	1e623800 	fsub	d0, d0, d2
 8c0:	fd000fe0 	str	d0, [sp,#24]
 8c4:	fc5f03a0 	ldur	d0, [x29,#-16]
 8c8:	fd400fe3 	ldr	d3, [sp,#24]
 8cc:	1e632000 	fcmp	d0, d3
 8d0:	1a9fd7e0 	cset	w0, gt
 8d4:	12000000 	and	w0, w0, #0x1
 8d8:	a9437bfd 	ldp	x29, x30, [sp,#48]
 8dc:	910103ff 	add	sp, sp, #0x40
 8e0:	d65f03c0 	ret

00000000000008e4 <main>:
 8e4:	d10143ff 	sub	sp, sp, #0x50
 8e8:	a9047bfd 	stp	x29, x30, [sp,#64]
 8ec:	910103fd 	add	x29, sp, #0x40
 8f0:	b81fc3bf 	stur	wzr, [x29,#-4]
 8f4:	b81f83a0 	stur	w0, [x29,#-8]
 8f8:	f81f03a1 	stur	x1, [x29,#-16]
 8fc:	b85f83a0 	ldur	w0, [x29,#-8]
 900:	7100081f 	cmp	w0, #0x2
 904:	540001a0 	b.eq	938 <main+0x54>
 908:	90000000 	adrp	x0, 0 <note_android_ident-0x1e0>
 90c:	9128e000 	add	x0, x0, #0xa38
 910:	97ffff70 	bl	6d0 <printf@plt>
 914:	9000001e 	adrp	x30, 0 <note_android_ident-0x1e0>
 918:	912993de 	add	x30, x30, #0xa64
 91c:	b9001be0 	str	w0, [sp,#24]
 920:	aa1e03e0 	mov	x0, x30
 924:	97ffff6b 	bl	6d0 <printf@plt>
 928:	320003e8 	orr	w8, wzr, #0x1
 92c:	b81fc3a8 	stur	w8, [x29,#-4]
 930:	b90017e0 	str	w0, [sp,#20]
 934:	1400003d 	b	a28 <main+0x144>
 938:	320003e8 	orr	w8, wzr, #0x1
 93c:	f81e83bf 	stur	xzr, [x29,#-24]
 940:	b81e43bf 	stur	wzr, [x29,#-28]
 944:	b90023ff 	str	wzr, [sp,#32]
 948:	b9001fe8 	str	w8, [sp,#28]
 94c:	52a01308 	mov	w8, #0x980000              	// #9961472
 950:	7292d008 	movk	w8, #0x9680
 954:	b9401fe9 	ldr	w9, [sp,#28]
 958:	6b08013f 	cmp	w9, w8
 95c:	54000562 	b.cs	a08 <main+0x124>
 960:	b9401fe0 	ldr	w0, [sp,#28]
 964:	f85f03a8 	ldur	x8, [x29,#-16]
 968:	f9400508 	ldr	x8, [x8,#8]
 96c:	b90013e0 	str	w0, [sp,#16]
 970:	aa0803e0 	mov	x0, x8
 974:	97ffff53 	bl	6c0 <atoi@plt>
 978:	b94013e9 	ldr	w9, [sp,#16]
 97c:	b9000fe0 	str	w0, [sp,#12]
 980:	2a0903e0 	mov	w0, w9
 984:	b9400fe1 	ldr	w1, [sp,#12]
 988:	97ffffb8 	bl	868 <condition>
 98c:	340001c0 	cbz	w0, 9c4 <main+0xe0>
 990:	d10073a1 	sub	x1, x29, #0x1c
 994:	52800148 	mov	w8, #0xa                   	// #10
 998:	b9401fe9 	ldr	w9, [sp,#28]
 99c:	5280014a 	mov	w10, #0xa                   	// #10
 9a0:	1ac8092b 	udiv	w11, w9, w8
 9a4:	1b08a568 	msub	w8, w11, w8, w9
 9a8:	11000500 	add	w0, w8, #0x1
 9ac:	b9000bea 	str	w10, [sp,#8]
 9b0:	97ffff92 	bl	7f8 <trueFunc>
 9b4:	fc5e83a1 	ldur	d1, [x29,#-24]
 9b8:	1e602820 	fadd	d0, d1, d0
 9bc:	fc1e83a0 	stur	d0, [x29,#-24]
 9c0:	1400000d 	b	9f4 <main+0x110>
 9c4:	910083e1 	add	x1, sp, #0x20
 9c8:	52800148 	mov	w8, #0xa                   	// #10
 9cc:	b9401fe9 	ldr	w9, [sp,#28]
 9d0:	5280014a 	mov	w10, #0xa                   	// #10
 9d4:	1ac8092b 	udiv	w11, w9, w8
 9d8:	1b08a568 	msub	w8, w11, w8, w9
 9dc:	11000500 	add	w0, w8, #0x1
 9e0:	b90007ea 	str	w10, [sp,#4]
 9e4:	97ffff69 	bl	788 <falseFunc>
 9e8:	fc5e83a1 	ldur	d1, [x29,#-24]
 9ec:	1e602820 	fadd	d0, d1, d0
 9f0:	fc1e83a0 	stur	d0, [x29,#-24]
 9f4:	14000001 	b	9f8 <main+0x114>
 9f8:	b9401fe8 	ldr	w8, [sp,#28]
 9fc:	11000508 	add	w8, w8, #0x1
 a00:	b9001fe8 	str	w8, [sp,#28]
 a04:	17ffffd2 	b	94c <main+0x68>
 a08:	b85e43a1 	ldur	w1, [x29,#-28]
 a0c:	b94023e2 	ldr	w2, [sp,#32]
 a10:	fc5e83a0 	ldur	d0, [x29,#-24]
 a14:	90000000 	adrp	x0, 0 <note_android_ident-0x1e0>
 a18:	912a5800 	add	x0, x0, #0xa96
 a1c:	97ffff2d 	bl	6d0 <printf@plt>
 a20:	b81fc3bf 	stur	wzr, [x29,#-4]
 a24:	b90003e0 	str	w0, [sp]
 a28:	b85fc3a0 	ldur	w0, [x29,#-4]
 a2c:	a9447bfd 	ldp	x29, x30, [sp,#64]
 a30:	910143ff 	add	sp, sp, #0x50
 a34:	d65f03c0 	ret
