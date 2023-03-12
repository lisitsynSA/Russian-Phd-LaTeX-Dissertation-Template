a.out:     file format elf64-x86-64

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 e2 2f 00 00    	pushq  0x2fe2(%rip)        # 4008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 e4 2f 00 00    	jmpq   *0x2fe4(%rip)        # 4010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <printf@plt>:
    1030:	ff 25 e2 2f 00 00    	jmpq   *0x2fe2(%rip)        # 4018 <printf@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	pushq  $0x0
    103b:	e9 e0 ff ff ff       	jmpq   1020 <.plt>

0000000000001040 <sin@plt>:
    1040:	ff 25 da 2f 00 00    	jmpq   *0x2fda(%rip)        # 4020 <sin@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	pushq  $0x1
    104b:	e9 d0 ff ff ff       	jmpq   1020 <.plt>

0000000000001050 <atoi@plt>:
    1050:	ff 25 d2 2f 00 00    	jmpq   *0x2fd2(%rip)        # 4028 <atoi@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	pushq  $0x2
    105b:	e9 c0 ff ff ff       	jmpq   1020 <.plt>

Disassembly of section .text:

0000000000001070 <_start>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	31 ed                	xor    %ebp,%ebp
    1076:	49 89 d1             	mov    %rdx,%r9
    1079:	5e                   	pop    %rsi
    107a:	48 89 e2             	mov    %rsp,%rdx
    107d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1081:	50                   	push   %rax
    1082:	54                   	push   %rsp
    1083:	4c 8d 05 d6 03 00 00 	lea    0x3d6(%rip),%r8        # 1460 <__libc_csu_fini>
    108a:	48 8d 0d 5f 03 00 00 	lea    0x35f(%rip),%rcx        # 13f0 <__libc_csu_init>
    1091:	48 8d 3d 28 02 00 00 	lea    0x228(%rip),%rdi        # 12c0 <main>
    1098:	ff 15 42 2f 00 00    	callq  *0x2f42(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    109e:	f4                   	hlt    
    109f:	90                   	nop

0000000000001160 <falseFunc>:
    1160:	55                   	push   %rbp
    1161:	48 89 e5             	mov    %rsp,%rbp
    1164:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1167:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    116b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    116f:	8b 08                	mov    (%rax),%ecx
    1171:	83 c1 01             	add    $0x1,%ecx
    1174:	89 08                	mov    %ecx,(%rax)
    1176:	0f 57 c0             	xorps  %xmm0,%xmm0
    1179:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
    117e:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%rbp)
    1185:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1188:	3b 45 fc             	cmp    -0x4(%rbp),%eax
    118b:	0f 83 2e 00 00 00    	jae    11bf <falseFunc+0x5f>
    1191:	f2 0f 10 05 6f 0e 00 	movsd  0xe6f(%rip),%xmm0        # 2008 <.LCPI0_0>
    1198:	00 
    1199:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    119c:	89 c1                	mov    %eax,%ecx
    119e:	f2 48 0f 2a c9       	cvtsi2sd %rcx,%xmm1
    11a3:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    11a7:	f2 0f 58 45 e8       	addsd  -0x18(%rbp),%xmm0
    11ac:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
    11b1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    11b4:	83 c0 01             	add    $0x1,%eax
    11b7:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    11ba:	e9 c6 ff ff ff       	jmpq   1185 <falseFunc+0x25>
    11bf:	f2 0f 10 45 e8       	movsd  -0x18(%rbp),%xmm0
    11c4:	5d                   	pop    %rbp
    11c5:	c3                   	retq   
    11c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    11cd:	00 00 00 

00000000000011d0 <trueFunc>:
    11d0:	55                   	push   %rbp
    11d1:	48 89 e5             	mov    %rsp,%rbp
    11d4:	89 7d fc             	mov    %edi,-0x4(%rbp)
    11d7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    11db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11df:	8b 08                	mov    (%rax),%ecx
    11e1:	83 c1 01             	add    $0x1,%ecx
    11e4:	89 08                	mov    %ecx,(%rax)
    11e6:	0f 57 c0             	xorps  %xmm0,%xmm0
    11e9:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
    11ee:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%rbp)
    11f5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    11f8:	3b 45 fc             	cmp    -0x4(%rbp),%eax
    11fb:	0f 83 2e 00 00 00    	jae    122f <trueFunc+0x5f>
    1201:	f2 0f 10 05 ff 0d 00 	movsd  0xdff(%rip),%xmm0        # 2008 <.LCPI0_0>
    1208:	00 
    1209:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    120c:	89 c1                	mov    %eax,%ecx
    120e:	f2 48 0f 2a c9       	cvtsi2sd %rcx,%xmm1
    1213:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    1217:	f2 0f 58 45 e8       	addsd  -0x18(%rbp),%xmm0
    121c:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
    1221:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1224:	83 c0 01             	add    $0x1,%eax
    1227:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    122a:	e9 c6 ff ff ff       	jmpq   11f5 <trueFunc+0x25>
    122f:	f2 0f 10 45 e8       	movsd  -0x18(%rbp),%xmm0
    1234:	5d                   	pop    %rbp
    1235:	c3                   	retq   
    1236:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    123d:	00 00 00 

