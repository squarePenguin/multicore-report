	.file	"main.cpp"
	.text
	.section	.data.rel,"aw"
	.align 8
	.type	_ZZL18__gthread_active_pvE20__gthread_active_ptr, @object
	.size	_ZZL18__gthread_active_pvE20__gthread_active_ptr, 8
_ZZL18__gthread_active_pvE20__gthread_active_ptr:
	.quad	_ZL28__gthrw___pthread_key_createPjPFvPvE
	.text
	.type	_ZL5delayi, @function
_ZL5delayi:
.LFB3720:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -12(%rbp)
.L5:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L2
	movl	$0, -8(%rbp)
.L4:
	cmpl	$99999, -8(%rbp)
	jg	.L3
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	addl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
	jmp	.L4
.L3:
	addl	$1, -12(%rbp)
	jmp	.L5
.L2:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3720:
	.size	_ZL5delayi, .-_ZL5delayi
	.section	.rodata
.LC0:
	.string	"Thread running, arg=%d\n"
.LC1:
	.string	"Thread done"
	.text
	.globl	_Z9thread_fni
	.type	_Z9thread_fni, @function
_Z9thread_fni:
.LFB3721:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %esi
	movl	%edi, %ebx
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	printf@PLT
	movl	%ebx, %edi
	call	_ZL5delayi
	leaq	.LC1(%rip), %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	puts@PLT
	.cfi_endproc
.LFE3721:
	.size	_Z9thread_fni, .-_Z9thread_fni
	.section	.text._ZN7Rw_lock4lockEv,"axG",@progbits,_ZN7Rw_lock4lockEv,comdat
	.align 2
	.weak	_ZN7Rw_lock4lockEv
	.type	_ZN7Rw_lock4lockEv, @function
_ZN7Rw_lock4lockEv:
.LFB3726:
	.cfi_startproc
.L11:
	movl	(%rdi), %eax
	testl	%eax, %eax
	js	.L11
	leal	1(%rax), %edx
	lock cmpxchgl	%edx, (%rdi)
	jne	.L11
	ret
	.cfi_endproc
.LFE3726:
	.size	_ZN7Rw_lock4lockEv, .-_ZN7Rw_lock4lockEv
	.section	.text._ZN7Rw_lock6unlockEv,"axG",@progbits,_ZN7Rw_lock6unlockEv,comdat
	.align 2
	.weak	_ZN7Rw_lock6unlockEv
	.type	_ZN7Rw_lock6unlockEv, @function
_ZN7Rw_lock6unlockEv:
.LFB3727:
	.cfi_startproc
	lock subl	$1, (%rdi)
	ret
	.cfi_endproc
.LFE3727:
	.size	_ZN7Rw_lock6unlockEv, .-_ZN7Rw_lock6unlockEv
	.section	.text._ZN10Tatas_lock4lockEv,"axG",@progbits,_ZN10Tatas_lock4lockEv,comdat
	.align 2
	.weak	_ZN10Tatas_lock4lockEv
	.type	_ZN10Tatas_lock4lockEv, @function
_ZN10Tatas_lock4lockEv:
.LFB3728:
	.cfi_startproc
	movl	$1, %edx
.L18:
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L18
	movl	%edx, %eax
	xchgb	(%rdi), %al
	testb	%al, %al
	jne	.L18
	ret
	.cfi_endproc
.LFE3728:
	.size	_ZN10Tatas_lock4lockEv, .-_ZN10Tatas_lock4lockEv
	.section	.text._ZN10Tatas_lock6unlockEv,"axG",@progbits,_ZN10Tatas_lock6unlockEv,comdat
	.align 2
	.weak	_ZN10Tatas_lock6unlockEv
	.type	_ZN10Tatas_lock6unlockEv, @function
_ZN10Tatas_lock6unlockEv:
.LFB3729:
	.cfi_startproc
	movb	$0, (%rdi)
	ret
	.cfi_endproc
.LFE3729:
	.size	_ZN10Tatas_lock6unlockEv, .-_ZN10Tatas_lock6unlockEv
	.section	.rodata
.LC2:
	.string	"delay: "
.LC3:
	.string	"Waiting for thread "
	.align 8
.LC4:
	.string	"thread::id of a non-executing thread"
.LC5:
	.string	"Joined with thread "
	.section	.text.unlikely,"ax",@progbits
.LCOLDB6:
	.text
.LHOTB6:
	.globl	_Z17spin_threads_testii
	.type	_Z17spin_threads_testii, @function
