	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_memrchr                        ; -- Begin function memrchr
	.p2align	2
_memrchr:                               ; @memrchr
	.cfi_startproc
; %bb.0:
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	cbz	x2, LBB0_4
; %bb.2:                                ;   in Loop: Header=BB0_1 Depth=1
	add	x8, x0, x2
	ldurb	w8, [x8, #-1]
	sub	x2, x2, #1
	cmp	w8, w1, uxtb
	b.ne	LBB0_1
; %bb.3:
	add	x0, x0, x2
	ret
LBB0_4:
	mov	x0, #0
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
