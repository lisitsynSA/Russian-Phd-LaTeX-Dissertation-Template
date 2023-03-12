.globl _start

_start:
	bl main
	mov x0, #42
    mov x8, #93
    svc #0x0