_Z17spin_threads_testii:
.LFB3731:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3731
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$7, %edx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$80, %rsp
	.cfi_def_cfa_offset 128
	movl	%edi, (%rsp)
	leaq	_ZSt4cout(%rip), %rdi
	movl	%esi, 28(%rsp)
	leaq	.LC2(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
.LEHB0:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	28(%rsp), %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbx
	testq	%rbx, %rbx
	je	.L75
	cmpb	$0, 56(%rbx)
	je	.L25
	movsbl	67(%rbx), %esi
.L26:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
.LEHE0:
	movl	(%rsp), %eax
	movq	$0, 48(%rsp)
	movq	$0, 56(%rsp)
	movq	$0, 64(%rsp)
	testl	%eax, %eax
	jle	.L23
	leaq	28(%rsp), %rax
	xorl	%esi, %esi
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	movq	%rax, 16(%rsp)
	leaq	40(%rsp), %rax
	leaq	48(%rsp), %r14
	movq	%rax, 8(%rsp)
	jmp	.L35
.L76:
	movq	$0, 0(%r13)
	movl	$24, %edi
	movl	28(%rsp), %r15d
	movq	%r14, %rbx
.LEHB1:
	call	_Znwm@PLT
.LEHE1:
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE(%rip), %rcx
	movl	%r15d, 8(%rax)
	movq	8(%rsp), %rsi
	movq	%r13, %rdi
	movq	%rcx, (%rax)
	leaq	_Z9thread_fni(%rip), %rcx
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	%rcx, 16(%rax)
	movq	%rax, 40(%rsp)
.LEHB2:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE2:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L29
	movq	(%rdi), %rax
	call	*8(%rax)
.L29:
	movq	56(%rsp), %rax
	addl	$1, %r12d
	leaq	8(%rax), %r13
	movq	%r13, 56(%rsp)
	cmpl	%r12d, (%rsp)
	je	.L34
.L77:
	movq	64(%rsp), %rsi
.L35:
	cmpq	%r13, %rsi
	jne	.L76
	movq	16(%rsp), %rcx
	leaq	_Z9thread_fni(%rip), %rdx
	movq	%r14, %rdi
	movq	%r14, %rbx
.LEHB3:
	call	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRFviERiEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	movq	56(%rsp), %r13
	addl	$1, %r12d
	cmpl	%r12d, (%rsp)
	jne	.L77
.L34:
	movq	48(%rsp), %rax
	cmpq	%r13, %rax
	je	.L36
	movq	%rax, (%rsp)
	leaq	48(%rsp), %r12
	jmp	.L47
.L81:
	movl	$36, %edx
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %r15
.L38:
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %r14
	testq	%r14, %r14
	je	.L78
	cmpb	$0, 56(%r14)
	je	.L40
	movsbl	67(%r14), %esi
.L41:
	movq	%r15, %rdi
	movq	%r12, %rbx
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movq	(%rsp), %rdi
	call	_ZNSt6thread4joinEv@PLT
	movl	$19, %edx
	leaq	.LC5(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpq	$0, 8(%rsp)
	jne	.L42
	movl	$36, %edx
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %r15
.L43:
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %r14
	testq	%r14, %r14
	je	.L79
	cmpb	$0, 56(%r14)
	je	.L45
	movsbl	67(%r14), %esi
.L46:
	movq	%r15, %rdi
	movq	%r12, %rbx
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	addq	$8, (%rsp)
	movq	(%rsp), %rax
	cmpq	%rax, %r13
	je	.L80
.L47:
	movq	(%rsp), %rax
	movl	$19, %edx
	movq	%r12, %rbx
	leaq	.LC3(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	(%rax), %r15
	movq	%r15, 8(%rsp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	testq	%r15, %r15
	je	.L81
	movq	8(%rsp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %r15
	jmp	.L38
.L36:
	testq	%r13, %r13
	jne	.L50
.L23:
	movq	72(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L82
	addq	$80, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L42:
	.cfi_restore_state
	movq	8(%rsp), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %r15
	jmp	.L43
.L40:
	movq	%r14, %rdi
	movq	%r12, %rbx
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r14), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L41
	movq	%r14, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L41
.L45:
	movq	%r14, %rdi
	movq	%r12, %rbx
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r14), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L46
	movq	%r14, %rdi
	call	*%rax
.LEHE3:
	movsbl	%al, %esi
	jmp	.L46
.L80:
	movq	56(%rsp), %rdx
	movq	48(%rsp), %r13
	cmpq	%r13, %rdx
	je	.L36
	cmpq	$0, 0(%r13)
	jne	.L49
	movq	%r13, %rax
	jmp	.L48
.L73:
	cmpq	$0, (%rax)
	jne	.L49
.L48:
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L73
.L50:
	movq	%r13, %rdi
	call	_ZdlPv@PLT
	jmp	.L23
.L25:
	movq	%rbx, %rdi
.LEHB4:
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L26
	movq	%rbx, %rdi
	call	*%rax
.LEHE4:
	movsbl	%al, %esi
	jmp	.L26
.L49:
	call	_ZSt9terminatev@PLT
.L78:
	leaq	48(%rsp), %rbx
.LEHB5:
	call	_ZSt16__throw_bad_castv@PLT
.L79:
	leaq	48(%rsp), %rbx
	call	_ZSt16__throw_bad_castv@PLT
.LEHE5:
.L75:
.LEHB6:
	call	_ZSt16__throw_bad_castv@PLT
.LEHE6:
.L82:
	call	__stack_chk_fail@PLT
.L60:
	movq	%rax, %r12
	jmp	.L31
.L59:
	movq	%rax, %r12
	jmp	.L33
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA3731:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3731-.LLSDACSB3731
.LLSDACSB3731:
	.uleb128 .LEHB0-.LFB3731
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB3731
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L59-.LFB3731
	.uleb128 0
	.uleb128 .LEHB2-.LFB3731
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L60-.LFB3731
	.uleb128 0
	.uleb128 .LEHB3-.LFB3731
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L59-.LFB3731
	.uleb128 0
	.uleb128 .LEHB4-.LFB3731
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB5-.LFB3731
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L59-.LFB3731
	.uleb128 0
	.uleb128 .LEHB6-.LFB3731
	.uleb128 .LEHE6-.LEHB6
	.uleb128 0
	.uleb128 0
.LLSDACSE3731:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3731
	.type	_Z17spin_threads_testii.cold.93, @function
_Z17spin_threads_testii.cold.93:
.L31:
	.cfi_def_cfa_offset 128
	.cfi_offset 3, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L32
	movq	(%rdi), %rax
	call	*8(%rax)
.L32:
	leaq	48(%rsp), %rbx
.L33:
	movq	%rbx, %rdi
	call	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	movq	%r12, %rdi
.LEHB7:
	call	_Unwind_Resume@PLT
.LEHE7:
	.cfi_endproc
.LFE3731:
	.section	.gcc_except_table
.LLSDAC3731:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3731-.LLSDACSBC3731
.LLSDACSBC3731:
	.uleb128 .LEHB7-.LCOLDB6
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
.LLSDACSEC3731:
	.section	.text.unlikely
	.text
	.size	_Z17spin_threads_testii, .-_Z17spin_threads_testii
	.section	.text.unlikely
	.size	_Z17spin_threads_testii.cold.93, .-_Z17spin_threads_testii.cold.93
.LCOLDE6:
	.text
.LHOTE6:
	.local	_ZL16num_threads_flag
	.comm	_ZL16num_threads_flag,32,32
	.local	_ZL10delay_flag
	.comm	_ZL10delay_flag,32,32
	.local	_ZL13arr_size_flag
	.comm	_ZL13arr_size_flag,32,32
	.local	_ZL14num_loops_flag
	.comm	_ZL14num_loops_flag,32,32
	.local	_ZL10mutex_flag
	.comm	_ZL10mutex_flag,32,32
	.local	_ZL10tatas_flag
	.comm	_ZL10tatas_flag,32,32
	.local	_ZL7rw_flag
	.comm	_ZL7rw_flag,32,32
	.local	_ZL12spin_command
	.comm	_ZL12spin_command,32,32
	.local	_ZL17read_only_command
	.comm	_ZL17read_only_command,32,32
	.section	.text._ZN5TimerD2Ev,"axG",@progbits,_ZN5TimerD5Ev,comdat
	.align 2
	.weak	_ZN5TimerD2Ev
	.type	_ZN5TimerD2Ev, @function
_ZN5TimerD2Ev:
.LFB3739:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3739
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	(%rbx), %rax
	movabsq	$4835703278458516699, %rdx
	movq	%rax, %rcx
	imulq	%rdx
	movq	%rcx, %rdi
	sarq	$63, %rdi
	sarq	$18, %rdx
	movq	%rdx, %rsi
	movabsq	$2361183241434822607, %rdx
	subq	%rdi, %rsi
	movq	%rsi, %rax
	imulq	%rdx
	movq	%rsi, %rax
	sarq	$63, %rax
	sarq	$7, %rdx
	movq	%rdx, %rbx
	movabsq	$1237940039285380275, %rdx
	subq	%rax, %rbx
	movq	%rcx, %rax
	imulq	$1000, %rbx, %rbx
	imulq	%rdx
	subq	%rbx, %rsi
	sarq	$26, %rdx
	movq	%rsi, %rbx
	movq	%rdx, %rsi
	subq	%rdi, %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movl	$1, %edx
	leaq	7(%rsp), %rsi
	movb	$46, 7(%rsp)
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rdx
	movq	$3, 16(%r12,%rdx)
	movq	-24(%rax), %r13
	addq	%r12, %r13
	cmpb	$0, 225(%r13)
	je	.L98
.L84:
	movb	$48, 224(%r13)
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbx
	testq	%rbx, %rbx
	je	.L89
	cmpb	$0, 56(%rbx)
	je	.L90
	movsbl	67(%rbx), %esi
.L91:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L99
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L90:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L91
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L91
.L98:
	movq	240(%r13), %r14
	testq	%r14, %r14
	je	.L89
	cmpb	$0, 56(%r14)
	je	.L100
.L87:
	movb	$1, 225(%r13)
	jmp	.L84
.L100:
	movq	%r14, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r14), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L87
	movl	$32, %esi
	movq	%r14, %rdi
	call	*%rax
	jmp	.L87
.L89:
	call	_ZSt16__throw_bad_castv@PLT
.L99:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE3739:
	.section	.gcc_except_table
.LLSDA3739:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3739-.LLSDACSB3739
.LLSDACSB3739:
.LLSDACSE3739:
	.section	.text._ZN5TimerD2Ev,"axG",@progbits,_ZN5TimerD5Ev,comdat
	.size	_ZN5TimerD2Ev, .-_ZN5TimerD2Ev
	.weak	_ZN5TimerD1Ev
	.set	_ZN5TimerD1Ev,_ZN5TimerD2Ev
	.section	.rodata
.LC7:
	.string	"starting timer"
.LC8:
	.string	"stoi"
.LC9:
	.string	"hardware concurrency: "
.LC10:
	.string	"num_threads: "
.LC11:
	.string	"Done"
	.section	.text.unlikely
.LCOLDB12:
	.section	.text.startup,"ax",@progbits
.LHOTB12:
	.globl	main
	.type	main, @function
main:
.LFB3741:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3741
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$160, %rsp
	.cfi_def_cfa_offset 208
	movl	%edi, 12(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	$14, %edx
	leaq	.LC7(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	%rax, 72(%rsp)
.LEHB8:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	_ZSt4cout(%rip), %rax
	leaq	_ZSt4cout(%rip), %rdx
	movq	-24(%rax), %rax
	movq	240(%rdx,%rax), %rbx
	testq	%rbx, %rbx
	je	.L159
	cmpb	$0, 56(%rbx)
	je	.L103
	movzbl	67(%rbx), %eax
.L104:
	movsbl	%al, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
.LEHE8:
	cmpl	$1, 12(%rsp)
	jle	.L136
	leaq	71(%rsp), %rax
	movl	$2, %ebx
	xorl	%r14d, %r14d
	movl	$0, 28(%rsp)
	movq	%rax, 48(%rsp)
	leaq	112(%rsp), %rax
	leaq	80(%rsp), %r12
	movq	%rax, 40(%rsp)
	leaq	128(%rsp), %rax
	movl	$5, 36(%rsp)
	movl	$10000, 32(%rsp)
	movl	$4, 24(%rsp)
	movq	%rax, 56(%rsp)
	jmp	.L106
.L138:
	xorl	%r14d, %r14d
.L108:
	leaq	16(%r12), %rax
	cmpq	%rax, %r15
	je	.L116
.L131:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L116:
	cmpl	%ebx, 12(%rsp)
	jle	.L105
.L117:
	addq	$1, %rbx
.L106:
	movq	16(%rsp), %rax
	movq	$-1, %rdx
	movq	-8(%rax,%rbx,8), %r13
	leaq	16(%r12), %rax
	movq	%rax, 80(%rsp)
	testq	%r13, %r13
	je	.L107
	movq	%r13, %rdi
	call	strlen@PLT
	leaq	0(%r13,%rax), %rdx
.L107:
	movq	%r13, %rsi
	movq	%r12, %rdi
.LEHB9:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	movq	88(%rsp), %r13
	movq	80(%rsp), %r15
	xorl	%edx, %edx
	leaq	_ZL12spin_command(%rip), %rdi
	movq	%r13, %rcx
	movq	%r15, %rsi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm
	testq	%rax, %rax
	je	.L138
	xorl	%edx, %edx
	movq	%r13, %rcx
	leaq	_ZL17read_only_command(%rip), %rdi
	movq	%r15, %rsi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm
	testq	%rax, %rax
	jne	.L160
	movl	$1, %r14d
	jmp	.L108
.L136:
	movl	$0, 28(%rsp)
	xorl	%r14d, %r14d
	movl	$5, 36(%rsp)
	movl	$10000, 32(%rsp)
	movl	$4, 24(%rsp)
.L105:
	leaq	.LC9(%rip), %rdi
	call	_ZNSt11char_traitsIcE6lengthEPKc
	leaq	.LC9(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	%rax, %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	call	_ZNSt6thread20hardware_concurrencyEv@PLT
	leaq	_ZSt4cout(%rip), %rdi
	movl	%eax, %esi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	leaq	.LC10(%rip), %rdi
	call	_ZNSt11char_traitsIcE6lengthEPKc
	leaq	.LC10(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	%rax, %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	24(%rsp), %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	testl	%r14d, %r14d
	je	.L161
	movl	28(%rsp), %eax
	cmpl	$1, %eax
	je	.L120
	cmpl	$2, %eax
	je	.L121
	movl	32(%rsp), %edx
	movl	36(%rsp), %esi
	leaq	71(%rsp), %rcx
	movl	24(%rsp), %edi
	call	_Z14read_only_testI7No_lockEviiiRT_
.LEHE9:
	jmp	.L119
.L160:
	xorl	%edx, %edx
	movq	%r13, %rcx
	leaq	_ZL10mutex_flag(%rip), %rdi
	movq	%r15, %rsi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm
	testq	%rax, %rax
	jne	.L162
	movl	$1, 28(%rsp)
	jmp	.L108
.L103:
	movq	%rbx, %rdi
.LEHB10:
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movq	48(%rax), %rdx
	movl	$10, %eax
	cmpq	%rcx, %rdx
	je	.L104
	movl	$10, %esi
	movq	%rbx, %rdi
	call	*%rdx
.LEHE10:
	jmp	.L104
.L161:
	movl	32(%rsp), %esi
	movl	24(%rsp), %edi
.LEHB11:
	call	_Z17spin_threads_testii
.L119:
	leaq	.LC11(%rip), %rdi
	call	_ZNSt11char_traitsIcE6lengthEPKc
	leaq	.LC11(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	%rax, %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	leaq	72(%rsp), %rdi
	call	_ZN5TimerD1Ev
	xorl	%eax, %eax
	movq	152(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L163
	addq	$160, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L162:
	.cfi_restore_state
	xorl	%edx, %edx
	movq	%r13, %rcx
	leaq	_ZL10tatas_flag(%rip), %rdi
	movq	%r15, %rsi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm
	testq	%rax, %rax
	jne	.L164
.L142:
	movl	$2, 28(%rsp)
	jmp	.L108
.L164:
	xorl	%edx, %edx
	movq	%r13, %rcx
	leaq	_ZL7rw_flag(%rip), %rdi
	movq	%r15, %rsi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm
	testq	%rax, %rax
	je	.L142
	cmpl	%ebx, 12(%rsp)
	jg	.L165
	leaq	16(%r12), %rax
	cmpq	%rax, %r15
	jne	.L131
	jmp	.L105
.L121:
	movl	32(%rsp), %edx
	movl	36(%rsp), %esi
	leaq	71(%rsp), %rcx
	movb	$0, 71(%rsp)
	movl	24(%rsp), %edi
	call	_Z14read_only_testI10Tatas_lockEviiiRT_
	jmp	.L119
.L120:
	leaq	112(%rsp), %rdi
	movl	$10, %ecx
	xorl	%eax, %eax
	movl	32(%rsp), %edx
	rep stosl
	movl	36(%rsp), %esi
	movl	24(%rsp), %edi
	leaq	112(%rsp), %rcx
	call	_Z14read_only_testISt5mutexEviiiRT_
.LEHE11:
	jmp	.L119
.L165:
	xorl	%edx, %edx
	movq	%r13, %rcx
	leaq	_ZL16num_threads_flag(%rip), %rdi
	movq	%r15, %rsi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm
	testq	%rax, %rax
	jne	.L110
	movq	16(%rsp), %rax
	movq	48(%rsp), %rdx
	movq	40(%rsp), %rdi
	movq	(%rax,%rbx,8), %rsi
.LEHB12:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE12:
	movq	112(%rsp), %rdx
	movq	strtol@GOTPCREL(%rip), %rdi
	movl	$10, %r8d
	xorl	%ecx, %ecx
	leaq	.LC8(%rip), %rsi
.LEHB13:
	call	_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_
.LEHE13:
	movl	%eax, 24(%rsp)
	movq	112(%rsp), %rdi
	cmpq	56(%rsp), %rdi
	je	.L158
.L154:
	call	_ZdlPv@PLT
.L158:
	movq	80(%rsp), %r15
.L112:
	leaq	16(%r12), %rax
	cmpq	%rax, %r15
	jne	.L131
	jmp	.L117
.L110:
	xorl	%edx, %edx
	movq	%r13, %rcx
	leaq	_ZL10delay_flag(%rip), %rdi
	movq	%r15, %rsi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm
	testq	%rax, %rax
	jne	.L113
	movq	16(%rsp), %rax
	movq	48(%rsp), %rdx
	movq	40(%rsp), %rdi
	movq	(%rax,%rbx,8), %rsi
.LEHB14:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE14:
	movq	112(%rsp), %rdx
	movq	strtol@GOTPCREL(%rip), %rdi
	movl	$10, %r8d
	xorl	%ecx, %ecx
	leaq	.LC8(%rip), %rsi
.LEHB15:
	call	_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_
.LEHE15:
	movl	%eax, 32(%rsp)
	movq	112(%rsp), %rdi
	cmpq	56(%rsp), %rdi
	jne	.L154
	jmp	.L158
.L113:
	xorl	%edx, %edx
	movq	%r13, %rcx
	leaq	_ZL13arr_size_flag(%rip), %rdi
	movq	%r15, %rsi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm
	testq	%rax, %rax
	jne	.L112
	movq	16(%rsp), %rax
	movq	48(%rsp), %rdx
	movq	40(%rsp), %rdi
	movq	(%rax,%rbx,8), %rsi
.LEHB16:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE16:
	movq	112(%rsp), %rdx
	movq	strtol@GOTPCREL(%rip), %rdi
	movl	$10, %r8d
	xorl	%ecx, %ecx
	leaq	.LC8(%rip), %rsi
.LEHB17:
	call	_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_
.LEHE17:
	movl	%eax, 36(%rsp)
	movq	112(%rsp), %rdi
	cmpq	56(%rsp), %rdi
	jne	.L154
	jmp	.L158
.L159:
.LEHB18:
	call	_ZSt16__throw_bad_castv@PLT
.LEHE18:
.L163:
	call	__stack_chk_fail@PLT
.L147:
	movq	%rax, %rbx
	jmp	.L130
.L145:
	movq	%rax, %rbx
	jmp	.L125
.L143:
	movq	%rax, %rbx
	jmp	.L122
.L146:
	movq	%rax, %rbx
	jmp	.L127
.L144:
	movq	%rax, %rbx
	jmp	.L124
	.section	.gcc_except_table
.LLSDA3741:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3741-.LLSDACSB3741
.LLSDACSB3741:
	.uleb128 .LEHB8-.LFB3741
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB9-.LFB3741
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L147-.LFB3741
	.uleb128 0
	.uleb128 .LEHB10-.LFB3741
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB11-.LFB3741
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L147-.LFB3741
	.uleb128 0
	.uleb128 .LEHB12-.LFB3741
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L144-.LFB3741
	.uleb128 0
	.uleb128 .LEHB13-.LFB3741
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L143-.LFB3741
	.uleb128 0
	.uleb128 .LEHB14-.LFB3741
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L144-.LFB3741
	.uleb128 0
	.uleb128 .LEHB15-.LFB3741
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L145-.LFB3741
	.uleb128 0
	.uleb128 .LEHB16-.LFB3741
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L144-.LFB3741
	.uleb128 0
	.uleb128 .LEHB17-.LFB3741
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L146-.LFB3741
	.uleb128 0
	.uleb128 .LEHB18-.LFB3741
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
.LLSDACSE3741:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3741
	.type	main.cold.94, @function
main.cold.94:
.L125:
	.cfi_def_cfa_offset 208
	.cfi_offset 3, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	40(%rsp), %rax
	movq	112(%rsp), %rdi
	addq	$16, %rax
	cmpq	%rax, %rdi
	je	.L124
	call	_ZdlPv@PLT
.L124:
	movq	80(%rsp), %rdi
	addq	$16, %r12
	cmpq	%r12, %rdi
	je	.L130
	call	_ZdlPv@PLT
.L130:
	leaq	72(%rsp), %rdi
	call	_ZN5TimerD1Ev
	movq	%rbx, %rdi
.LEHB19:
	call	_Unwind_Resume@PLT
.LEHE19:
.L127:
	movq	40(%rsp), %rax
	movq	112(%rsp), %rdi
	addq	$16, %rax
	cmpq	%rax, %rdi
	je	.L124
	call	_ZdlPv@PLT
	jmp	.L124
.L122:
	movq	40(%rsp), %rax
	movq	112(%rsp), %rdi
	addq	$16, %rax
	cmpq	%rax, %rdi
	je	.L124
	call	_ZdlPv@PLT
	jmp	.L124
	.cfi_endproc
.LFE3741:
	.section	.gcc_except_table
.LLSDAC3741:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3741-.LLSDACSBC3741
.LLSDACSBC3741:
	.uleb128 .LEHB19-.LCOLDB12
	.uleb128 .LEHE19-.LEHB19
	.uleb128 0
	.uleb128 0
.LLSDACSEC3741:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold.94, .-main.cold.94
.LCOLDE12:
	.section	.text.startup
.LHOTE12:
	.section	.text._ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_,"axG",@progbits,_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_,comdat
	.weak	_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_
	.type	_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_, @function
_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_:
.LFB3808:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3808
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$32, %rsp
	.cfi_def_cfa_offset 80
	movq	%rsi, 8(%rsp)
	movl	%r8d, 4(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	__errno_location@PLT
	movl	4(%rsp), %r8d
	leaq	16(%rsp), %rsi
	movq	%r12, %rdi
	movl	(%rax), %r14d
	movq	%rax, %rbx
	movl	$0, (%rax)
	movl	%r8d, %edx
.LEHB20:
	call	*%r15
	movq	16(%rsp), %rdx
	cmpq	%r12, %rdx
	je	.L183
	movl	(%rbx), %esi
	cmpl	$34, %esi
	je	.L168
	movl	$2147483648, %ecx
	movl	$4294967295, %edi
	addq	%rax, %rcx
	cmpq	%rdi, %rcx
	ja	.L168
	testq	%r13, %r13
	je	.L170
	subq	%r12, %rdx
	movq	%rdx, 0(%r13)
.L170:
	testl	%esi, %esi
	je	.L184
.L166:
	movq	24(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L185
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L184:
	.cfi_restore_state
	movl	%r14d, (%rbx)
	jmp	.L166
.L168:
	movq	8(%rsp), %rdi
	call	_ZSt20__throw_out_of_rangePKc@PLT
.L183:
	movq	8(%rsp), %rdi
	call	_ZSt24__throw_invalid_argumentPKc@PLT
.LEHE20:
.L185:
	call	__stack_chk_fail@PLT
.L175:
.L172:
	cmpl	$0, (%rbx)
	jne	.L173
	movl	%r14d, (%rbx)
.L173:
	movq	%rax, %rdi
.LEHB21:
	call	_Unwind_Resume@PLT
.LEHE21:
	.cfi_endproc
.LFE3808:
	.section	.gcc_except_table
.LLSDA3808:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3808-.LLSDACSB3808
.LLSDACSB3808:
	.uleb128 .LEHB20-.LFB3808
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L175-.LFB3808
	.uleb128 0
	.uleb128 .LEHB21-.LFB3808
	.uleb128 .LEHE21-.LEHB21
	.uleb128 0
	.uleb128 0
.LLSDACSE3808:
	.section	.text._ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_,"axG",@progbits,_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_,comdat
	.size	_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_, .-_ZN9__gnu_cxx6__stoaIlicJiEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED5Ev,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev:
.LFB3885:
	.cfi_startproc
	movq	(%rdi), %rdx
	leaq	16(%rdi), %rax
	cmpq	%rax, %rdx
	je	.L186
	movq	%rdx, %rdi
	jmp	_ZdlPv@PLT
.L186:
	ret
	.cfi_endproc
.LFE3885:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev
	.section	.text._ZNSt6vectorISt6threadSaIS0_EED2Ev,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EED5Ev,comdat
	.align 2
	.weak	_ZNSt6vectorISt6threadSaIS0_EED2Ev
	.type	_ZNSt6vectorISt6threadSaIS0_EED2Ev, @function
_ZNSt6vectorISt6threadSaIS0_EED2Ev:
.LFB4059:
	.cfi_startproc
	movq	8(%rdi), %rdx
	movq	(%rdi), %rdi
	cmpq	%rdi, %rdx
	je	.L189
	cmpq	$0, (%rdi)
	jne	.L190
	movq	%rdi, %rax
	jmp	.L191
.L192:
	cmpq	$0, (%rax)
	jne	.L190
.L191:
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L192
.L193:
	jmp	_ZdlPv@PLT
.L189:
	testq	%rdx, %rdx
	jne	.L193
	ret
.L190:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_ZSt9terminatev@PLT
	.cfi_endproc
.LFE4059:
	.size	_ZNSt6vectorISt6threadSaIS0_EED2Ev, .-_ZNSt6vectorISt6threadSaIS0_EED2Ev
	.weak	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	.set	_ZNSt6vectorISt6threadSaIS0_EED1Ev,_ZNSt6vectorISt6threadSaIS0_EED2Ev
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_:
.LFB4071:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	16(%rdi), %rax
	movq	%rdi, %r12
	movq	$-1, %rdx
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rax, (%rdi)
	testq	%rsi, %rsi
	je	.L198
	movq	%rsi, %rdi
	call	strlen@PLT
	leaq	(%rbx,%rax), %rdx
.L198:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbx, %rsi
	movq	%r12, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.cfi_endproc
.LFE4071:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.section	.rodata
.LC13:
	.string	"arr_size: "
.LC14:
	.string	"num_loops: "
	.section	.text._Z14read_only_testI7No_lockEviiiRT_,"axG",@progbits,_Z14read_only_testI7No_lockEviiiRT_,comdat
	.weak	_Z14read_only_testI7No_lockEviiiRT_
	.type	_Z14read_only_testI7No_lockEviiiRT_, @function
_Z14read_only_testI7No_lockEviiiRT_:
.LFB4082:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4082
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rcx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%esi, %r13d
	leaq	.LC13(%rip), %rsi
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$20192, %rsp
	.cfi_def_cfa_offset 20240
	movl	%edi, 12(%rsp)
	leaq	_ZSt4cout(%rip), %rdi
	movl	%edx, 24(%rsp)
	movl	$10, %edx
	movq	%fs:40, %rax
	movq	%rax, 20184(%rsp)
	xorl	%eax, %eax
.LEHB22:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%r13d, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %rbx
	testq	%rbx, %rbx
	je	.L207
	cmpb	$0, 56(%rbx)
	je	.L205
	movsbl	67(%rbx), %esi
.L206:
	movq	%r14, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movl	$11, %edx
	leaq	.LC14(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	24(%rsp), %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %rbx
	testq	%rbx, %rbx
	je	.L207
	cmpb	$0, 56(%rbx)
	je	.L208
	movsbl	67(%rbx), %esi
.L209:
	movq	%r14, %rdi
	leaq	160(%rsp), %r14
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
.LEHE22:
	movb	$0, 55(%rsp)
	testl	%r13d, %r13d
	jle	.L212
	leal	-1(%r13), %eax
	leaq	4(%r14), %r12
	movq	%r14, %rbx
	leaq	(%r12,%rax,4), %rax
	movq	%rax, 16(%rsp)
	jmp	.L213
.L268:
	addq	$4, %r12
.L213:
	call	rand@PLT
	movl	%eax, (%rbx)
	movq	%r12, %rbx
	cmpq	%r12, 16(%rsp)
	jne	.L268
.L212:
	leaq	55(%rsp), %rax
	xorl	%esi, %esi
	leaq	128(%rsp), %rdx
	movq	$0, 64(%rsp)
	movq	%rax, 16(%rsp)
	movq	%rax, 128(%rsp)
	movl	24(%rsp), %eax
	movq	$0, 72(%rsp)
	movl	%eax, 152(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, %rdi
	movq	%r14, 136(%rsp)
	movq	$0, 80(%rsp)
	movq	%r15, 144(%rsp)
	movl	%r13d, 156(%rsp)
	movq	%rax, 32(%rsp)
.LEHB23:
	call	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	cmpl	$1, 12(%rsp)
	movq	72(%rsp), %rbx
	jle	.L214
	leaq	96(%rsp), %rax
	movl	$1, %r12d
	movq	%rax, 40(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	jmp	.L221
.L269:
	movq	$0, (%rbx)
	movdqa	96(%rsp), %xmm0
	movl	$40, %edi
	movdqa	112(%rsp), %xmm1
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm1, 144(%rsp)
	call	_Znwm@PLT
.LEHE23:
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rcx
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	movdqa	128(%rsp), %xmm2
	movdqa	144(%rsp), %xmm3
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	%rcx, (%rax)
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
	movq	%rax, 56(%rsp)
.LEHB24:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE24:
	movq	56(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L216
	movq	(%rdi), %rax
	call	*8(%rax)
.L216:
	movq	72(%rsp), %rax
	addl	$1, %r12d
	leaq	8(%rax), %rbx
	movq	%rbx, 72(%rsp)
	cmpl	%r12d, 12(%rsp)
	je	.L214
.L221:
	movq	16(%rsp), %rax
	movq	%r14, 104(%rsp)
	movq	%r15, 112(%rsp)
	movq	%rax, 96(%rsp)
	movl	%r13d, 120(%rsp)
	cmpq	%rbx, 80(%rsp)
	jne	.L269
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rdi
	movq	%rbx, %rsi
.LEHB25:
	call	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	movq	72(%rsp), %rbx
	addl	$1, %r12d
	cmpl	%r12d, 12(%rsp)
	jne	.L221
.L214:
	movq	64(%rsp), %r12
	cmpq	%rbx, %r12
	jne	.L233
	jmp	.L222
.L273:
	movl	$36, %edx
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %r15
.L224:
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %r13
	testq	%r13, %r13
	je	.L270
	cmpb	$0, 56(%r13)
	je	.L226
	movsbl	67(%r13), %esi
.L227:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movq	%r12, %rdi
	call	_ZNSt6thread4joinEv@PLT
	movl	$19, %edx
	leaq	.LC5(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	testq	%r14, %r14
	jne	.L228
	movl	$36, %edx
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %r14
.L229:
	movq	(%r14), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %r13
	testq	%r13, %r13
	je	.L271
	cmpb	$0, 56(%r13)
	je	.L231
	movsbl	67(%r13), %esi
.L232:
	movq	%r14, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	addq	$8, %r12
	cmpq	%r12, %rbx
	je	.L272
.L233:
	movl	$19, %edx
	leaq	.LC3(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	(%r12), %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	testq	%r14, %r14
	je	.L273
	movq	%r14, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %r15
	jmp	.L224
.L228:
	movq	%r14, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %r14
	jmp	.L229
.L226:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L227
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L227
.L231:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L232
	movq	%r13, %rdi
	call	*%rax
.LEHE25:
	movsbl	%al, %esi
	jmp	.L232
.L272:
	movq	72(%rsp), %rdx
	movq	64(%rsp), %rbx
	cmpq	%rbx, %rdx
	je	.L222
	cmpq	$0, (%rbx)
	jne	.L235
	movq	%rbx, %rax
	jmp	.L234
.L266:
	cmpq	$0, (%rax)
	jne	.L235
.L234:
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L266
.L236:
	movq	%rbx, %rdi
	call	_ZdlPv@PLT
.L203:
	movq	20184(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L274
	addq	$20192, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L205:
	.cfi_restore_state
	movq	%rbx, %rdi
.LEHB26:
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L206
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L206
.L208:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L209
	movq	%rbx, %rdi
	call	*%rax
.LEHE26:
	movsbl	%al, %esi
	jmp	.L209
.L222:
	testq	%rbx, %rbx
	je	.L203
	jmp	.L236
.L235:
	call	_ZSt9terminatev@PLT
.L270:
.LEHB27:
	call	_ZSt16__throw_bad_castv@PLT
.L271:
	call	_ZSt16__throw_bad_castv@PLT
.LEHE27:
.L207:
.LEHB28:
	call	_ZSt16__throw_bad_castv@PLT
.L274:
	call	__stack_chk_fail@PLT
.L247:
	movq	%rax, %rbx
	jmp	.L220
.L248:
	movq	%rax, %rbx
.L218:
	movq	56(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L220
	movq	(%rdi), %rax
	call	*8(%rax)
.L220:
	movq	32(%rsp), %rdi
	call	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	movq	%rbx, %rdi
	call	_Unwind_Resume@PLT
.LEHE28:
	.cfi_endproc
.LFE4082:
	.section	.gcc_except_table
.LLSDA4082:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4082-.LLSDACSB4082
.LLSDACSB4082:
	.uleb128 .LEHB22-.LFB4082
	.uleb128 .LEHE22-.LEHB22
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB23-.LFB4082
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L247-.LFB4082
	.uleb128 0
	.uleb128 .LEHB24-.LFB4082
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L248-.LFB4082
	.uleb128 0
	.uleb128 .LEHB25-.LFB4082
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L247-.LFB4082
	.uleb128 0
	.uleb128 .LEHB26-.LFB4082
	.uleb128 .LEHE26-.LEHB26
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB27-.LFB4082
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L247-.LFB4082
	.uleb128 0
	.uleb128 .LEHB28-.LFB4082
	.uleb128 .LEHE28-.LEHB28
	.uleb128 0
	.uleb128 0
.LLSDACSE4082:
	.section	.text._Z14read_only_testI7No_lockEviiiRT_,"axG",@progbits,_Z14read_only_testI7No_lockEviiiRT_,comdat
	.size	_Z14read_only_testI7No_lockEviiiRT_, .-_Z14read_only_testI7No_lockEviiiRT_
	.section	.text._Z14read_only_testISt5mutexEviiiRT_,"axG",@progbits,_Z14read_only_testISt5mutexEviiiRT_,comdat
	.weak	_Z14read_only_testISt5mutexEviiiRT_
	.type	_Z14read_only_testISt5mutexEviiiRT_, @function
_Z14read_only_testISt5mutexEviiiRT_:
.LFB4085:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4085
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rcx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%esi, %r13d
	leaq	.LC13(%rip), %rsi
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$20192, %rsp
	.cfi_def_cfa_offset 20240
	movl	%edi, 12(%rsp)
	leaq	_ZSt4cout(%rip), %rdi
	movl	%edx, 24(%rsp)
	movl	$10, %edx
	movq	%fs:40, %rax
	movq	%rax, 20184(%rsp)
	xorl	%eax, %eax
.LEHB29:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%r13d, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %rbx
	testq	%rbx, %rbx
	je	.L279
	cmpb	$0, 56(%rbx)
	je	.L277
	movsbl	67(%rbx), %esi
.L278:
	movq	%r14, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movl	$11, %edx
	leaq	.LC14(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	24(%rsp), %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %rbx
	testq	%rbx, %rbx
	je	.L279
	cmpb	$0, 56(%rbx)
	je	.L280
	movsbl	67(%rbx), %esi
.L281:
	movq	%r14, %rdi
	leaq	160(%rsp), %r14
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
.LEHE29:
	movb	$0, 55(%rsp)
	testl	%r13d, %r13d
	jle	.L284
	leal	-1(%r13), %eax
	leaq	4(%r14), %r12
	movq	%r14, %rbx
	leaq	(%r12,%rax,4), %rax
	movq	%rax, 16(%rsp)
	jmp	.L285
.L340:
	addq	$4, %r12
.L285:
	call	rand@PLT
	movl	%eax, (%rbx)
	movq	%r12, %rbx
	cmpq	%r12, 16(%rsp)
	jne	.L340
.L284:
	leaq	55(%rsp), %rax
	xorl	%esi, %esi
	leaq	128(%rsp), %rdx
	movq	$0, 64(%rsp)
	movq	%rax, 16(%rsp)
	movq	%rax, 128(%rsp)
	movl	24(%rsp), %eax
	movq	$0, 72(%rsp)
	movl	%eax, 152(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, %rdi
	movq	%r14, 136(%rsp)
	movq	$0, 80(%rsp)
	movq	%r15, 144(%rsp)
	movl	%r13d, 156(%rsp)
	movq	%rax, 32(%rsp)
.LEHB30:
	call	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	cmpl	$1, 12(%rsp)
	movq	72(%rsp), %rbx
	jle	.L286
	leaq	96(%rsp), %rax
	movl	$1, %r12d
	movq	%rax, 40(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	jmp	.L293
.L341:
	movq	$0, (%rbx)
	movdqa	96(%rsp), %xmm0
	movl	$40, %edi
	movdqa	112(%rsp), %xmm1
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm1, 144(%rsp)
	call	_Znwm@PLT
.LEHE30:
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE(%rip), %rcx
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	movdqa	128(%rsp), %xmm2
	movdqa	144(%rsp), %xmm3
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	%rcx, (%rax)
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
	movq	%rax, 56(%rsp)
.LEHB31:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE31:
	movq	56(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L288
	movq	(%rdi), %rax
	call	*8(%rax)
.L288:
	movq	72(%rsp), %rax
	addl	$1, %r12d
	leaq	8(%rax), %rbx
	movq	%rbx, 72(%rsp)
	cmpl	%r12d, 12(%rsp)
	je	.L286
.L293:
	movq	16(%rsp), %rax
	movq	%r14, 104(%rsp)
	movq	%r15, 112(%rsp)
	movq	%rax, 96(%rsp)
	movl	%r13d, 120(%rsp)
	cmpq	%rbx, 80(%rsp)
	jne	.L341
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rdi
	movq	%rbx, %rsi
.LEHB32:
	call	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	movq	72(%rsp), %rbx
	addl	$1, %r12d
	cmpl	%r12d, 12(%rsp)
	jne	.L293
.L286:
	movq	64(%rsp), %r12
	cmpq	%rbx, %r12
	jne	.L305
	jmp	.L294
.L345:
	movl	$36, %edx
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %r15
.L296:
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %r13
	testq	%r13, %r13
	je	.L342
	cmpb	$0, 56(%r13)
	je	.L298
	movsbl	67(%r13), %esi
.L299:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movq	%r12, %rdi
	call	_ZNSt6thread4joinEv@PLT
	movl	$19, %edx
	leaq	.LC5(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	testq	%r14, %r14
	jne	.L300
	movl	$36, %edx
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %r14
.L301:
	movq	(%r14), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %r13
	testq	%r13, %r13
	je	.L343
	cmpb	$0, 56(%r13)
	je	.L303
	movsbl	67(%r13), %esi
.L304:
	movq	%r14, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	addq	$8, %r12
	cmpq	%r12, %rbx
	je	.L344
.L305:
	movl	$19, %edx
	leaq	.LC3(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	(%r12), %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	testq	%r14, %r14
	je	.L345
	movq	%r14, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %r15
	jmp	.L296
.L300:
	movq	%r14, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %r14
	jmp	.L301
.L298:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L299
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L299
.L303:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L304
	movq	%r13, %rdi
	call	*%rax
.LEHE32:
	movsbl	%al, %esi
	jmp	.L304
.L344:
	movq	72(%rsp), %rdx
	movq	64(%rsp), %rbx
	cmpq	%rbx, %rdx
	je	.L294
	cmpq	$0, (%rbx)
	jne	.L307
	movq	%rbx, %rax
	jmp	.L306
.L338:
	cmpq	$0, (%rax)
	jne	.L307
.L306:
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L338
.L308:
	movq	%rbx, %rdi
	call	_ZdlPv@PLT
.L275:
	movq	20184(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L346
	addq	$20192, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L277:
	.cfi_restore_state
	movq	%rbx, %rdi
.LEHB33:
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L278
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L278
.L280:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L281
	movq	%rbx, %rdi
	call	*%rax
.LEHE33:
	movsbl	%al, %esi
	jmp	.L281
.L294:
	testq	%rbx, %rbx
	je	.L275
	jmp	.L308
.L307:
	call	_ZSt9terminatev@PLT
.L342:
.LEHB34:
	call	_ZSt16__throw_bad_castv@PLT
.L343:
	call	_ZSt16__throw_bad_castv@PLT
.LEHE34:
.L279:
.LEHB35:
	call	_ZSt16__throw_bad_castv@PLT
.L346:
	call	__stack_chk_fail@PLT
.L319:
	movq	%rax, %rbx
	jmp	.L292
.L320:
	movq	%rax, %rbx
.L290:
	movq	56(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L292
	movq	(%rdi), %rax
	call	*8(%rax)
.L292:
	movq	32(%rsp), %rdi
	call	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	movq	%rbx, %rdi
	call	_Unwind_Resume@PLT
.LEHE35:
	.cfi_endproc
.LFE4085:
	.section	.gcc_except_table
.LLSDA4085:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4085-.LLSDACSB4085
.LLSDACSB4085:
	.uleb128 .LEHB29-.LFB4085
	.uleb128 .LEHE29-.LEHB29
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB30-.LFB4085
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L319-.LFB4085
	.uleb128 0
	.uleb128 .LEHB31-.LFB4085
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L320-.LFB4085
	.uleb128 0
	.uleb128 .LEHB32-.LFB4085
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L319-.LFB4085
	.uleb128 0
	.uleb128 .LEHB33-.LFB4085
	.uleb128 .LEHE33-.LEHB33
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB34-.LFB4085
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L319-.LFB4085
	.uleb128 0
	.uleb128 .LEHB35-.LFB4085
	.uleb128 .LEHE35-.LEHB35
	.uleb128 0
	.uleb128 0
.LLSDACSE4085:
	.section	.text._Z14read_only_testISt5mutexEviiiRT_,"axG",@progbits,_Z14read_only_testISt5mutexEviiiRT_,comdat
	.size	_Z14read_only_testISt5mutexEviiiRT_, .-_Z14read_only_testISt5mutexEviiiRT_
	.section	.text._Z14read_only_testI10Tatas_lockEviiiRT_,"axG",@progbits,_Z14read_only_testI10Tatas_lockEviiiRT_,comdat
	.weak	_Z14read_only_testI10Tatas_lockEviiiRT_
	.type	_Z14read_only_testI10Tatas_lockEviiiRT_, @function
_Z14read_only_testI10Tatas_lockEviiiRT_:
.LFB4088:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4088
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rcx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%esi, %r13d
	leaq	.LC13(%rip), %rsi
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$20192, %rsp
	.cfi_def_cfa_offset 20240
	movl	%edi, 12(%rsp)
	leaq	_ZSt4cout(%rip), %rdi
	movl	%edx, 24(%rsp)
	movl	$10, %edx
	movq	%fs:40, %rax
	movq	%rax, 20184(%rsp)
	xorl	%eax, %eax
.LEHB36:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%r13d, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %rbx
	testq	%rbx, %rbx
	je	.L351
	cmpb	$0, 56(%rbx)
	je	.L349
	movsbl	67(%rbx), %esi
.L350:
	movq	%r14, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movl	$11, %edx
	leaq	.LC14(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	24(%rsp), %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %rbx
	testq	%rbx, %rbx
	je	.L351
	cmpb	$0, 56(%rbx)
	je	.L352
	movsbl	67(%rbx), %esi
.L353:
	movq	%r14, %rdi
	leaq	160(%rsp), %r14
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
.LEHE36:
	movb	$0, 55(%rsp)
	testl	%r13d, %r13d
	jle	.L356
	leal	-1(%r13), %eax
	leaq	4(%r14), %r12
	movq	%r14, %rbx
	leaq	(%r12,%rax,4), %rax
	movq	%rax, 16(%rsp)
	jmp	.L357
.L412:
	addq	$4, %r12
.L357:
	call	rand@PLT
	movl	%eax, (%rbx)
	movq	%r12, %rbx
	cmpq	%r12, 16(%rsp)
	jne	.L412
.L356:
	leaq	55(%rsp), %rax
	xorl	%esi, %esi
	leaq	128(%rsp), %rdx
	movq	$0, 64(%rsp)
	movq	%rax, 16(%rsp)
	movq	%rax, 128(%rsp)
	movl	24(%rsp), %eax
	movq	$0, 72(%rsp)
	movl	%eax, 152(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, %rdi
	movq	%r14, 136(%rsp)
	movq	$0, 80(%rsp)
	movq	%r15, 144(%rsp)
	movl	%r13d, 156(%rsp)
	movq	%rax, 32(%rsp)
.LEHB37:
	call	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	cmpl	$1, 12(%rsp)
	movq	72(%rsp), %rbx
	jle	.L358
	leaq	96(%rsp), %rax
	movl	$1, %r12d
	movq	%rax, 40(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	jmp	.L365
.L413:
	movq	$0, (%rbx)
	movdqa	96(%rsp), %xmm0
	movl	$40, %edi
	movdqa	112(%rsp), %xmm1
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm1, 144(%rsp)
	call	_Znwm@PLT
.LEHE37:
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rcx
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	movdqa	128(%rsp), %xmm2
	movdqa	144(%rsp), %xmm3
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	%rcx, (%rax)
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
	movq	%rax, 56(%rsp)
.LEHB38:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE38:
	movq	56(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L360
	movq	(%rdi), %rax
	call	*8(%rax)
.L360:
	movq	72(%rsp), %rax
	addl	$1, %r12d
	leaq	8(%rax), %rbx
	movq	%rbx, 72(%rsp)
	cmpl	%r12d, 12(%rsp)
	je	.L358
.L365:
	movq	16(%rsp), %rax
	movq	%r14, 104(%rsp)
	movq	%r15, 112(%rsp)
	movq	%rax, 96(%rsp)
	movl	%r13d, 120(%rsp)
	cmpq	%rbx, 80(%rsp)
	jne	.L413
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rdi
	movq	%rbx, %rsi
.LEHB39:
	call	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	movq	72(%rsp), %rbx
	addl	$1, %r12d
	cmpl	%r12d, 12(%rsp)
	jne	.L365
.L358:
	movq	64(%rsp), %r12
	cmpq	%rbx, %r12
	jne	.L377
	jmp	.L366
.L417:
	movl	$36, %edx
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %r15
.L368:
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %r13
	testq	%r13, %r13
	je	.L414
	cmpb	$0, 56(%r13)
	je	.L370
	movsbl	67(%r13), %esi
.L371:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movq	%r12, %rdi
	call	_ZNSt6thread4joinEv@PLT
	movl	$19, %edx
	leaq	.LC5(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	testq	%r14, %r14
	jne	.L372
	movl	$36, %edx
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %r14
.L373:
	movq	(%r14), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %r13
	testq	%r13, %r13
	je	.L415
	cmpb	$0, 56(%r13)
	je	.L375
	movsbl	67(%r13), %esi
.L376:
	movq	%r14, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	addq	$8, %r12
	cmpq	%r12, %rbx
	je	.L416
.L377:
	movl	$19, %edx
	leaq	.LC3(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	(%r12), %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	testq	%r14, %r14
	je	.L417
	movq	%r14, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %r15
	jmp	.L368
.L372:
	movq	%r14, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %r14
	jmp	.L373
.L370:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L371
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L371
.L375:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L376
	movq	%r13, %rdi
	call	*%rax
.LEHE39:
	movsbl	%al, %esi
	jmp	.L376
.L416:
	movq	72(%rsp), %rdx
	movq	64(%rsp), %rbx
	cmpq	%rbx, %rdx
	je	.L366
	cmpq	$0, (%rbx)
	jne	.L379
	movq	%rbx, %rax
	jmp	.L378
.L410:
	cmpq	$0, (%rax)
	jne	.L379
.L378:
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L410
.L380:
	movq	%rbx, %rdi
	call	_ZdlPv@PLT
.L347:
	movq	20184(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L418
	addq	$20192, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L349:
	.cfi_restore_state
	movq	%rbx, %rdi
.LEHB40:
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L350
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L350
.L352:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L353
	movq	%rbx, %rdi
	call	*%rax
.LEHE40:
	movsbl	%al, %esi
	jmp	.L353
.L366:
	testq	%rbx, %rbx
	je	.L347
	jmp	.L380
.L379:
	call	_ZSt9terminatev@PLT
.L414:
.LEHB41:
	call	_ZSt16__throw_bad_castv@PLT
.L415:
	call	_ZSt16__throw_bad_castv@PLT
.LEHE41:
.L351:
.LEHB42:
	call	_ZSt16__throw_bad_castv@PLT
.L418:
	call	__stack_chk_fail@PLT
.L391:
	movq	%rax, %rbx
	jmp	.L364
.L392:
	movq	%rax, %rbx
.L362:
	movq	56(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L364
	movq	(%rdi), %rax
	call	*8(%rax)
.L364:
	movq	32(%rsp), %rdi
	call	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	movq	%rbx, %rdi
	call	_Unwind_Resume@PLT
.LEHE42:
	.cfi_endproc
.LFE4088:
	.section	.gcc_except_table
.LLSDA4088:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4088-.LLSDACSB4088
.LLSDACSB4088:
	.uleb128 .LEHB36-.LFB4088
	.uleb128 .LEHE36-.LEHB36
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB37-.LFB4088
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L391-.LFB4088
	.uleb128 0
	.uleb128 .LEHB38-.LFB4088
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L392-.LFB4088
	.uleb128 0
	.uleb128 .LEHB39-.LFB4088
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L391-.LFB4088
	.uleb128 0
	.uleb128 .LEHB40-.LFB4088
	.uleb128 .LEHE40-.LEHB40
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB41-.LFB4088
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L391-.LFB4088
	.uleb128 0
	.uleb128 .LEHB42-.LFB4088
	.uleb128 .LEHE42-.LEHB42
	.uleb128 0
	.uleb128 0
.LLSDACSE4088:
	.section	.text._Z14read_only_testI10Tatas_lockEviiiRT_,"axG",@progbits,_Z14read_only_testI10Tatas_lockEviiiRT_,comdat
	.size	_Z14read_only_testI10Tatas_lockEviiiRT_, .-_Z14read_only_testI10Tatas_lockEviiiRT_
	.section	.text._Z14read_only_testI7Rw_lockEviiiRT_,"axG",@progbits,_Z14read_only_testI7Rw_lockEviiiRT_,comdat
	.weak	_Z14read_only_testI7Rw_lockEviiiRT_
	.type	_Z14read_only_testI7Rw_lockEviiiRT_, @function
_Z14read_only_testI7Rw_lockEviiiRT_:
.LFB4091:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4091
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rcx, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%esi, %r13d
	leaq	.LC13(%rip), %rsi
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$20192, %rsp
	.cfi_def_cfa_offset 20240
	movl	%edi, 12(%rsp)
	leaq	_ZSt4cout(%rip), %rdi
	movl	%edx, 24(%rsp)
	movl	$10, %edx
	movq	%fs:40, %rax
	movq	%rax, 20184(%rsp)
	xorl	%eax, %eax
.LEHB43:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%r13d, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %rbx
	testq	%rbx, %rbx
	je	.L423
	cmpb	$0, 56(%rbx)
	je	.L421
	movsbl	67(%rbx), %esi
.L422:
	movq	%r14, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movl	$11, %edx
	leaq	.LC14(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	24(%rsp), %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %rbx
	testq	%rbx, %rbx
	je	.L423
	cmpb	$0, 56(%rbx)
	je	.L424
	movsbl	67(%rbx), %esi
.L425:
	movq	%r14, %rdi
	leaq	160(%rsp), %r14
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
.LEHE43:
	movb	$0, 55(%rsp)
	testl	%r13d, %r13d
	jle	.L428
	leal	-1(%r13), %eax
	leaq	4(%r14), %r12
	movq	%r14, %rbx
	leaq	(%r12,%rax,4), %rax
	movq	%rax, 16(%rsp)
	jmp	.L429
.L484:
	addq	$4, %r12
.L429:
	call	rand@PLT
	movl	%eax, (%rbx)
	movq	%r12, %rbx
	cmpq	%r12, 16(%rsp)
	jne	.L484
.L428:
	leaq	55(%rsp), %rax
	xorl	%esi, %esi
	leaq	128(%rsp), %rdx
	movq	$0, 64(%rsp)
	movq	%rax, 16(%rsp)
	movq	%rax, 128(%rsp)
	movl	24(%rsp), %eax
	movq	$0, 72(%rsp)
	movl	%eax, 152(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, %rdi
	movq	%r14, 136(%rsp)
	movq	$0, 80(%rsp)
	movq	%r15, 144(%rsp)
	movl	%r13d, 156(%rsp)
	movq	%rax, 32(%rsp)
.LEHB44:
	call	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	cmpl	$1, 12(%rsp)
	movq	72(%rsp), %rbx
	jle	.L430
	leaq	96(%rsp), %rax
	movl	$1, %r12d
	movq	%rax, 40(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 24(%rsp)
	jmp	.L437
.L485:
	movq	$0, (%rbx)
	movdqa	96(%rsp), %xmm0
	movl	$40, %edi
	movdqa	112(%rsp), %xmm1
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm1, 144(%rsp)
	call	_Znwm@PLT
.LEHE44:
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rcx
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	movdqa	128(%rsp), %xmm2
	movdqa	144(%rsp), %xmm3
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	%rcx, (%rax)
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
	movq	%rax, 56(%rsp)
.LEHB45:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE45:
	movq	56(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L432
	movq	(%rdi), %rax
	call	*8(%rax)
.L432:
	movq	72(%rsp), %rax
	addl	$1, %r12d
	leaq	8(%rax), %rbx
	movq	%rbx, 72(%rsp)
	cmpl	%r12d, 12(%rsp)
	je	.L430
.L437:
	movq	16(%rsp), %rax
	movq	%r14, 104(%rsp)
	movq	%r15, 112(%rsp)
	movq	%rax, 96(%rsp)
	movl	%r13d, 120(%rsp)
	cmpq	%rbx, 80(%rsp)
	jne	.L485
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rdi
	movq	%rbx, %rsi
.LEHB46:
	call	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	movq	72(%rsp), %rbx
	addl	$1, %r12d
	cmpl	%r12d, 12(%rsp)
	jne	.L437
.L430:
	movq	64(%rsp), %r12
	cmpq	%rbx, %r12
	jne	.L449
	jmp	.L438
.L489:
	movl	$36, %edx
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %r15
.L440:
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %r13
	testq	%r13, %r13
	je	.L486
	cmpb	$0, 56(%r13)
	je	.L442
	movsbl	67(%r13), %esi
.L443:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movq	%r12, %rdi
	call	_ZNSt6thread4joinEv@PLT
	movl	$19, %edx
	leaq	.LC5(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	testq	%r14, %r14
	jne	.L444
	movl	$36, %edx
	leaq	.LC4(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %r14
.L445:
	movq	(%r14), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %r13
	testq	%r13, %r13
	je	.L487
	cmpb	$0, 56(%r13)
	je	.L447
	movsbl	67(%r13), %esi
.L448:
	movq	%r14, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	addq	$8, %r12
	cmpq	%r12, %rbx
	je	.L488
.L449:
	movl	$19, %edx
	leaq	.LC3(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movq	(%r12), %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	testq	%r14, %r14
	je	.L489
	movq	%r14, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %r15
	jmp	.L440
.L444:
	movq	%r14, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertImEERSoT_@PLT
	movq	%rax, %r14
	jmp	.L445
.L442:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L443
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L443
.L447:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L448
	movq	%r13, %rdi
	call	*%rax
.LEHE46:
	movsbl	%al, %esi
	jmp	.L448
.L488:
	movq	72(%rsp), %rdx
	movq	64(%rsp), %rbx
	cmpq	%rbx, %rdx
	je	.L438
	cmpq	$0, (%rbx)
	jne	.L451
	movq	%rbx, %rax
	jmp	.L450
.L482:
	cmpq	$0, (%rax)
	jne	.L451
.L450:
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L482
.L452:
	movq	%rbx, %rdi
	call	_ZdlPv@PLT
.L419:
	movq	20184(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L490
	addq	$20192, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L421:
	.cfi_restore_state
	movq	%rbx, %rdi
.LEHB47:
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L422
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L422
.L424:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L425
	movq	%rbx, %rdi
	call	*%rax
.LEHE47:
	movsbl	%al, %esi
	jmp	.L425
.L438:
	testq	%rbx, %rbx
	je	.L419
	jmp	.L452
.L451:
	call	_ZSt9terminatev@PLT
.L486:
.LEHB48:
	call	_ZSt16__throw_bad_castv@PLT
.L487:
	call	_ZSt16__throw_bad_castv@PLT
.LEHE48:
.L423:
.LEHB49:
	call	_ZSt16__throw_bad_castv@PLT
.L490:
	call	__stack_chk_fail@PLT
.L463:
	movq	%rax, %rbx
	jmp	.L436
.L464:
	movq	%rax, %rbx
.L434:
	movq	56(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L436
	movq	(%rdi), %rax
	call	*8(%rax)
.L436:
	movq	32(%rsp), %rdi
	call	_ZNSt6vectorISt6threadSaIS0_EED1Ev
	movq	%rbx, %rdi
	call	_Unwind_Resume@PLT
.LEHE49:
	.cfi_endproc
.LFE4091:
	.section	.gcc_except_table
.LLSDA4091:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4091-.LLSDACSB4091
.LLSDACSB4091:
	.uleb128 .LEHB43-.LFB4091
	.uleb128 .LEHE43-.LEHB43
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB44-.LFB4091
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L463-.LFB4091
	.uleb128 0
	.uleb128 .LEHB45-.LFB4091
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L464-.LFB4091
	.uleb128 0
	.uleb128 .LEHB46-.LFB4091
	.uleb128 .LEHE46-.LEHB46
	.uleb128 .L463-.LFB4091
	.uleb128 0
	.uleb128 .LEHB47-.LFB4091
	.uleb128 .LEHE47-.LEHB47
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB48-.LFB4091
	.uleb128 .LEHE48-.LEHB48
	.uleb128 .L463-.LFB4091
	.uleb128 0
	.uleb128 .LEHB49-.LFB4091
	.uleb128 .LEHE49-.LEHB49
	.uleb128 0
	.uleb128 0
.LLSDACSE4091:
	.section	.text._Z14read_only_testI7Rw_lockEviiiRT_,"axG",@progbits,_Z14read_only_testI7Rw_lockEviiiRT_,comdat
	.size	_Z14read_only_testI7Rw_lockEviiiRT_, .-_Z14read_only_testI7Rw_lockEviiiRT_
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRFviERiEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRFviERiEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRFviERiEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRFviERiEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRFviERiEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB4184:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4184
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	8(%rdi), %rbx
	movq	(%rdi), %r13
	movq	%rdx, 24(%rsp)
	movq	%rsi, %rdx
	subq	%r13, %rdx
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rax
	subq	%r13, %rax
	sarq	$3, %rax
	je	.L517
	leaq	(%rax,%rax), %rdi
	movq	%rdi, (%rsp)
	cmpq	%rdi, %rax
	jbe	.L539
	movabsq	$2305843009213693951, %rax
	movq	$-8, %rdi
	movq	%rax, (%rsp)
.L493:
	movq	%rcx, 16(%rsp)
	movq	%rdx, 8(%rsp)
.LEHB50:
	call	_Znwm@PLT
.LEHE50:
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	%rax, %r15
.L494:
	leaq	(%r15,%rdx), %rax
	movl	(%rcx), %esi
	movl	$24, %edi
	movq	$0, (%rax)
	movq	%rax, 8(%rsp)
	movl	%esi, 16(%rsp)
.LEHB51:
	call	_Znwm@PLT
.LEHE51:
	movl	16(%rsp), %esi
	movq	8(%rsp), %rdi
	movq	%rax, 32(%rsp)
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE(%rip), %rcx
	movq	%rcx, (%rax)
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movl	%esi, 8(%rax)
	movq	24(%rsp), %rsi
	movq	%rsi, 16(%rax)
	leaq	32(%rsp), %rsi
.LEHB52:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE52:
	movq	32(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L495
	movq	(%rdi), %rax
	call	*8(%rax)
.L495:
	movq	%r13, %rax
	movq	%r15, %rdx
	movq	%r15, %rsi
	cmpq	%r13, %r12
	je	.L497
.L501:
	movq	$0, (%rdx)
	movq	(%rax), %rcx
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	movq	$0, -8(%rax)
	cmpq	%rax, %r12
	jne	.L501
	leaq	-8(%r12), %rax
	subq	%r13, %rax
	shrq	$3, %rax
	leaq	8(%r15,%rax,8), %rsi
.L497:
	addq	$8, %rsi
	movq	%r12, %rax
	movq	%rsi, %rdx
	cmpq	%rbx, %r12
	je	.L506
.L505:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	cmpq	%rax, %rbx
	jne	.L505
	movq	%rbx, %rax
	subq	%r12, %rax
	subq	$8, %rax
	shrq	$3, %rax
	leaq	8(%rsi,%rax,8), %rsi
.L506:
	cmpq	%rbx, %r13
	je	.L540
	cmpq	$0, 0(%r13)
	jne	.L508
	movq	%r13, %rax
	jmp	.L507
.L510:
	cmpq	$0, (%rax)
	jne	.L508
.L507:
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L510
.L512:
	movq	%r13, %rdi
	movq	%rsi, 8(%rsp)
	call	_ZdlPv@PLT
	movq	8(%rsp), %rsi
.L511:
	movq	(%rsp), %rax
	movq	%r15, (%r14)
	movq	%rsi, 8(%r14)
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 16(%r14)
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L541
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L539:
	.cfi_restore_state
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdi
	jbe	.L542
	movq	$-8, %rdi
	movq	%rax, (%rsp)
	jmp	.L493
.L540:
	testq	%r13, %r13
	je	.L511
	jmp	.L512
.L517:
	movq	$1, (%rsp)
.L492:
	movq	(%rsp), %rax
	leaq	0(,%rax,8), %rdi
	jmp	.L493
.L542:
	xorl	%r15d, %r15d
	testq	%rdi, %rdi
	je	.L494
	jmp	.L492
.L498:
	movq	32(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L499
	movq	(%rdi), %rax
	call	*8(%rax)
.L499:
	movq	%rbx, %rax
.L500:
	movq	%rax, %rdi
	call	__cxa_begin_catch@PLT
	testq	%r15, %r15
	jne	.L513
	movq	8(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L515
.L508:
	call	_ZSt9terminatev@PLT
.L541:
	call	__stack_chk_fail@PLT
.L522:
	jmp	.L500
.L524:
	movq	%rax, %rbx
	jmp	.L498
.L513:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L515:
.LEHB53:
	call	__cxa_rethrow@PLT
.LEHE53:
.L523:
	movq	%rax, %rbx
.L514:
	call	__cxa_end_catch@PLT
	movq	%rbx, %rdi
.LEHB54:
	call	_Unwind_Resume@PLT
.LEHE54:
	.cfi_endproc
.LFE4184:
	.section	.gcc_except_table
	.align 4
.LLSDA4184:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT4184-.LLSDATTD4184
.LLSDATTD4184:
	.byte	0x1
	.uleb128 .LLSDACSE4184-.LLSDACSB4184
.LLSDACSB4184:
	.uleb128 .LEHB50-.LFB4184
	.uleb128 .LEHE50-.LEHB50
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB51-.LFB4184
	.uleb128 .LEHE51-.LEHB51
	.uleb128 .L522-.LFB4184
	.uleb128 0x1
	.uleb128 .LEHB52-.LFB4184
	.uleb128 .LEHE52-.LEHB52
	.uleb128 .L524-.LFB4184
	.uleb128 0x3
	.uleb128 .LEHB53-.LFB4184
	.uleb128 .LEHE53-.LEHB53
	.uleb128 .L523-.LFB4184
	.uleb128 0
	.uleb128 .LEHB54-.LFB4184
	.uleb128 .LEHE54-.LEHB54
	.uleb128 0
	.uleb128 0
.LLSDACSE4184:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT4184:
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRFviERiEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRFviERiEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRFviERiEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJRFviERiEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.text._ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm,"axG",@progbits,_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm,comdat
	.align 2
	.weak	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm
	.type	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm, @function
_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm:
.LFB4192:
	.cfi_startproc
	movq	8(%rdi), %r8
	testq	%rcx, %rcx
	je	.L558
	movq	$-1, %rax
	cmpq	%rdx, %r8
	jbe	.L555
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	(%rdi), %rbx
	movzbl	(%rsi), %r14d
	leaq	(%rbx,%r8), %r15
	subq	%rdx, %r8
	leaq	(%rbx,%rdx), %rdi
	movq	%rbx, 8(%rsp)
	movq	%r8, %rdx
	cmpq	%r8, %rcx
	ja	.L543
	movl	$1, %r12d
	movsbl	%r14b, %eax
	movq	%rcx, %rbx
	movq	%rsi, %r13
	subq	%rcx, %r12
	movl	%eax, 4(%rsp)
	jmp	.L547
.L560:
	movl	4(%rsp), %esi
	call	memchr@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L552
	movq	%rbx, %rdx
	movq	%r13, %rsi
	movq	%rax, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	je	.L559
	leaq	1(%r14), %rdi
	movq	%r15, %rdx
	subq	%rdi, %rdx
	cmpq	%rdx, %rbx
	ja	.L552
.L547:
	addq	%r12, %rdx
	jne	.L560
.L552:
	movq	$-1, %rax
.L543:
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L558:
	.cfi_restore 3
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	cmpq	%rdx, %r8
	movq	$-1, %rax
	cmovnb	%rdx, %rax
	ret
.L555:
	ret
.L559:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	%r14, %rax
	subq	8(%rsp), %rax
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4192:
	.size	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm, .-_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm
	.text
	.type	_Z3sumI7No_lockEiPiiRT_, @function
_Z3sumI7No_lockEiPiiRT_:
.LFB4193:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
.L563:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.L562
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
	jmp	.L563
.L562:
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4193:
	.size	_Z3sumI7No_lockEiPiiRT_, .-_Z3sumI7No_lockEiPiiRT_
	.type	_Z3sumISt5mutexEiPiiRT_, @function
_Z3sumISt5mutexEiPiiRT_:
.LFB4198:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt5mutex4lockEv
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
.L567:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.L566
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
	jmp	.L567
.L566:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt5mutex6unlockEv
	movl	-8(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4198:
	.size	_Z3sumISt5mutexEiPiiRT_, .-_Z3sumISt5mutexEiPiiRT_
	.type	_Z3sumI10Tatas_lockEiPiiRT_, @function
_Z3sumI10Tatas_lockEiPiiRT_:
.LFB4203:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN10Tatas_lock4lockEv
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
.L571:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.L570
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
	jmp	.L571
.L570:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN10Tatas_lock6unlockEv
	movl	-8(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4203:
	.size	_Z3sumI10Tatas_lockEiPiiRT_, .-_Z3sumI10Tatas_lockEiPiiRT_
	.type	_Z3sumI7Rw_lockEiPiiRT_, @function
_Z3sumI7Rw_lockEiPiiRT_:
.LFB4208:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7Rw_lock4lockEv
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
.L575:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.L574
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
	jmp	.L575
.L574:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7Rw_lock6unlockEv
	movl	-8(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4208:
	.size	_Z3sumI7Rw_lockEiPiiRT_, .-_Z3sumI7Rw_lockEiPiiRT_
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB4285:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4285
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	8(%rdi), %rbx
	movq	(%rdi), %r13
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rax
	subq	%r13, %rcx
	subq	%r13, %rax
	sarq	$3, %rax
	je	.L603
	leaq	(%rax,%rax), %rdi
	movq	%rdi, 8(%rsp)
	cmpq	%rdi, %rax
	jbe	.L625
	movabsq	$2305843009213693951, %rax
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
.L579:
	movq	%rdx, 24(%rsp)
	movq	%rcx, 16(%rsp)
.LEHB55:
	call	_Znwm@PLT
.LEHE55:
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rcx
	movq	%rax, %r15
.L580:
	leaq	(%r15,%rcx), %rax
	movdqu	(%rdx), %xmm0
	movdqu	16(%rdx), %xmm1
	movl	$40, %edi
	movq	$0, (%rax)
	movq	%rax, 16(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm1, 64(%rsp)
.LEHB56:
	call	_Znwm@PLT
.LEHE56:
	movdqa	48(%rsp), %xmm2
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE(%rip), %rsi
	movdqa	64(%rsp), %xmm3
	movq	%rax, 40(%rsp)
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	16(%rsp), %rdi
	movq	%rsi, (%rax)
	leaq	40(%rsp), %rsi
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
.LEHB57:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE57:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L581
	movq	(%rdi), %rax
	call	*8(%rax)
.L581:
	movq	%r13, %rax
	movq	%r15, %rdx
	movq	%r15, %rsi
	cmpq	%r13, %r12
	je	.L583
.L587:
	movq	$0, (%rdx)
	movq	(%rax), %rcx
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	movq	$0, -8(%rax)
	cmpq	%rax, %r12
	jne	.L587
	leaq	-8(%r12), %rax
	subq	%r13, %rax
	shrq	$3, %rax
	leaq	8(%r15,%rax,8), %rsi
.L583:
	addq	$8, %rsi
	movq	%r12, %rax
	movq	%rsi, %rdx
	cmpq	%rbx, %r12
	je	.L592
.L591:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	cmpq	%rax, %rbx
	jne	.L591
	movq	%rbx, %rax
	subq	%r12, %rax
	subq	$8, %rax
	shrq	$3, %rax
	leaq	8(%rsi,%rax,8), %rsi
.L592:
	cmpq	%rbx, %r13
	je	.L626
	cmpq	$0, 0(%r13)
	jne	.L594
	movq	%r13, %rax
	jmp	.L593
.L596:
	cmpq	$0, (%rax)
	jne	.L594
.L593:
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L596
.L598:
	movq	%r13, %rdi
	movq	%rsi, 16(%rsp)
	call	_ZdlPv@PLT
	movq	16(%rsp), %rsi
.L597:
	movq	8(%rsp), %rax
	movq	%r15, (%r14)
	movq	%rsi, 8(%r14)
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 16(%r14)
	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L627
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L625:
	.cfi_restore_state
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdi
	jbe	.L628
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
	jmp	.L579
.L626:
	testq	%r13, %r13
	je	.L597
	jmp	.L598
.L603:
	movq	$1, 8(%rsp)
.L578:
	movq	8(%rsp), %rax
	leaq	0(,%rax,8), %rdi
	jmp	.L579
.L628:
	xorl	%r15d, %r15d
	testq	%rdi, %rdi
	je	.L580
	jmp	.L578
.L584:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L585
	movq	(%rdi), %rax
	call	*8(%rax)
.L585:
	movq	%rbx, %rax
.L586:
	movq	%rax, %rdi
	call	__cxa_begin_catch@PLT
	testq	%r15, %r15
	jne	.L599
	movq	16(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L601
.L594:
	call	_ZSt9terminatev@PLT
.L627:
	call	__stack_chk_fail@PLT
.L608:
	jmp	.L586
.L610:
	movq	%rax, %rbx
	jmp	.L584
.L599:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L601:
.LEHB58:
	call	__cxa_rethrow@PLT
.LEHE58:
.L609:
	movq	%rax, %rbx
.L600:
	call	__cxa_end_catch@PLT
	movq	%rbx, %rdi
.LEHB59:
	call	_Unwind_Resume@PLT
.LEHE59:
	.cfi_endproc
.LFE4285:
	.section	.gcc_except_table
	.align 4
.LLSDA4285:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT4285-.LLSDATTD4285
.LLSDATTD4285:
	.byte	0x1
	.uleb128 .LLSDACSE4285-.LLSDACSB4285
.LLSDACSB4285:
	.uleb128 .LEHB55-.LFB4285
	.uleb128 .LEHE55-.LEHB55
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB56-.LFB4285
	.uleb128 .LEHE56-.LEHB56
	.uleb128 .L608-.LFB4285
	.uleb128 0x1
	.uleb128 .LEHB57-.LFB4285
	.uleb128 .LEHE57-.LEHB57
	.uleb128 .L610-.LFB4285
	.uleb128 0x3
	.uleb128 .LEHB58-.LFB4285
	.uleb128 .LEHE58-.LEHB58
	.uleb128 .L609-.LFB4285
	.uleb128 0
	.uleb128 .LEHB59-.LFB4285
	.uleb128 .LEHE59-.LEHB59
	.uleb128 0
	.uleb128 0
.LLSDACSE4285:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT4285:
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB4287:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4287
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	8(%rdi), %rbx
	movq	(%rdi), %r13
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rax
	subq	%r13, %rcx
	subq	%r13, %rax
	sarq	$3, %rax
	je	.L655
	leaq	(%rax,%rax), %rdi
	movq	%rdi, 8(%rsp)
	cmpq	%rdi, %rax
	jbe	.L677
	movabsq	$2305843009213693951, %rax
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
.L631:
	movq	%rdx, 24(%rsp)
	movq	%rcx, 16(%rsp)
.LEHB60:
	call	_Znwm@PLT
.LEHE60:
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rcx
	movq	%rax, %r15
.L632:
	leaq	(%r15,%rcx), %rax
	movdqu	(%rdx), %xmm0
	movdqu	16(%rdx), %xmm1
	movl	$40, %edi
	movq	$0, (%rax)
	movq	%rax, 16(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm1, 64(%rsp)
.LEHB61:
	call	_Znwm@PLT
.LEHE61:
	movdqa	48(%rsp), %xmm2
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rsi
	movdqa	64(%rsp), %xmm3
	movq	%rax, 40(%rsp)
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	16(%rsp), %rdi
	movq	%rsi, (%rax)
	leaq	40(%rsp), %rsi
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
.LEHB62:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE62:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L633
	movq	(%rdi), %rax
	call	*8(%rax)
.L633:
	movq	%r13, %rax
	movq	%r15, %rdx
	movq	%r15, %rsi
	cmpq	%r13, %r12
	je	.L635
.L639:
	movq	$0, (%rdx)
	movq	(%rax), %rcx
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	movq	$0, -8(%rax)
	cmpq	%rax, %r12
	jne	.L639
	leaq	-8(%r12), %rax
	subq	%r13, %rax
	shrq	$3, %rax
	leaq	8(%r15,%rax,8), %rsi
.L635:
	addq	$8, %rsi
	movq	%r12, %rax
	movq	%rsi, %rdx
	cmpq	%rbx, %r12
	je	.L644
.L643:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	cmpq	%rax, %rbx
	jne	.L643
	movq	%rbx, %rax
	subq	%r12, %rax
	subq	$8, %rax
	shrq	$3, %rax
	leaq	8(%rsi,%rax,8), %rsi
.L644:
	cmpq	%rbx, %r13
	je	.L678
	cmpq	$0, 0(%r13)
	jne	.L646
	movq	%r13, %rax
	jmp	.L645
.L648:
	cmpq	$0, (%rax)
	jne	.L646
.L645:
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L648
.L650:
	movq	%r13, %rdi
	movq	%rsi, 16(%rsp)
	call	_ZdlPv@PLT
	movq	16(%rsp), %rsi
.L649:
	movq	8(%rsp), %rax
	movq	%r15, (%r14)
	movq	%rsi, 8(%r14)
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 16(%r14)
	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L679
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L677:
	.cfi_restore_state
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdi
	jbe	.L680
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
	jmp	.L631
.L678:
	testq	%r13, %r13
	je	.L649
	jmp	.L650
.L655:
	movq	$1, 8(%rsp)
.L630:
	movq	8(%rsp), %rax
	leaq	0(,%rax,8), %rdi
	jmp	.L631
.L680:
	xorl	%r15d, %r15d
	testq	%rdi, %rdi
	je	.L632
	jmp	.L630
.L636:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L637
	movq	(%rdi), %rax
	call	*8(%rax)
.L637:
	movq	%rbx, %rax
.L638:
	movq	%rax, %rdi
	call	__cxa_begin_catch@PLT
	testq	%r15, %r15
	jne	.L651
	movq	16(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L653
.L646:
	call	_ZSt9terminatev@PLT
.L679:
	call	__stack_chk_fail@PLT
.L660:
	jmp	.L638
.L662:
	movq	%rax, %rbx
	jmp	.L636
.L651:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L653:
.LEHB63:
	call	__cxa_rethrow@PLT
.LEHE63:
.L661:
	movq	%rax, %rbx
.L652:
	call	__cxa_end_catch@PLT
	movq	%rbx, %rdi
.LEHB64:
	call	_Unwind_Resume@PLT
.LEHE64:
	.cfi_endproc
.LFE4287:
	.section	.gcc_except_table
	.align 4
.LLSDA4287:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT4287-.LLSDATTD4287
.LLSDATTD4287:
	.byte	0x1
	.uleb128 .LLSDACSE4287-.LLSDACSB4287
.LLSDACSB4287:
	.uleb128 .LEHB60-.LFB4287
	.uleb128 .LEHE60-.LEHB60
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB61-.LFB4287
	.uleb128 .LEHE61-.LEHB61
	.uleb128 .L660-.LFB4287
	.uleb128 0x1
	.uleb128 .LEHB62-.LFB4287
	.uleb128 .LEHE62-.LEHB62
	.uleb128 .L662-.LFB4287
	.uleb128 0x3
	.uleb128 .LEHB63-.LFB4287
	.uleb128 .LEHE63-.LEHB63
	.uleb128 .L661-.LFB4287
	.uleb128 0
	.uleb128 .LEHB64-.LFB4287
	.uleb128 .LEHE64-.LEHB64
	.uleb128 0
	.uleb128 0
.LLSDACSE4287:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT4287:
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB4289:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4289
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	8(%rdi), %rbx
	movq	(%rdi), %r13
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rax
	subq	%r13, %rcx
	subq	%r13, %rax
	sarq	$3, %rax
	je	.L707
	leaq	(%rax,%rax), %rdi
	movq	%rdi, 8(%rsp)
	cmpq	%rdi, %rax
	jbe	.L729
	movabsq	$2305843009213693951, %rax
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
.L683:
	movq	%rdx, 24(%rsp)
	movq	%rcx, 16(%rsp)
.LEHB65:
	call	_Znwm@PLT
.LEHE65:
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rcx
	movq	%rax, %r15
.L684:
	leaq	(%r15,%rcx), %rax
	movdqu	(%rdx), %xmm0
	movdqu	16(%rdx), %xmm1
	movl	$40, %edi
	movq	$0, (%rax)
	movq	%rax, 16(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm1, 64(%rsp)
.LEHB66:
	call	_Znwm@PLT
.LEHE66:
	movdqa	48(%rsp), %xmm2
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE(%rip), %rsi
	movdqa	64(%rsp), %xmm3
	movq	%rax, 40(%rsp)
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	16(%rsp), %rdi
	movq	%rsi, (%rax)
	leaq	40(%rsp), %rsi
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
.LEHB67:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE67:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L685
	movq	(%rdi), %rax
	call	*8(%rax)
.L685:
	movq	%r13, %rax
	movq	%r15, %rdx
	movq	%r15, %rsi
	cmpq	%r13, %r12
	je	.L687
.L691:
	movq	$0, (%rdx)
	movq	(%rax), %rcx
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	movq	$0, -8(%rax)
	cmpq	%rax, %r12
	jne	.L691
	leaq	-8(%r12), %rax
	subq	%r13, %rax
	shrq	$3, %rax
	leaq	8(%r15,%rax,8), %rsi
.L687:
	addq	$8, %rsi
	movq	%r12, %rax
	movq	%rsi, %rdx
	cmpq	%rbx, %r12
	je	.L696
.L695:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	cmpq	%rax, %rbx
	jne	.L695
	movq	%rbx, %rax
	subq	%r12, %rax
	subq	$8, %rax
	shrq	$3, %rax
	leaq	8(%rsi,%rax,8), %rsi
.L696:
	cmpq	%rbx, %r13
	je	.L730
	cmpq	$0, 0(%r13)
	jne	.L698
	movq	%r13, %rax
	jmp	.L697
.L700:
	cmpq	$0, (%rax)
	jne	.L698
.L697:
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L700
.L702:
	movq	%r13, %rdi
	movq	%rsi, 16(%rsp)
	call	_ZdlPv@PLT
	movq	16(%rsp), %rsi
.L701:
	movq	8(%rsp), %rax
	movq	%r15, (%r14)
	movq	%rsi, 8(%r14)
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 16(%r14)
	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L731
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L729:
	.cfi_restore_state
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdi
	jbe	.L732
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
	jmp	.L683
.L730:
	testq	%r13, %r13
	je	.L701
	jmp	.L702
.L707:
	movq	$1, 8(%rsp)
.L682:
	movq	8(%rsp), %rax
	leaq	0(,%rax,8), %rdi
	jmp	.L683
.L732:
	xorl	%r15d, %r15d
	testq	%rdi, %rdi
	je	.L684
	jmp	.L682
.L688:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L689
	movq	(%rdi), %rax
	call	*8(%rax)
.L689:
	movq	%rbx, %rax
.L690:
	movq	%rax, %rdi
	call	__cxa_begin_catch@PLT
	testq	%r15, %r15
	jne	.L703
	movq	16(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L705
.L698:
	call	_ZSt9terminatev@PLT
.L731:
	call	__stack_chk_fail@PLT
.L712:
	jmp	.L690
.L714:
	movq	%rax, %rbx
	jmp	.L688
.L703:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L705:
.LEHB68:
	call	__cxa_rethrow@PLT
.LEHE68:
.L713:
	movq	%rax, %rbx
.L704:
	call	__cxa_end_catch@PLT
	movq	%rbx, %rdi
.LEHB69:
	call	_Unwind_Resume@PLT
.LEHE69:
	.cfi_endproc
.LFE4289:
	.section	.gcc_except_table
	.align 4
.LLSDA4289:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT4289-.LLSDATTD4289
.LLSDATTD4289:
	.byte	0x1
	.uleb128 .LLSDACSE4289-.LLSDACSB4289
.LLSDACSB4289:
	.uleb128 .LEHB65-.LFB4289
	.uleb128 .LEHE65-.LEHB65
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB66-.LFB4289
	.uleb128 .LEHE66-.LEHB66
	.uleb128 .L712-.LFB4289
	.uleb128 0x1
	.uleb128 .LEHB67-.LFB4289
	.uleb128 .LEHE67-.LEHB67
	.uleb128 .L714-.LFB4289
	.uleb128 0x3
	.uleb128 .LEHB68-.LFB4289
	.uleb128 .LEHE68-.LEHB68
	.uleb128 .L713-.LFB4289
	.uleb128 0
	.uleb128 .LEHB69-.LFB4289
	.uleb128 .LEHE69-.LEHB69
	.uleb128 0
	.uleb128 0
.LLSDACSE4289:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT4289:
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB4291:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4291
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	8(%rdi), %rbx
	movq	(%rdi), %r13
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rax
	subq	%r13, %rcx
	subq	%r13, %rax
	sarq	$3, %rax
	je	.L759
	leaq	(%rax,%rax), %rdi
	movq	%rdi, 8(%rsp)
	cmpq	%rdi, %rax
	jbe	.L781
	movabsq	$2305843009213693951, %rax
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
.L735:
	movq	%rdx, 24(%rsp)
	movq	%rcx, 16(%rsp)
.LEHB70:
	call	_Znwm@PLT
.LEHE70:
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rcx
	movq	%rax, %r15
.L736:
	leaq	(%r15,%rcx), %rax
	movdqu	(%rdx), %xmm0
	movdqu	16(%rdx), %xmm1
	movl	$40, %edi
	movq	$0, (%rax)
	movq	%rax, 16(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm1, 64(%rsp)
.LEHB71:
	call	_Znwm@PLT
.LEHE71:
	movdqa	48(%rsp), %xmm2
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE(%rip), %rsi
	movdqa	64(%rsp), %xmm3
	movq	%rax, 40(%rsp)
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	16(%rsp), %rdi
	movq	%rsi, (%rax)
	leaq	40(%rsp), %rsi
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
.LEHB72:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE72:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L737
	movq	(%rdi), %rax
	call	*8(%rax)
.L737:
	movq	%r13, %rax
	movq	%r15, %rdx
	movq	%r15, %rsi
	cmpq	%r13, %r12
	je	.L739
.L743:
	movq	$0, (%rdx)
	movq	(%rax), %rcx
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	movq	$0, -8(%rax)
	cmpq	%rax, %r12
	jne	.L743
	leaq	-8(%r12), %rax
	subq	%r13, %rax
	shrq	$3, %rax
	leaq	8(%r15,%rax,8), %rsi
.L739:
	addq	$8, %rsi
	movq	%r12, %rax
	movq	%rsi, %rdx
	cmpq	%rbx, %r12
	je	.L748
.L747:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	cmpq	%rax, %rbx
	jne	.L747
	movq	%rbx, %rax
	subq	%r12, %rax
	subq	$8, %rax
	shrq	$3, %rax
	leaq	8(%rsi,%rax,8), %rsi
.L748:
	cmpq	%rbx, %r13
	je	.L782
	cmpq	$0, 0(%r13)
	jne	.L750
	movq	%r13, %rax
	jmp	.L749
.L752:
	cmpq	$0, (%rax)
	jne	.L750
.L749:
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L752
.L754:
	movq	%r13, %rdi
	movq	%rsi, 16(%rsp)
	call	_ZdlPv@PLT
	movq	16(%rsp), %rsi
.L753:
	movq	8(%rsp), %rax
	movq	%r15, (%r14)
	movq	%rsi, 8(%r14)
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 16(%r14)
	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L783
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L781:
	.cfi_restore_state
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdi
	jbe	.L784
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
	jmp	.L735
.L782:
	testq	%r13, %r13
	je	.L753
	jmp	.L754
.L759:
	movq	$1, 8(%rsp)
.L734:
	movq	8(%rsp), %rax
	leaq	0(,%rax,8), %rdi
	jmp	.L735
.L784:
	xorl	%r15d, %r15d
	testq	%rdi, %rdi
	je	.L736
	jmp	.L734
.L740:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L741
	movq	(%rdi), %rax
	call	*8(%rax)
.L741:
	movq	%rbx, %rax
.L742:
	movq	%rax, %rdi
	call	__cxa_begin_catch@PLT
	testq	%r15, %r15
	jne	.L755
	movq	16(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L757
.L750:
	call	_ZSt9terminatev@PLT
.L783:
	call	__stack_chk_fail@PLT
.L764:
	jmp	.L742
.L766:
	movq	%rax, %rbx
	jmp	.L740
.L755:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L757:
.LEHB73:
	call	__cxa_rethrow@PLT
.LEHE73:
.L765:
	movq	%rax, %rbx
.L756:
	call	__cxa_end_catch@PLT
	movq	%rbx, %rdi
.LEHB74:
	call	_Unwind_Resume@PLT
.LEHE74:
	.cfi_endproc
.LFE4291:
	.section	.gcc_except_table
	.align 4
.LLSDA4291:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT4291-.LLSDATTD4291
.LLSDATTD4291:
	.byte	0x1
	.uleb128 .LLSDACSE4291-.LLSDACSB4291
.LLSDACSB4291:
	.uleb128 .LEHB70-.LFB4291
	.uleb128 .LEHE70-.LEHB70
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB71-.LFB4291
	.uleb128 .LEHE71-.LEHB71
	.uleb128 .L764-.LFB4291
	.uleb128 0x1
	.uleb128 .LEHB72-.LFB4291
	.uleb128 .LEHE72-.LEHB72
	.uleb128 .L766-.LFB4291
	.uleb128 0x3
	.uleb128 .LEHB73-.LFB4291
	.uleb128 .LEHE73-.LEHB73
	.uleb128 .L765-.LFB4291
	.uleb128 0
	.uleb128 .LEHB74-.LFB4291
	.uleb128 .LEHE74-.LEHB74
	.uleb128 0
	.uleb128 0
.LLSDACSE4291:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT4291:
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB4293:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4293
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	8(%rdi), %rbx
	movq	(%rdi), %r13
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rax
	subq	%r13, %rcx
	subq	%r13, %rax
	sarq	$3, %rax
	je	.L811
	leaq	(%rax,%rax), %rdi
	movq	%rdi, 8(%rsp)
	cmpq	%rdi, %rax
	jbe	.L833
	movabsq	$2305843009213693951, %rax
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
.L787:
	movq	%rdx, 24(%rsp)
	movq	%rcx, 16(%rsp)
.LEHB75:
	call	_Znwm@PLT
.LEHE75:
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rcx
	movq	%rax, %r15
.L788:
	leaq	(%r15,%rcx), %rax
	movdqu	(%rdx), %xmm0
	movdqu	16(%rdx), %xmm1
	movl	$40, %edi
	movq	$0, (%rax)
	movq	%rax, 16(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm1, 64(%rsp)
.LEHB76:
	call	_Znwm@PLT
.LEHE76:
	movdqa	48(%rsp), %xmm2
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE(%rip), %rsi
	movdqa	64(%rsp), %xmm3
	movq	%rax, 40(%rsp)
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	16(%rsp), %rdi
	movq	%rsi, (%rax)
	leaq	40(%rsp), %rsi
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
.LEHB77:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE77:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L789
	movq	(%rdi), %rax
	call	*8(%rax)
.L789:
	movq	%r13, %rax
	movq	%r15, %rdx
	movq	%r15, %rsi
	cmpq	%r13, %r12
	je	.L791
.L795:
	movq	$0, (%rdx)
	movq	(%rax), %rcx
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	movq	$0, -8(%rax)
	cmpq	%rax, %r12
	jne	.L795
	leaq	-8(%r12), %rax
	subq	%r13, %rax
	shrq	$3, %rax
	leaq	8(%r15,%rax,8), %rsi
.L791:
	addq	$8, %rsi
	movq	%r12, %rax
	movq	%rsi, %rdx
	cmpq	%rbx, %r12
	je	.L800
.L799:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	cmpq	%rax, %rbx
	jne	.L799
	movq	%rbx, %rax
	subq	%r12, %rax
	subq	$8, %rax
	shrq	$3, %rax
	leaq	8(%rsi,%rax,8), %rsi
.L800:
	cmpq	%rbx, %r13
	je	.L834
	cmpq	$0, 0(%r13)
	jne	.L802
	movq	%r13, %rax
	jmp	.L801
.L804:
	cmpq	$0, (%rax)
	jne	.L802
.L801:
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L804
.L806:
	movq	%r13, %rdi
	movq	%rsi, 16(%rsp)
	call	_ZdlPv@PLT
	movq	16(%rsp), %rsi
.L805:
	movq	8(%rsp), %rax
	movq	%r15, (%r14)
	movq	%rsi, 8(%r14)
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 16(%r14)
	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L835
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L833:
	.cfi_restore_state
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdi
	jbe	.L836
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
	jmp	.L787
.L834:
	testq	%r13, %r13
	je	.L805
	jmp	.L806
.L811:
	movq	$1, 8(%rsp)
.L786:
	movq	8(%rsp), %rax
	leaq	0(,%rax,8), %rdi
	jmp	.L787
.L836:
	xorl	%r15d, %r15d
	testq	%rdi, %rdi
	je	.L788
	jmp	.L786
.L792:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L793
	movq	(%rdi), %rax
	call	*8(%rax)
.L793:
	movq	%rbx, %rax
.L794:
	movq	%rax, %rdi
	call	__cxa_begin_catch@PLT
	testq	%r15, %r15
	jne	.L807
	movq	16(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L809
.L802:
	call	_ZSt9terminatev@PLT
.L835:
	call	__stack_chk_fail@PLT
.L816:
	jmp	.L794
.L818:
	movq	%rax, %rbx
	jmp	.L792
.L807:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L809:
.LEHB78:
	call	__cxa_rethrow@PLT
.LEHE78:
.L817:
	movq	%rax, %rbx
.L808:
	call	__cxa_end_catch@PLT
	movq	%rbx, %rdi
.LEHB79:
	call	_Unwind_Resume@PLT
.LEHE79:
	.cfi_endproc
.LFE4293:
	.section	.gcc_except_table
	.align 4
.LLSDA4293:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT4293-.LLSDATTD4293
.LLSDATTD4293:
	.byte	0x1
	.uleb128 .LLSDACSE4293-.LLSDACSB4293
.LLSDACSB4293:
	.uleb128 .LEHB75-.LFB4293
	.uleb128 .LEHE75-.LEHB75
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB76-.LFB4293
	.uleb128 .LEHE76-.LEHB76
	.uleb128 .L816-.LFB4293
	.uleb128 0x1
	.uleb128 .LEHB77-.LFB4293
	.uleb128 .LEHE77-.LEHB77
	.uleb128 .L818-.LFB4293
	.uleb128 0x3
	.uleb128 .LEHB78-.LFB4293
	.uleb128 .LEHE78-.LEHB78
	.uleb128 .L817-.LFB4293
	.uleb128 0
	.uleb128 .LEHB79-.LFB4293
	.uleb128 .LEHE79-.LEHB79
	.uleb128 0
	.uleb128 0
.LLSDACSE4293:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT4293:
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB4295:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4295
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	8(%rdi), %rbx
	movq	(%rdi), %r13
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rax
	subq	%r13, %rcx
	subq	%r13, %rax
	sarq	$3, %rax
	je	.L863
	leaq	(%rax,%rax), %rdi
	movq	%rdi, 8(%rsp)
	cmpq	%rdi, %rax
	jbe	.L885
	movabsq	$2305843009213693951, %rax
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
.L839:
	movq	%rdx, 24(%rsp)
	movq	%rcx, 16(%rsp)
.LEHB80:
	call	_Znwm@PLT
.LEHE80:
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rcx
	movq	%rax, %r15
.L840:
	leaq	(%r15,%rcx), %rax
	movdqu	(%rdx), %xmm0
	movdqu	16(%rdx), %xmm1
	movl	$40, %edi
	movq	$0, (%rax)
	movq	%rax, 16(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm1, 64(%rsp)
.LEHB81:
	call	_Znwm@PLT
.LEHE81:
	movdqa	48(%rsp), %xmm2
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rsi
	movdqa	64(%rsp), %xmm3
	movq	%rax, 40(%rsp)
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	16(%rsp), %rdi
	movq	%rsi, (%rax)
	leaq	40(%rsp), %rsi
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
.LEHB82:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE82:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L841
	movq	(%rdi), %rax
	call	*8(%rax)
.L841:
	movq	%r13, %rax
	movq	%r15, %rdx
	movq	%r15, %rsi
	cmpq	%r13, %r12
	je	.L843
.L847:
	movq	$0, (%rdx)
	movq	(%rax), %rcx
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	movq	$0, -8(%rax)
	cmpq	%rax, %r12
	jne	.L847
	leaq	-8(%r12), %rax
	subq	%r13, %rax
	shrq	$3, %rax
	leaq	8(%r15,%rax,8), %rsi
.L843:
	addq	$8, %rsi
	movq	%r12, %rax
	movq	%rsi, %rdx
	cmpq	%rbx, %r12
	je	.L852
.L851:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	cmpq	%rax, %rbx
	jne	.L851
	movq	%rbx, %rax
	subq	%r12, %rax
	subq	$8, %rax
	shrq	$3, %rax
	leaq	8(%rsi,%rax,8), %rsi
.L852:
	cmpq	%rbx, %r13
	je	.L886
	cmpq	$0, 0(%r13)
	jne	.L854
	movq	%r13, %rax
	jmp	.L853
.L856:
	cmpq	$0, (%rax)
	jne	.L854
.L853:
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L856
.L858:
	movq	%r13, %rdi
	movq	%rsi, 16(%rsp)
	call	_ZdlPv@PLT
	movq	16(%rsp), %rsi
.L857:
	movq	8(%rsp), %rax
	movq	%r15, (%r14)
	movq	%rsi, 8(%r14)
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 16(%r14)
	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L887
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L885:
	.cfi_restore_state
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdi
	jbe	.L888
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
	jmp	.L839
.L886:
	testq	%r13, %r13
	je	.L857
	jmp	.L858
.L863:
	movq	$1, 8(%rsp)
.L838:
	movq	8(%rsp), %rax
	leaq	0(,%rax,8), %rdi
	jmp	.L839
.L888:
	xorl	%r15d, %r15d
	testq	%rdi, %rdi
	je	.L840
	jmp	.L838
.L844:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L845
	movq	(%rdi), %rax
	call	*8(%rax)
.L845:
	movq	%rbx, %rax
.L846:
	movq	%rax, %rdi
	call	__cxa_begin_catch@PLT
	testq	%r15, %r15
	jne	.L859
	movq	16(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L861
.L854:
	call	_ZSt9terminatev@PLT
.L887:
	call	__stack_chk_fail@PLT
.L868:
	jmp	.L846
.L870:
	movq	%rax, %rbx
	jmp	.L844
.L859:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L861:
.LEHB83:
	call	__cxa_rethrow@PLT
.LEHE83:
.L869:
	movq	%rax, %rbx
.L860:
	call	__cxa_end_catch@PLT
	movq	%rbx, %rdi
.LEHB84:
	call	_Unwind_Resume@PLT
.LEHE84:
	.cfi_endproc
.LFE4295:
	.section	.gcc_except_table
	.align 4
.LLSDA4295:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT4295-.LLSDATTD4295
.LLSDATTD4295:
	.byte	0x1
	.uleb128 .LLSDACSE4295-.LLSDACSB4295
.LLSDACSB4295:
	.uleb128 .LEHB80-.LFB4295
	.uleb128 .LEHE80-.LEHB80
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB81-.LFB4295
	.uleb128 .LEHE81-.LEHB81
	.uleb128 .L868-.LFB4295
	.uleb128 0x1
	.uleb128 .LEHB82-.LFB4295
	.uleb128 .LEHE82-.LEHB82
	.uleb128 .L870-.LFB4295
	.uleb128 0x3
	.uleb128 .LEHB83-.LFB4295
	.uleb128 .LEHE83-.LEHB83
	.uleb128 .L869-.LFB4295
	.uleb128 0
	.uleb128 .LEHB84-.LFB4295
	.uleb128 .LEHE84-.LEHB84
	.uleb128 0
	.uleb128 0
.LLSDACSE4295:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT4295:
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB4297:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4297
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	8(%rdi), %rbx
	movq	(%rdi), %r13
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rax
	subq	%r13, %rcx
	subq	%r13, %rax
	sarq	$3, %rax
	je	.L915
	leaq	(%rax,%rax), %rdi
	movq	%rdi, 8(%rsp)
	cmpq	%rdi, %rax
	jbe	.L937
	movabsq	$2305843009213693951, %rax
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
.L891:
	movq	%rdx, 24(%rsp)
	movq	%rcx, 16(%rsp)
.LEHB85:
	call	_Znwm@PLT
.LEHE85:
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rcx
	movq	%rax, %r15
.L892:
	leaq	(%r15,%rcx), %rax
	movdqu	(%rdx), %xmm0
	movdqu	16(%rdx), %xmm1
	movl	$40, %edi
	movq	$0, (%rax)
	movq	%rax, 16(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm1, 64(%rsp)
.LEHB86:
	call	_Znwm@PLT
.LEHE86:
	movdqa	48(%rsp), %xmm2
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE(%rip), %rsi
	movdqa	64(%rsp), %xmm3
	movq	%rax, 40(%rsp)
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	16(%rsp), %rdi
	movq	%rsi, (%rax)
	leaq	40(%rsp), %rsi
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
.LEHB87:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE87:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L893
	movq	(%rdi), %rax
	call	*8(%rax)
.L893:
	movq	%r13, %rax
	movq	%r15, %rdx
	movq	%r15, %rsi
	cmpq	%r13, %r12
	je	.L895
.L899:
	movq	$0, (%rdx)
	movq	(%rax), %rcx
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	movq	$0, -8(%rax)
	cmpq	%rax, %r12
	jne	.L899
	leaq	-8(%r12), %rax
	subq	%r13, %rax
	shrq	$3, %rax
	leaq	8(%r15,%rax,8), %rsi
.L895:
	addq	$8, %rsi
	movq	%r12, %rax
	movq	%rsi, %rdx
	cmpq	%rbx, %r12
	je	.L904
.L903:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	cmpq	%rax, %rbx
	jne	.L903
	movq	%rbx, %rax
	subq	%r12, %rax
	subq	$8, %rax
	shrq	$3, %rax
	leaq	8(%rsi,%rax,8), %rsi
.L904:
	cmpq	%rbx, %r13
	je	.L938
	cmpq	$0, 0(%r13)
	jne	.L906
	movq	%r13, %rax
	jmp	.L905
.L908:
	cmpq	$0, (%rax)
	jne	.L906
.L905:
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L908
.L910:
	movq	%r13, %rdi
	movq	%rsi, 16(%rsp)
	call	_ZdlPv@PLT
	movq	16(%rsp), %rsi
.L909:
	movq	8(%rsp), %rax
	movq	%r15, (%r14)
	movq	%rsi, 8(%r14)
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 16(%r14)
	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L939
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L937:
	.cfi_restore_state
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdi
	jbe	.L940
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
	jmp	.L891
.L938:
	testq	%r13, %r13
	je	.L909
	jmp	.L910
.L915:
	movq	$1, 8(%rsp)
.L890:
	movq	8(%rsp), %rax
	leaq	0(,%rax,8), %rdi
	jmp	.L891
.L940:
	xorl	%r15d, %r15d
	testq	%rdi, %rdi
	je	.L892
	jmp	.L890
.L896:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L897
	movq	(%rdi), %rax
	call	*8(%rax)
.L897:
	movq	%rbx, %rax
.L898:
	movq	%rax, %rdi
	call	__cxa_begin_catch@PLT
	testq	%r15, %r15
	jne	.L911
	movq	16(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L913
.L906:
	call	_ZSt9terminatev@PLT
.L939:
	call	__stack_chk_fail@PLT
.L920:
	jmp	.L898
.L922:
	movq	%rax, %rbx
	jmp	.L896
.L911:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L913:
.LEHB88:
	call	__cxa_rethrow@PLT
.LEHE88:
.L921:
	movq	%rax, %rbx
.L912:
	call	__cxa_end_catch@PLT
	movq	%rbx, %rdi
.LEHB89:
	call	_Unwind_Resume@PLT
.LEHE89:
	.cfi_endproc
.LFE4297:
	.section	.gcc_except_table
	.align 4
.LLSDA4297:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT4297-.LLSDATTD4297
.LLSDATTD4297:
	.byte	0x1
	.uleb128 .LLSDACSE4297-.LLSDACSB4297
.LLSDACSB4297:
	.uleb128 .LEHB85-.LFB4297
	.uleb128 .LEHE85-.LEHB85
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB86-.LFB4297
	.uleb128 .LEHE86-.LEHB86
	.uleb128 .L920-.LFB4297
	.uleb128 0x1
	.uleb128 .LEHB87-.LFB4297
	.uleb128 .LEHE87-.LEHB87
	.uleb128 .L922-.LFB4297
	.uleb128 0x3
	.uleb128 .LEHB88-.LFB4297
	.uleb128 .LEHE88-.LEHB88
	.uleb128 .L921-.LFB4297
	.uleb128 0
	.uleb128 .LEHB89-.LFB4297
	.uleb128 .LEHE89-.LEHB89
	.uleb128 0
	.uleb128 0
.LLSDACSE4297:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT4297:
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.weak	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB4299:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4299
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %rcx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movq	8(%rdi), %rbx
	movq	(%rdi), %r13
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rax
	subq	%r13, %rcx
	subq	%r13, %rax
	sarq	$3, %rax
	je	.L967
	leaq	(%rax,%rax), %rdi
	movq	%rdi, 8(%rsp)
	cmpq	%rdi, %rax
	jbe	.L989
	movabsq	$2305843009213693951, %rax
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
.L943:
	movq	%rdx, 24(%rsp)
	movq	%rcx, 16(%rsp)
.LEHB90:
	call	_Znwm@PLT
.LEHE90:
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rcx
	movq	%rax, %r15
.L944:
	leaq	(%r15,%rcx), %rax
	movdqu	(%rdx), %xmm0
	movdqu	16(%rdx), %xmm1
	movl	$40, %edi
	movq	$0, (%rax)
	movq	%rax, 16(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm1, 64(%rsp)
.LEHB91:
	call	_Znwm@PLT
.LEHE91:
	movdqa	48(%rsp), %xmm2
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rsi
	movdqa	64(%rsp), %xmm3
	movq	%rax, 40(%rsp)
	movq	pthread_create@GOTPCREL(%rip), %rdx
	movq	16(%rsp), %rdi
	movq	%rsi, (%rax)
	leaq	40(%rsp), %rsi
	movups	%xmm2, 8(%rax)
	movups	%xmm3, 24(%rax)
.LEHB92:
	call	_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE@PLT
.LEHE92:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L945
	movq	(%rdi), %rax
	call	*8(%rax)
.L945:
	movq	%r13, %rax
	movq	%r15, %rdx
	movq	%r15, %rsi
	cmpq	%r13, %r12
	je	.L947
.L951:
	movq	$0, (%rdx)
	movq	(%rax), %rcx
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	movq	$0, -8(%rax)
	cmpq	%rax, %r12
	jne	.L951
	leaq	-8(%r12), %rax
	subq	%r13, %rax
	shrq	$3, %rax
	leaq	8(%r15,%rax,8), %rsi
.L947:
	addq	$8, %rsi
	movq	%r12, %rax
	movq	%rsi, %rdx
	cmpq	%rbx, %r12
	je	.L956
.L955:
	movq	(%rax), %rcx
	movq	$0, (%rax)
	addq	$8, %rax
	addq	$8, %rdx
	movq	%rcx, -8(%rdx)
	cmpq	%rax, %rbx
	jne	.L955
	movq	%rbx, %rax
	subq	%r12, %rax
	subq	$8, %rax
	shrq	$3, %rax
	leaq	8(%rsi,%rax,8), %rsi
.L956:
	cmpq	%rbx, %r13
	je	.L990
	cmpq	$0, 0(%r13)
	jne	.L958
	movq	%r13, %rax
	jmp	.L957
.L960:
	cmpq	$0, (%rax)
	jne	.L958
.L957:
	addq	$8, %rax
	cmpq	%rbx, %rax
	jne	.L960
.L962:
	movq	%r13, %rdi
	movq	%rsi, 16(%rsp)
	call	_ZdlPv@PLT
	movq	16(%rsp), %rsi
.L961:
	movq	8(%rsp), %rax
	movq	%r15, (%r14)
	movq	%rsi, 8(%r14)
	leaq	(%r15,%rax,8), %rax
	movq	%rax, 16(%r14)
	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L991
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L989:
	.cfi_restore_state
	movabsq	$2305843009213693951, %rax
	cmpq	%rax, %rdi
	jbe	.L992
	movq	$-8, %rdi
	movq	%rax, 8(%rsp)
	jmp	.L943
.L990:
	testq	%r13, %r13
	je	.L961
	jmp	.L962
.L967:
	movq	$1, 8(%rsp)
.L942:
	movq	8(%rsp), %rax
	leaq	0(,%rax,8), %rdi
	jmp	.L943
.L992:
	xorl	%r15d, %r15d
	testq	%rdi, %rdi
	je	.L944
	jmp	.L942
.L948:
	movq	40(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L949
	movq	(%rdi), %rax
	call	*8(%rax)
.L949:
	movq	%rbx, %rax
.L950:
	movq	%rax, %rdi
	call	__cxa_begin_catch@PLT
	testq	%r15, %r15
	jne	.L963
	movq	16(%rsp), %rax
	cmpq	$0, (%rax)
	je	.L965
.L958:
	call	_ZSt9terminatev@PLT
.L991:
	call	__stack_chk_fail@PLT
.L972:
	jmp	.L950
.L974:
	movq	%rax, %rbx
	jmp	.L948
.L963:
	movq	%r15, %rdi
	call	_ZdlPv@PLT
.L965:
.LEHB93:
	call	__cxa_rethrow@PLT
.LEHE93:
.L973:
	movq	%rax, %rbx
.L964:
	call	__cxa_end_catch@PLT
	movq	%rbx, %rdi
.LEHB94:
	call	_Unwind_Resume@PLT
.LEHE94:
	.cfi_endproc
.LFE4299:
	.section	.gcc_except_table
	.align 4
.LLSDA4299:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT4299-.LLSDATTD4299
.LLSDATTD4299:
	.byte	0x1
	.uleb128 .LLSDACSE4299-.LLSDACSB4299
.LLSDACSB4299:
	.uleb128 .LEHB90-.LFB4299
	.uleb128 .LEHE90-.LEHB90
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB91-.LFB4299
	.uleb128 .LEHE91-.LEHB91
	.uleb128 .L972-.LFB4299
	.uleb128 0x1
	.uleb128 .LEHB92-.LFB4299
	.uleb128 .LEHE92-.LEHB92
	.uleb128 .L974-.LFB4299
	.uleb128 0x3
	.uleb128 .LEHB93-.LFB4299
	.uleb128 .LEHE93-.LEHB93
	.uleb128 .L973-.LFB4299
	.uleb128 0
	.uleb128 .LEHB94-.LFB4299
	.uleb128 .LEHE94-.LEHB94
	.uleb128 0
	.uleb128 0
.LLSDACSE4299:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT4299:
	.section	.text._ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorISt6threadSaIS0_EE17_M_realloc_insertIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.rodata
	.align 8
.LC15:
	.string	"basic_string::_M_construct null not valid"
.LC16:
	.string	"basic_string::_M_create"
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag:
.LFB4310:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	testq	%rsi, %rsi
	jne	.L994
	testq	%rdx, %rdx
	jne	.L1010
.L994:
	subq	%rsi, %rdx
	movq	%rdx, %rbx
	cmpq	$15, %rdx
	ja	.L1011
	movq	(%r12), %rax
	cmpq	$1, %rdx
	jne	.L998
	movzbl	(%rsi), %edx
	movb	%dl, (%rax)
	movq	(%r12), %rax
.L999:
	movq	%rbx, 8(%r12)
	movb	$0, (%rax,%rbx)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L998:
	.cfi_restore_state
	testq	%rdx, %rdx
	je	.L999
	jmp	.L997
.L1011:
	testq	%rdx, %rdx
	js	.L1012
	leaq	1(%rdx), %rdi
	movq	%rsi, 8(%rsp)
	call	_Znwm@PLT
	movq	%rbx, 16(%r12)
	movq	8(%rsp), %rsi
	movq	%rax, (%r12)
.L997:
	movq	%rbx, %rdx
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	(%r12), %rax
	jmp	.L999
.L1010:
	leaq	.LC15(%rip), %rdi
	call	_ZSt19__throw_logic_errorPKc@PLT
.L1012:
	leaq	.LC16(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE4310:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED2Ev:
.LFB5007:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE5007:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED0Ev:
.LFB5009:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, (%rdi)
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbx, %rdi
	movl	$40, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5009:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEED0Ev
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED2Ev:
.LFB5011:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE5011:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED0Ev:
.LFB5013:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, (%rdi)
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbx, %rdi
	movl	$40, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5013:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEED0Ev
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED2Ev:
.LFB5015:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE5015:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED0Ev:
.LFB5017:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, (%rdi)
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbx, %rdi
	movl	$40, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5017:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEED0Ev
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED2Ev:
.LFB5019:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE5019:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED0Ev:
.LFB5021:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, (%rdi)
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbx, %rdi
	movl	$40, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5021:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEED0Ev
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED2Ev:
.LFB5023:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE5023:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED0Ev:
.LFB5025:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, (%rdi)
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbx, %rdi
	movl	$40, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5025:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEED0Ev
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED2Ev:
.LFB5027:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE5027:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED0Ev:
.LFB5029:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, (%rdi)
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbx, %rdi
	movl	$40, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5029:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEED0Ev
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED2Ev:
.LFB5031:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE5031:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED0Ev:
.LFB5033:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, (%rdi)
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbx, %rdi
	movl	$40, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5033:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEED0Ev
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED2Ev:
.LFB5035:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE5035:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED0Ev:
.LFB5037:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, (%rdi)
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbx, %rdi
	movl	$40, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5037:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEED0Ev
	.weak	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE
	.section	.data.rel.ro.local._ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE,"awG",@progbits,_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE,comdat
	.align 8
	.type	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE, @object
	.size	_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE, 40
_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE:
	.quad	0
	.quad	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED1Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED0Ev
	.quad	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED2Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED2Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED2Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED2Ev:
.LFB5039:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE(%rip), %rax
	movq	%rax, (%rdi)
	jmp	_ZNSt6thread6_StateD2Ev@PLT
	.cfi_endproc
.LFE5039:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED2Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED2Ev
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED1Ev
	.set	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED1Ev,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED2Ev
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED0Ev,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED5Ev,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED0Ev
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED0Ev, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED0Ev:
.LFB5041:
	.cfi_startproc
	leaq	16+_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, (%rdi)
	call	_ZNSt6thread6_StateD2Ev@PLT
	movq	%rbx, %rdi
	movl	$24, %esi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZdlPvm@PLT
	.cfi_endproc
.LFE5041:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED0Ev, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEED0Ev
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE, 95
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE, 94
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE, 99
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE, 98
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE, 95
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE, 94
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE, 95
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE, 94
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEEE"
	.weak	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE
	.section	.data.rel.ro._ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE,"awG",@progbits,_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE,comdat
	.align 8
	.type	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE, @object
	.size	_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE, 24
_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE
	.quad	_ZTINSt6thread6_StateE
	.weak	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE
	.section	.rodata._ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE,"aG",@progbits,_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE,comdat
	.align 32
	.type	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE, @object
	.size	_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE, 60
_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE:
	.string	"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEEE"
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB5058:
	.cfi_startproc
	cmpl	$65535, %esi
	jne	.L1040
	cmpl	$1, %edi
	je	.L1048
.L1040:
	ret
.L1048:
	jmp	_Z41__static_initialization_and_destruction_0ii.part.82
	.cfi_endproc
.LFE5058:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.section	.rodata
.LC17:
	.string	"s="
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEE6_M_runEv,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEE6_M_runEv:
.LFB5059:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%r12d, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	jmp	.L1051
.L1057:
	movq	24(%rbx), %rdx
	movl	32(%rbx), %esi
	movq	16(%rbx), %rdi
	call	_Z3sumI7Rw_lockEiPiiRT_
	cltq
	addq	%rax, %r12
.L1051:
	movq	8(%rbx), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L1057
	movl	$2, %edx
	leaq	.LC17(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbx
	testq	%rbx, %rbx
	je	.L1058
	cmpb	$0, 56(%rbx)
	je	.L1053
	movsbl	67(%rbx), %esi
.L1054:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L1053:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L1054
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L1054
.L1058:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE5059:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE0_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEE6_M_runEv,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEE6_M_runEv:
.LFB5060:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%r12d, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	32(%rdi), %eax
	movq	%rdi, %rbx
	testl	%eax, %eax
	jle	.L1060
	xorl	%r13d, %r13d
.L1061:
	movq	24(%rbx), %rdx
	movl	36(%rbx), %esi
	addl	$1, %r13d
	movq	16(%rbx), %rdi
	call	_Z3sumI7Rw_lockEiPiiRT_
	cltq
	addq	%rax, %r12
	cmpl	%r13d, 32(%rbx)
	jg	.L1061
.L1060:
	movq	8(%rbx), %rax
	movl	$2, %edx
	leaq	.LC17(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movb	$1, (%rax)
	mfence
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbx
	testq	%rbx, %rbx
	je	.L1069
	cmpb	$0, 56(%rbx)
	je	.L1063
	movsbl	67(%rbx), %esi
.L1064:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L1063:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L1064
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L1064
.L1069:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE5060:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7Rw_lockEviiiRT_EUlvE_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEE6_M_runEv,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEE6_M_runEv:
.LFB5061:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%r12d, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	jmp	.L1072
.L1078:
	movq	24(%rbx), %rdx
	movl	32(%rbx), %esi
	movq	16(%rbx), %rdi
	call	_Z3sumI10Tatas_lockEiPiiRT_
	cltq
	addq	%rax, %r12
.L1072:
	movq	8(%rbx), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L1078
	movl	$2, %edx
	leaq	.LC17(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbx
	testq	%rbx, %rbx
	je	.L1079
	cmpb	$0, 56(%rbx)
	je	.L1074
	movsbl	67(%rbx), %esi
.L1075:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L1074:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L1075
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L1075
.L1079:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE5061:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE0_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEE6_M_runEv,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEE6_M_runEv:
.LFB5062:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%r12d, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	32(%rdi), %eax
	movq	%rdi, %rbx
	testl	%eax, %eax
	jle	.L1081
	xorl	%r13d, %r13d
.L1082:
	movq	24(%rbx), %rdx
	movl	36(%rbx), %esi
	addl	$1, %r13d
	movq	16(%rbx), %rdi
	call	_Z3sumI10Tatas_lockEiPiiRT_
	cltq
	addq	%rax, %r12
	cmpl	%r13d, 32(%rbx)
	jg	.L1082
.L1081:
	movq	8(%rbx), %rax
	movl	$2, %edx
	leaq	.LC17(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movb	$1, (%rax)
	mfence
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbx
	testq	%rbx, %rbx
	je	.L1090
	cmpb	$0, 56(%rbx)
	je	.L1084
	movsbl	67(%rbx), %esi
.L1085:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L1084:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L1085
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L1085
.L1090:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE5062:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI10Tatas_lockEviiiRT_EUlvE_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEE6_M_runEv,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEE6_M_runEv:
.LFB5063:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%r12d, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	jmp	.L1093
.L1099:
	movq	24(%rbx), %rdx
	movl	32(%rbx), %esi
	movq	16(%rbx), %rdi
	call	_Z3sumISt5mutexEiPiiRT_
	cltq
	addq	%rax, %r12
.L1093:
	movq	8(%rbx), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L1099
	movl	$2, %edx
	leaq	.LC17(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbx
	testq	%rbx, %rbx
	je	.L1100
	cmpb	$0, 56(%rbx)
	je	.L1095
	movsbl	67(%rbx), %esi
.L1096:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L1095:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L1096
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L1096
.L1100:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE5063:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE0_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEE6_M_runEv,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEE6_M_runEv:
.LFB5064:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%r12d, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	32(%rdi), %eax
	movq	%rdi, %rbx
	testl	%eax, %eax
	jle	.L1102
	xorl	%r13d, %r13d
.L1103:
	movq	24(%rbx), %rdx
	movl	36(%rbx), %esi
	addl	$1, %r13d
	movq	16(%rbx), %rdi
	call	_Z3sumISt5mutexEiPiiRT_
	cltq
	addq	%rax, %r12
	cmpl	%r13d, 32(%rbx)
	jg	.L1103
.L1102:
	movq	8(%rbx), %rax
	movl	$2, %edx
	leaq	.LC17(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movb	$1, (%rax)
	mfence
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbx
	testq	%rbx, %rbx
	je	.L1111
	cmpb	$0, 56(%rbx)
	je	.L1105
	movsbl	67(%rbx), %esi
.L1106:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L1105:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L1106
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L1106
.L1111:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE5064:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testISt5mutexEviiiRT_EUlvE_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEE6_M_runEv,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEE6_M_runEv:
.LFB5065:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%r12d, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	jmp	.L1114
.L1120:
	movq	24(%rbx), %rdx
	movl	32(%rbx), %esi
	movq	16(%rbx), %rdi
	call	_Z3sumI7No_lockEiPiiRT_
	cltq
	addq	%rax, %r12
.L1114:
	movq	8(%rbx), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L1120
	movl	$2, %edx
	leaq	.LC17(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbx
	testq	%rbx, %rbx
	je	.L1121
	cmpb	$0, 56(%rbx)
	je	.L1116
	movsbl	67(%rbx), %esi
.L1117:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L1116:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L1117
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L1117
.L1121:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE5065:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE0_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEE6_M_runEv,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEE6_M_runEv:
.LFB5066:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%r12d, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	32(%rdi), %eax
	movq	%rdi, %rbx
	testl	%eax, %eax
	jle	.L1123
	xorl	%r13d, %r13d
.L1124:
	movq	24(%rbx), %rdx
	movl	36(%rbx), %esi
	addl	$1, %r13d
	movq	16(%rbx), %rdi
	call	_Z3sumI7No_lockEiPiiRT_
	cltq
	addq	%rax, %r12
	cmpl	%r13d, 32(%rbx)
	jg	.L1124
.L1123:
	movq	8(%rbx), %rax
	movl	$2, %edx
	leaq	.LC17(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movb	$1, (%rax)
	mfence
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbx
	testq	%rbx, %rbx
	je	.L1132
	cmpb	$0, 56(%rbx)
	je	.L1126
	movsbl	67(%rbx), %esi
.L1127:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L1126:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbx), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L1127
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L1127
.L1132:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE5066:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZ14read_only_testI7No_lockEviiiRT_EUlvE_EEEEE6_M_runEv
	.section	.text._ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEE6_M_runEv,"axG",@progbits,_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEE6_M_runEv,comdat
	.align 2
	.weak	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEE6_M_runEv
	.type	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEE6_M_runEv, @function
_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEE6_M_runEv:
.LFB5067:
	.cfi_startproc
	movq	%rdi, %rax
	movl	8(%rdi), %edi
	jmp	*16(%rax)
	.cfi_endproc
.LFE5067:
	.size	_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEE6_M_runEv, .-_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFviEiEEEEE6_M_runEv
	.section	.text.startup
	.type	_GLOBAL__sub_I_volatile_stuff, @function
_GLOBAL__sub_I_volatile_stuff:
.LFB5135:
	.cfi_startproc
	jmp	_Z41__static_initialization_and_destruction_0ii.part.82
	.cfi_endproc
.LFE5135:
	.size	_GLOBAL__sub_I_volatile_stuff, .-_GLOBAL__sub_I_volatile_stuff
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_volatile_stuff
	.text
	.align 2
	.type	_ZN7No_lock4lockEv.isra.12, @function
_ZN7No_lock4lockEv.isra.12:
.LFB5148:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE5148:
	.size	_ZN7No_lock4lockEv.isra.12, .-_ZN7No_lock4lockEv.isra.12
	.set	_ZN7No_lock6unlockEv.isra.13,_ZN7No_lock4lockEv.isra.12
	.section	.rodata
.LC18:
	.string	"-num_threads"
.LC19:
	.string	"-delay"
.LC20:
	.string	"-arr-size"
.LC21:
	.string	"-num-loops"
.LC22:
	.string	"-mutex"
.LC23:
	.string	"-tatas"
.LC24:
	.string	"-rw-lock"
.LC25:
	.string	"SPIN"
.LC26:
	.string	"READ_ONLY"
	.text
	.type	_Z41__static_initialization_and_destruction_0ii.part.82, @function
_Z41__static_initialization_and_destruction_0ii.part.82:
.LFB5218:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	_ZStL8__ioinit(%rip), %rdi
	leaq	_ZL16num_threads_flag(%rip), %rbx
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	call	__cxa_atexit@PLT
	leaq	12+.LC18(%rip), %rdx
	leaq	16(%rbx), %rax
	movq	%rbx, %rdi
	leaq	-12(%rdx), %rsi
	movq	%rax, _ZL16num_threads_flag(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	movq	%rbx, %rsi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%rip), %rdi
	call	__cxa_atexit@PLT
	leaq	_ZL10delay_flag(%rip), %rbx
	leaq	6+.LC19(%rip), %rdx
	leaq	16(%rbx), %rax
	leaq	-6(%rdx), %rsi
	movq	%rbx, %rdi
	movq	%rax, _ZL10delay_flag(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	movq	%rbx, %rsi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%rip), %rdi
	call	__cxa_atexit@PLT
	leaq	_ZL13arr_size_flag(%rip), %rbx
	leaq	9+.LC20(%rip), %rdx
	leaq	16(%rbx), %rax
	leaq	-9(%rdx), %rsi
	movq	%rbx, %rdi
	movq	%rax, _ZL13arr_size_flag(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	movq	%rbx, %rsi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%rip), %rdi
	call	__cxa_atexit@PLT
	leaq	_ZL14num_loops_flag(%rip), %rbx
	leaq	10+.LC21(%rip), %rdx
	leaq	16(%rbx), %rax
	leaq	-10(%rdx), %rsi
	movq	%rbx, %rdi
	movq	%rax, _ZL14num_loops_flag(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	movq	%rbx, %rsi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%rip), %rdi
	call	__cxa_atexit@PLT
	leaq	_ZL10mutex_flag(%rip), %rbx
	leaq	6+.LC22(%rip), %rdx
	leaq	16(%rbx), %rax
	leaq	-6(%rdx), %rsi
	movq	%rbx, %rdi
	movq	%rax, _ZL10mutex_flag(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	movq	%rbx, %rsi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%rip), %rdi
	call	__cxa_atexit@PLT
	leaq	_ZL10tatas_flag(%rip), %rbx
	leaq	6+.LC23(%rip), %rdx
	leaq	16(%rbx), %rax
	leaq	-6(%rdx), %rsi
	movq	%rbx, %rdi
	movq	%rax, _ZL10tatas_flag(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	movq	%rbx, %rsi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%rip), %rdi
	call	__cxa_atexit@PLT
	leaq	_ZL7rw_flag(%rip), %rbx
	leaq	8+.LC24(%rip), %rdx
	leaq	16(%rbx), %rax
	leaq	-8(%rdx), %rsi
	movq	%rbx, %rdi
	movq	%rax, _ZL7rw_flag(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	movq	%rbx, %rsi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%rip), %rdi
	call	__cxa_atexit@PLT
	leaq	_ZL12spin_command(%rip), %rbx
	leaq	4+.LC25(%rip), %rdx
	leaq	16(%rbx), %rax
	leaq	-4(%rdx), %rsi
	movq	%rbx, %rdi
	movq	%rax, _ZL12spin_command(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	movq	%rbx, %rsi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%rip), %rdi
	call	__cxa_atexit@PLT
	leaq	_ZL17read_only_command(%rip), %rbx
	leaq	9+.LC26(%rip), %rdx
	leaq	16(%rbx), %rax
	leaq	-9(%rdx), %rsi
	movq	%rbx, %rdi
	movq	%rax, _ZL17read_only_command(%rip)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 8
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%rip), %rdi
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE5218:
	.size	_Z41__static_initialization_and_destruction_0ii.part.82, .-_Z41__static_initialization_and_destruction_0ii.part.82
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB2039:
	.cfi_startproc
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE2039:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.text._ZNSt11char_traitsIcE6lengthEPKc,"axG",@progbits,_ZNSt11char_traitsIcE6lengthEPKc,comdat
	.weak	_ZNSt11char_traitsIcE6lengthEPKc
	.type	_ZNSt11char_traitsIcE6lengthEPKc, @function
_ZNSt11char_traitsIcE6lengthEPKc:
.LFB1012:
	.cfi_startproc
	jmp	strlen@PLT
	.cfi_endproc
.LFE1012:
	.size	_ZNSt11char_traitsIcE6lengthEPKc, .-_ZNSt11char_traitsIcE6lengthEPKc
	.section	.text._ZNSt5mutex4lockEv,"axG",@progbits,_ZNSt5mutex4lockEv,comdat
	.align 2
	.weak	_ZNSt5mutex4lockEv
	.type	_ZNSt5mutex4lockEv, @function
_ZNSt5mutex4lockEv:
.LFB3653:
	.cfi_startproc
	cmpq	$0, _ZL28__gthrw___pthread_key_createPjPFvPvE@GOTPCREL(%rip)
	je	.L1149
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t@PLT
	testl	%eax, %eax
	jne	.L1152
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
.L1149:
	ret
.L1152:
	.cfi_def_cfa_offset 16
	movl	%eax, %edi
	call	_ZSt20__throw_system_errori@PLT
	.cfi_endproc
.LFE3653:
	.size	_ZNSt5mutex4lockEv, .-_ZNSt5mutex4lockEv
	.section	.text._ZNSt5mutex6unlockEv,"axG",@progbits,_ZNSt5mutex6unlockEv,comdat
	.align 2
	.weak	_ZNSt5mutex6unlockEv
	.type	_ZNSt5mutex6unlockEv, @function
_ZNSt5mutex6unlockEv:
.LFB3655:
	.cfi_startproc
	cmpq	$0, _ZL28__gthrw___pthread_key_createPjPFvPvE@GOTPCREL(%rip)
	je	.L1153
	jmp	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t@PLT
.L1153:
	ret
	.cfi_endproc
.LFE3655:
	.size	_ZNSt5mutex6unlockEv, .-_ZNSt5mutex6unlockEv
	.globl	volatile_stuff
	.data
	.align 4
	.type	volatile_stuff, @object
	.size	volatile_stuff, 4
volatile_stuff:
	.long	12345
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.weakref	_ZL28__gthrw___pthread_key_createPjPFvPvE,__pthread_key_create
	.weakref	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t,pthread_mutex_unlock
	.weakref	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t,pthread_mutex_lock
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 8.2.1 20180831"
	.section	.note.GNU-stack,"",@progbits
