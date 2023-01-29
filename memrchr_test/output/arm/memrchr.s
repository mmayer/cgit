	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_memrchr                        ; -- Begin function memrchr
	.p2align	2
_memrchr:                               ; @memrchr
	.cfi_startproc
; %bb.0:
	cbz	x2, LBB0_4
; %bb.1:
	sub	x8, x0, #1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ldrb	w9, [x8, x2]
	cmp	w9, w1, uxtb
	b.eq	LBB0_5
; %bb.3:                                ;   in Loop: Header=BB0_2 Depth=1
	subs	x2, x2, #1
	b.ne	LBB0_2
LBB0_4:
	mov	x0, #0
	ret
LBB0_5:
	add	x8, x0, x2
	sub	x0, x8, #1
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
