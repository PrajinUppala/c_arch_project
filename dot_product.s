	.text
	.file	"dot_product.c"
	.globl	dot_product                     # -- Begin function dot_product
	.p2align	4, 0x90
	.type	dot_product,@function
dot_product:                            # @dot_product
	.cfi_startproc
# %bb.0:
	testl	%edx, %edx
	jle	.LBB0_1
# %bb.2:
	movl	%edx, %ecx
	cmpl	$8, %edx
	jae	.LBB0_4
# %bb.3:
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.LBB0_7
.LBB0_1:
	xorl	%eax, %eax
	retq
.LBB0_4:
	movl	%ecx, %edx
	andl	$2147483640, %edx               # imm = 0x7FFFFFF8
	movl	%ecx, %eax
	shrl	$3, %eax
	andl	$268435455, %eax                # imm = 0xFFFFFFF
	shlq	$5, %rax
	pxor	%xmm0, %xmm0
	xorl	%r8d, %r8d
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movdqu	(%rdi,%r8), %xmm2
	movdqu	16(%rdi,%r8), %xmm3
	movdqu	(%rsi,%r8), %xmm4
	movdqu	16(%rsi,%r8), %xmm5
	pshufd	$245, %xmm4, %xmm6              # xmm6 = xmm4[1,1,3,3]
	pmuludq	%xmm2, %xmm4
	pshufd	$232, %xmm4, %xmm4              # xmm4 = xmm4[0,2,2,3]
	pshufd	$245, %xmm2, %xmm2              # xmm2 = xmm2[1,1,3,3]
	pmuludq	%xmm6, %xmm2
	pshufd	$232, %xmm2, %xmm2              # xmm2 = xmm2[0,2,2,3]
	punpckldq	%xmm2, %xmm4            # xmm4 = xmm4[0],xmm2[0],xmm4[1],xmm2[1]
	paddd	%xmm4, %xmm0
	pshufd	$245, %xmm5, %xmm2              # xmm2 = xmm5[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pshufd	$232, %xmm5, %xmm4              # xmm4 = xmm5[0,2,2,3]
	pshufd	$245, %xmm3, %xmm3              # xmm3 = xmm3[1,1,3,3]
	pmuludq	%xmm2, %xmm3
	pshufd	$232, %xmm3, %xmm2              # xmm2 = xmm3[0,2,2,3]
	punpckldq	%xmm2, %xmm4            # xmm4 = xmm4[0],xmm2[0],xmm4[1],xmm2[1]
	paddd	%xmm4, %xmm1
	addq	$32, %r8
	cmpq	%r8, %rax
	jne	.LBB0_5
# %bb.6:
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
	cmpq	%rcx, %rdx
	je	.LBB0_8
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movl	(%rsi,%rdx,4), %r8d
	imull	(%rdi,%rdx,4), %r8d
	addl	%r8d, %eax
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_7
.LBB0_8:
	retq
.Lfunc_end0:
	.size	dot_product, .Lfunc_end0-dot_product
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	.L.str(%rip), %rdi
	movl	$32, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Dot product: %d\n"
	.size	.L.str, 17

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