0000000000001240 <condition>:
    1240:	55                   	push   %rbp
    1241:	48 89 e5             	mov    %rsp,%rbp
    1244:	48 83 ec 30          	sub    $0x30,%rsp
    1248:	f2 0f 10 05 b8 0d 00 	movsd  0xdb8(%rip),%xmm0        # 2008 <.LCPI0_0>
    124f:	00 
    1250:	f2 0f 10 0d b8 0d 00 	movsd  0xdb8(%rip),%xmm1        # 2010 <.LCPI2_1>
    1257:	00 
    1258:	89 7d fc             	mov    %edi,-0x4(%rbp)
    125b:	89 75 f8             	mov    %esi,-0x8(%rbp)
    125e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1261:	0f af c0             	imul   %eax,%eax
    1264:	89 c1                	mov    %eax,%ecx
    1266:	f2 48 0f 2a d1       	cvtsi2sd %rcx,%xmm2
    126b:	f2 0f 11 45 e0       	movsd  %xmm0,-0x20(%rbp)
    1270:	0f 28 c2             	movaps %xmm2,%xmm0
    1273:	f2 0f 11 4d d8       	movsd  %xmm1,-0x28(%rbp)
    1278:	e8 c3 fd ff ff       	callq  1040 <sin@plt>
    127d:	f2 0f 11 45 f0       	movsd  %xmm0,-0x10(%rbp)
    1282:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1285:	89 c1                	mov    %eax,%ecx
    1287:	f2 48 0f 2a c1       	cvtsi2sd %rcx,%xmm0
    128c:	f2 0f 10 4d d8       	movsd  -0x28(%rbp),%xmm1
    1291:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    1295:	f2 0f 10 55 e0       	movsd  -0x20(%rbp),%xmm2
    129a:	f2 0f 5c c2          	subsd  %xmm2,%xmm0
    129e:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
    12a3:	f2 0f 10 45 f0       	movsd  -0x10(%rbp),%xmm0
    12a8:	66 0f 2e 45 e8       	ucomisd -0x18(%rbp),%xmm0
    12ad:	0f 97 c2             	seta   %dl
    12b0:	80 e2 01             	and    $0x1,%dl
    12b3:	0f b6 c2             	movzbl %dl,%eax
    12b6:	48 83 c4 30          	add    $0x30,%rsp
    12ba:	5d                   	pop    %rbp
    12bb:	c3                   	retq   
    12bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000012c0 <main>:
    12c0:	55                   	push   %rbp
    12c1:	48 89 e5             	mov    %rsp,%rbp
    12c4:	48 83 ec 30          	sub    $0x30,%rsp
    12c8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    12cf:	89 7d f8             	mov    %edi,-0x8(%rbp)
    12d2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    12d6:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
    12da:	0f 84 31 00 00 00    	je     1311 <main+0x51>
    12e0:	48 bf 18 20 00 00 00 	movabs $0x2018,%rdi
    12e7:	00 00 00 
    12ea:	b0 00                	mov    $0x0,%al
    12ec:	e8 3f fd ff ff       	callq  1030 <printf@plt>
    12f1:	48 bf 44 20 00 00 00 	movabs $0x2044,%rdi
    12f8:	00 00 00 
    12fb:	89 45 d8             	mov    %eax,-0x28(%rbp)
    12fe:	b0 00                	mov    $0x0,%al
    1300:	e8 2b fd ff ff       	callq  1030 <printf@plt>
    1305:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
    130c:	e9 d6 00 00 00       	jmpq   13e7 <main+0x127>
    1311:	0f 57 c0             	xorps  %xmm0,%xmm0
    1314:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
    1319:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    1320:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    1327:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%rbp)
    132e:	81 7d dc 80 96 98 00 	cmpl   $0x989680,-0x24(%rbp)
    1335:	0f 83 89 00 00 00    	jae    13c4 <main+0x104>
    133b:	8b 7d dc             	mov    -0x24(%rbp),%edi
    133e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1342:	48 8b 40 08          	mov    0x8(%rax),%rax
    1346:	89 7d d4             	mov    %edi,-0x2c(%rbp)
    1349:	48 89 c7             	mov    %rax,%rdi
    134c:	e8 ff fc ff ff       	callq  1050 <atoi@plt>
    1351:	8b 7d d4             	mov    -0x2c(%rbp),%edi
    1354:	89 c6                	mov    %eax,%esi
    1356:	e8 e5 fe ff ff       	callq  1240 <condition>
    135b:	83 f8 00             	cmp    $0x0,%eax
    135e:	0f 84 29 00 00 00    	je     138d <main+0xcd>
    1364:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1367:	31 d2                	xor    %edx,%edx
    1369:	b9 0a 00 00 00       	mov    $0xa,%ecx
    136e:	f7 f1                	div    %ecx
    1370:	83 c2 01             	add    $0x1,%edx
    1373:	89 d7                	mov    %edx,%edi
    1375:	48 8d 75 e4          	lea    -0x1c(%rbp),%rsi
    1379:	e8 52 fe ff ff       	callq  11d0 <trueFunc>
    137e:	f2 0f 58 45 e8       	addsd  -0x18(%rbp),%xmm0
    1383:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
    1388:	e9 24 00 00 00       	jmpq   13b1 <main+0xf1>
    138d:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1390:	31 d2                	xor    %edx,%edx
    1392:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1397:	f7 f1                	div    %ecx
    1399:	83 c2 01             	add    $0x1,%edx
    139c:	89 d7                	mov    %edx,%edi
    139e:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi
    13a2:	e8 b9 fd ff ff       	callq  1160 <falseFunc>
    13a7:	f2 0f 58 45 e8       	addsd  -0x18(%rbp),%xmm0
    13ac:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
    13b1:	e9 00 00 00 00       	jmpq   13b6 <main+0xf6>
    13b6:	8b 45 dc             	mov    -0x24(%rbp),%eax
    13b9:	83 c0 01             	add    $0x1,%eax
    13bc:	89 45 dc             	mov    %eax,-0x24(%rbp)
    13bf:	e9 6a ff ff ff       	jmpq   132e <main+0x6e>
    13c4:	8b 75 e4             	mov    -0x1c(%rbp),%esi
    13c7:	8b 55 e0             	mov    -0x20(%rbp),%edx
    13ca:	f2 0f 10 45 e8       	movsd  -0x18(%rbp),%xmm0
    13cf:	48 bf 76 20 00 00 00 	movabs $0x2076,%rdi
    13d6:	00 00 00 
    13d9:	b0 01                	mov    $0x1,%al
    13db:	e8 50 fc ff ff       	callq  1030 <printf@plt>
    13e0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    13e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    13ea:	48 83 c4 30          	add    $0x30,%rsp
    13ee:	5d                   	pop    %rbp
    13ef:	c3                   	retq   