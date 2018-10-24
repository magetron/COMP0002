	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.globl	_init                   ## -- Begin function init
	.p2align	4, 0x90
_init:                                  ## @init
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -28(%rbp)
	movb	$32, -29(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	leaq	L_.str(%rip), %rdi
	leaq	-29(%rbp), %rsi
	movb	$0, %al
	callq	_scanf
	movsbl	-29(%rbp), %ecx
	cmpl	$10, %ecx
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	je	LBB0_14
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movsbl	-29(%rbp), %eax
	cmpl	$45, %eax
	jne	LBB0_4
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB0_13
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	cmpl	$0, -28(%rbp)
	jne	LBB0_6
## %bb.5:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	imull	$10, (%rax), %ecx
	movsbl	-29(%rbp), %edx
	addl	%edx, %ecx
	subl	$48, %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, (%rax)
	jmp	LBB0_12
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	cmpl	$1, -28(%rbp)
	jne	LBB0_8
## %bb.7:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-16(%rbp), %rax
	imull	$10, (%rax), %ecx
	movsbl	-29(%rbp), %edx
	addl	%edx, %ecx
	subl	$48, %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, (%rax)
	jmp	LBB0_11
LBB0_8:                                 ##   in Loop: Header=BB0_1 Depth=1
	cmpl	$2, -28(%rbp)
	jne	LBB0_10
## %bb.9:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	imull	$10, (%rax), %ecx
	movsbl	-29(%rbp), %edx
	addl	%edx, %ecx
	subl	$48, %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, (%rax)
LBB0_10:                                ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_11
LBB0_11:                                ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_12
LBB0_12:                                ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_13
LBB0_13:                                ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_14
LBB0_14:                                ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_15
LBB0_15:                                ##   in Loop: Header=BB0_1 Depth=1
	movsbl	-29(%rbp), %eax
	cmpl	$10, %eax
	jne	LBB0_1
## %bb.16:
	movl	-28(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_is_leap                ## -- Begin function is_leap
	.p2align	4, 0x90
_is_leap:                               ## @is_leap
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$4, %eax
	movl	%edi, -8(%rbp)
	movl	-8(%rbp), %edi
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	movl	%edi, %eax
	cltd
	movl	-12(%rbp), %edi         ## 4-byte Reload
	idivl	%edi
	cmpl	$0, %edx
	jne	LBB1_3
## %bb.1:
	movl	$100, %eax
	movl	-8(%rbp), %ecx
	movl	%eax, -16(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	cltd
	movl	-16(%rbp), %ecx         ## 4-byte Reload
	idivl	%ecx
	cmpl	$0, %edx
	je	LBB1_3
## %bb.2:
	movl	$1, -4(%rbp)
	jmp	LBB1_7
LBB1_3:
	movl	$400, %eax              ## imm = 0x190
	movl	-8(%rbp), %ecx
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	cltd
	movl	-20(%rbp), %ecx         ## 4-byte Reload
	idivl	%ecx
	cmpl	$0, %edx
	jne	LBB1_5
## %bb.4:
	movl	$1, -4(%rbp)
	jmp	LBB1_7
LBB1_5:
	jmp	LBB1_6
LBB1_6:
	movl	$0, -4(%rbp)
LBB1_7:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_is_knuckle             ## -- Begin function is_knuckle
	.p2align	4, 0x90
_is_knuckle:                            ## @is_knuckle
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -8(%rbp)
	cmpl	$1, -8(%rbp)
	je	LBB2_7
## %bb.1:
	cmpl	$3, -8(%rbp)
	je	LBB2_7
## %bb.2:
	cmpl	$5, -8(%rbp)
	je	LBB2_7
## %bb.3:
	cmpl	$7, -8(%rbp)
	je	LBB2_7
## %bb.4:
	cmpl	$8, -8(%rbp)
	je	LBB2_7
## %bb.5:
	cmpl	$10, -8(%rbp)
	je	LBB2_7
## %bb.6:
	cmpl	$12, -8(%rbp)
	jne	LBB2_8
LBB2_7:
	movl	$1, -4(%rbp)
	jmp	LBB2_9
LBB2_8:
	movl	$0, -4(%rbp)
LBB2_9:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_is_valid               ## -- Begin function is_valid
	.p2align	4, 0x90
_is_valid:                              ## @is_valid
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-12(%rbp), %edi
	callq	_is_knuckle
	cmpl	$0, %eax
	je	LBB3_4
## %bb.1:
	cmpl	$1, -8(%rbp)
	jl	LBB3_4
## %bb.2:
	cmpl	$31, -8(%rbp)
	jg	LBB3_4
## %bb.3:
	movl	$1, -4(%rbp)
	jmp	LBB3_16
LBB3_4:
	cmpl	$2, -12(%rbp)
	je	LBB3_8
## %bb.5:
	cmpl	$1, -8(%rbp)
	jl	LBB3_8
## %bb.6:
	cmpl	$30, -8(%rbp)
	jg	LBB3_8
## %bb.7:
	movl	$1, -4(%rbp)
	jmp	LBB3_16
LBB3_8:
	movl	-16(%rbp), %edi
	callq	_is_leap
	cmpl	$0, %eax
	je	LBB3_12
## %bb.9:
	cmpl	$1, -8(%rbp)
	jl	LBB3_12
## %bb.10:
	cmpl	$29, -8(%rbp)
	jg	LBB3_12
## %bb.11:
	movl	$1, -4(%rbp)
	jmp	LBB3_16
LBB3_12:
	cmpl	$1, -8(%rbp)
	jl	LBB3_15
## %bb.13:
	cmpl	$28, -8(%rbp)
	jg	LBB3_15
## %bb.14:
	movl	$1, -4(%rbp)
	jmp	LBB3_16
LBB3_15:
	movl	$0, -4(%rbp)
LBB3_16:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_day_of_date            ## -- Begin function day_of_date
	.p2align	4, 0x90
_day_of_date:                           ## @day_of_date
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$1, -28(%rbp)
	movl	$1, -32(%rbp)
	movl	$1970, -36(%rbp)        ## imm = 0x7B2
	movl	$0, -40(%rbp)
	movl	$0, -44(%rbp)
LBB4_1:                                 ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movl	-28(%rbp), %eax
	movq	-8(%rbp), %rdx
	cmpl	4(%rdx), %eax
	movb	%cl, -45(%rbp)          ## 1-byte Spill
	jne	LBB4_4
## %bb.2:                               ##   in Loop: Header=BB4_1 Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movl	-32(%rbp), %eax
	movq	-16(%rbp), %rdx
	cmpl	4(%rdx), %eax
	movb	%cl, -45(%rbp)          ## 1-byte Spill
	jne	LBB4_4
## %bb.3:                               ##   in Loop: Header=BB4_1 Depth=1
	movl	-36(%rbp), %eax
	movq	-24(%rbp), %rcx
	cmpl	4(%rcx), %eax
	sete	%dl
	movb	%dl, -45(%rbp)          ## 1-byte Spill
LBB4_4:                                 ##   in Loop: Header=BB4_1 Depth=1
	movb	-45(%rbp), %al          ## 1-byte Reload
	xorb	$-1, %al
	testb	$1, %al
	jne	LBB4_5
	jmp	LBB4_31
LBB4_5:                                 ##   in Loop: Header=BB4_1 Depth=1
	movl	-28(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	(%rcx), %eax
	jne	LBB4_9
## %bb.6:                               ##   in Loop: Header=BB4_1 Depth=1
	movl	-32(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	(%rcx), %eax
	jne	LBB4_9
## %bb.7:                               ##   in Loop: Header=BB4_1 Depth=1
	movl	-36(%rbp), %eax
	movq	-24(%rbp), %rcx
	cmpl	(%rcx), %eax
	jne	LBB4_9
## %bb.8:                               ##   in Loop: Header=BB4_1 Depth=1
	movl	$1, -44(%rbp)
LBB4_9:                                 ##   in Loop: Header=BB4_1 Depth=1
	cmpl	$0, -44(%rbp)
	je	LBB4_11
## %bb.10:                              ##   in Loop: Header=BB4_1 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
LBB4_11:                                ##   in Loop: Header=BB4_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	movl	-32(%rbp), %edi
	callq	_is_knuckle
	cmpl	$0, %eax
	je	LBB4_15
## %bb.12:                              ##   in Loop: Header=BB4_1 Depth=1
	cmpl	$31, -28(%rbp)
	jle	LBB4_14
## %bb.13:                              ##   in Loop: Header=BB4_1 Depth=1
	movl	$1, -28(%rbp)
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
LBB4_14:                                ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_28
LBB4_15:                                ##   in Loop: Header=BB4_1 Depth=1
	cmpl	$2, -32(%rbp)
	je	LBB4_19
## %bb.16:                              ##   in Loop: Header=BB4_1 Depth=1
	cmpl	$30, -28(%rbp)
	jle	LBB4_18
## %bb.17:                              ##   in Loop: Header=BB4_1 Depth=1
	movl	$1, -28(%rbp)
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
LBB4_18:                                ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_27
LBB4_19:                                ##   in Loop: Header=BB4_1 Depth=1
	movl	-36(%rbp), %edi
	callq	_is_leap
	cmpl	$0, %eax
	je	LBB4_23
## %bb.20:                              ##   in Loop: Header=BB4_1 Depth=1
	cmpl	$29, -28(%rbp)
	jle	LBB4_22
## %bb.21:                              ##   in Loop: Header=BB4_1 Depth=1
	movl	$1, -28(%rbp)
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
LBB4_22:                                ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_26
LBB4_23:                                ##   in Loop: Header=BB4_1 Depth=1
	cmpl	$28, -28(%rbp)
	jle	LBB4_25
## %bb.24:                              ##   in Loop: Header=BB4_1 Depth=1
	movl	$1, -28(%rbp)
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
LBB4_25:                                ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_26
LBB4_26:                                ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_27
LBB4_27:                                ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_28
LBB4_28:                                ##   in Loop: Header=BB4_1 Depth=1
	cmpl	$12, -32(%rbp)
	jle	LBB4_30
## %bb.29:                              ##   in Loop: Header=BB4_1 Depth=1
	movl	$1, -32(%rbp)
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
LBB4_30:                                ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_1
LBB4_31:
	movl	-40(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_day              ## -- Begin function print_day
	.p2align	4, 0x90
_print_day:                             ## @print_day
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -12(%rbp)
	movl	-12(%rbp), %edi
	movl	%edi, %eax
	movq	%rax, %rcx
	subq	$6, %rcx
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	movq	%rcx, -32(%rbp)         ## 8-byte Spill
	ja	LBB5_8
## %bb.10:
	leaq	LJTI5_0(%rip), %rax
	movq	-24(%rbp), %rcx         ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB5_1:
	leaq	L_.str.1(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB5_9
LBB5_2:
	leaq	L_.str.2(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB5_9
LBB5_3:
	leaq	L_.str.3(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB5_9
LBB5_4:
	leaq	L_.str.4(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB5_9
LBB5_5:
	leaq	L_.str.5(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB5_9
LBB5_6:
	leaq	L_.str.6(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB5_9
LBB5_7:
	leaq	L_.str.7(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB5_9
LBB5_8:
	leaq	L_.str.8(%rip), %rax
	movq	%rax, -8(%rbp)
LBB5_9:
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
L5_0_set_1 = LBB5_1-LJTI5_0
L5_0_set_2 = LBB5_2-LJTI5_0
L5_0_set_3 = LBB5_3-LJTI5_0
L5_0_set_4 = LBB5_4-LJTI5_0
L5_0_set_5 = LBB5_5-LJTI5_0
L5_0_set_6 = LBB5_6-LJTI5_0
L5_0_set_7 = LBB5_7-LJTI5_0
LJTI5_0:
	.long	L5_0_set_1
	.long	L5_0_set_2
	.long	L5_0_set_3
	.long	L5_0_set_4
	.long	L5_0_set_5
	.long	L5_0_set_6
	.long	L5_0_set_7
	.end_data_region
                                        ## -- End function
	.globl	_print_month            ## -- Begin function print_month
	.p2align	4, 0x90
_print_month:                           ## @print_month
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -12(%rbp)
	movl	-12(%rbp), %edi
	decl	%edi
	movl	%edi, %eax
	subl	$11, %edi
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	movl	%edi, -28(%rbp)         ## 4-byte Spill
	ja	LBB6_13
## %bb.15:
	leaq	LJTI6_0(%rip), %rax
	movq	-24(%rbp), %rcx         ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB6_1:
	leaq	L_.str.9(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_2:
	leaq	L_.str.10(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_3:
	leaq	L_.str.11(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_4:
	leaq	L_.str.12(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_5:
	leaq	L_.str.13(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_6:
	leaq	L_.str.14(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_7:
	leaq	L_.str.15(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_8:
	leaq	L_.str.16(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_9:
	leaq	L_.str.17(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_10:
	leaq	L_.str.18(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_11:
	leaq	L_.str.19(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_12:
	leaq	L_.str.20(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_13:
	leaq	L_.str.8(%rip), %rax
	movq	%rax, -8(%rbp)
LBB6_14:
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
L6_0_set_1 = LBB6_1-LJTI6_0
L6_0_set_2 = LBB6_2-LJTI6_0
L6_0_set_3 = LBB6_3-LJTI6_0
L6_0_set_4 = LBB6_4-LJTI6_0
L6_0_set_5 = LBB6_5-LJTI6_0
L6_0_set_6 = LBB6_6-LJTI6_0
L6_0_set_7 = LBB6_7-LJTI6_0
L6_0_set_8 = LBB6_8-LJTI6_0
L6_0_set_9 = LBB6_9-LJTI6_0
L6_0_set_10 = LBB6_10-LJTI6_0
L6_0_set_11 = LBB6_11-LJTI6_0
L6_0_set_12 = LBB6_12-LJTI6_0
LJTI6_0:
	.long	L6_0_set_1
	.long	L6_0_set_2
	.long	L6_0_set_3
	.long	L6_0_set_4
	.long	L6_0_set_5
	.long	L6_0_set_6
	.long	L6_0_set_7
	.long	L6_0_set_8
	.long	L6_0_set_9
	.long	L6_0_set_10
	.long	L6_0_set_11
	.long	L6_0_set_12
	.end_data_region
                                        ## -- End function
	.globl	_print_leap_year        ## -- Begin function print_leap_year
	.p2align	4, 0x90
_print_leap_year:                       ## @print_leap_year
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -12(%rbp)
	movl	-12(%rbp), %edi
	callq	_is_leap
	cmpl	$0, %eax
	je	LBB7_2
## %bb.1:
	leaq	L_.str.21(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB7_3
LBB7_2:
	leaq	L_.str.22(%rip), %rax
	movq	%rax, -8(%rbp)
LBB7_3:
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	leaq	_d(%rip), %rdi
	leaq	_m(%rip), %rsi
	leaq	_y(%rip), %rdx
	movl	$0, -4(%rbp)
	callq	_init
	cmpl	$2, %eax
	jle	LBB8_2
## %bb.1:
	leaq	L_.str.23(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$1, -4(%rbp)
	movl	%eax, -8(%rbp)          ## 4-byte Spill
	jmp	LBB8_9
LBB8_2:
	leaq	_d(%rip), %rax
	addq	$4, %rax
	leaq	_m(%rip), %rcx
	addq	$4, %rcx
	leaq	_y(%rip), %rdx
	addq	$4, %rdx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_init
	cmpl	$2, %eax
	jle	LBB8_4
## %bb.3:
	leaq	L_.str.23(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$1, -4(%rbp)
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	jmp	LBB8_9
LBB8_4:
	movl	_d(%rip), %edi
	movl	_m(%rip), %esi
	movl	_y(%rip), %edx
	callq	_is_valid
	cmpl	$0, %eax
	je	LBB8_7
## %bb.5:
	movl	_d+4(%rip), %edi
	movl	_m+4(%rip), %esi
	movl	_y+4(%rip), %edx
	callq	_is_valid
	cmpl	$0, %eax
	je	LBB8_7
## %bb.6:
	leaq	_d(%rip), %rdi
	leaq	_m(%rip), %rsi
	leaq	_y(%rip), %rdx
	callq	_day_of_date
	movl	_d(%rip), %edx
	movl	_m(%rip), %edi
	movl	%eax, -16(%rbp)         ## 4-byte Spill
	movl	%edx, -20(%rbp)         ## 4-byte Spill
	callq	_print_month
	movl	_y(%rip), %r8d
	movl	_d+4(%rip), %r9d
	movl	_m+4(%rip), %edi
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	movl	%r8d, -36(%rbp)         ## 4-byte Spill
	movl	%r9d, -40(%rbp)         ## 4-byte Spill
	callq	_print_month
	leaq	L_.str.24(%rip), %rdi
	movl	_y+4(%rip), %edx
	movl	-16(%rbp), %esi         ## 4-byte Reload
	movl	-20(%rbp), %r8d         ## 4-byte Reload
	movl	%edx, -44(%rbp)         ## 4-byte Spill
	movl	%r8d, %edx
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	movl	-36(%rbp), %r8d         ## 4-byte Reload
	movl	-40(%rbp), %r9d         ## 4-byte Reload
	movq	%rax, (%rsp)
	movl	-44(%rbp), %r10d        ## 4-byte Reload
	movl	%r10d, 8(%rsp)
	movb	$0, %al
	callq	_printf
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	jmp	LBB8_8
LBB8_7:
	leaq	L_.str.25(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -52(%rbp)         ## 4-byte Spill
LBB8_8:
	movl	$0, -4(%rbp)
LBB8_9:
	movl	-4(%rbp), %eax
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__const
	.globl	_dd                     ## @dd
	.p2align	2
_dd:
	.long	1                       ## 0x1

	.globl	_mm                     ## @mm
	.p2align	2
_mm:
	.long	1                       ## 0x1

	.globl	_yy                     ## @yy
	.p2align	2
_yy:
	.long	1970                    ## 0x7b2

	.globl	_ddd                    ## @ddd
	.p2align	2
_ddd:
	.long	4                       ## 0x4

	.globl	_d                      ## @d
.zerofill __DATA,__common,_d,8,2
	.globl	_m                      ## @m
.zerofill __DATA,__common,_m,8,2
	.globl	_y                      ## @y
.zerofill __DATA,__common,_y,8,2
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%c"

L_.str.1:                               ## @.str.1
	.asciz	"Sunday"

L_.str.2:                               ## @.str.2
	.asciz	"Monday"

L_.str.3:                               ## @.str.3
	.asciz	"Tuesday"

L_.str.4:                               ## @.str.4
	.asciz	"Wednesday"

L_.str.5:                               ## @.str.5
	.asciz	"Thursday"

L_.str.6:                               ## @.str.6
	.asciz	"Friday"

L_.str.7:                               ## @.str.7
	.asciz	"Saturday"

L_.str.8:                               ## @.str.8
	.asciz	"ERROR"

L_.str.9:                               ## @.str.9
	.asciz	"January"

L_.str.10:                              ## @.str.10
	.asciz	"February"

L_.str.11:                              ## @.str.11
	.asciz	"March"

L_.str.12:                              ## @.str.12
	.asciz	"April"

L_.str.13:                              ## @.str.13
	.asciz	"May"

L_.str.14:                              ## @.str.14
	.asciz	"June"

L_.str.15:                              ## @.str.15
	.asciz	"July"

L_.str.16:                              ## @.str.16
	.asciz	"August"

L_.str.17:                              ## @.str.17
	.asciz	"September"

L_.str.18:                              ## @.str.18
	.asciz	"October"

L_.str.19:                              ## @.str.19
	.asciz	"November"

L_.str.20:                              ## @.str.20
	.asciz	"December"

L_.str.21:                              ## @.str.21
	.asciz	"is a leap year"

L_.str.22:                              ## @.str.22
	.asciz	"isn't a leap year"

L_.str.23:                              ## @.str.23
	.asciz	"ERROR: invalid input"

L_.str.24:                              ## @.str.24
	.asciz	"There are %d days between %d %s %d and %d %s %d.\n"

L_.str.25:                              ## @.str.25
	.asciz	"No valid date"


.subsections_via_symbols
