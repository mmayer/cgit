	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_memrchr                        ## -- Begin function memrchr
	.p2align	4, 0x90
_memrchr:                               ## @memrchr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	movq	%rdx, %rcx
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	subq	$1, %rcx
	jb	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	cmpb	%sil, -1(%rdi,%rdx)
	movq	%rcx, %rdx
	jne	LBB0_1
## %bb.3:
	addq	%rcx, %rdi
	movq	%rdi, %rax
LBB0_4:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols
