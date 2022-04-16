	.file	"HashTable.cpp"
	.text
	.section .rdata,"dr"
	.align 4
_ZL15BASIC_SIZE_LIST:
	.long	5
	.align 4
_ZL15HASH_TABLE_SIZE:
	.long	16
	.align 4
_ZL13NUM_FUNCTIONS:
	.long	6
.LC0:
	.ascii "ZERO PTR INPUT\0"
.LC1:
	.ascii "hash_table\0"
.LC2:
	.ascii "HashCtor\0"
	.align 8
.LC3:
	.ascii "\12ERROR in function : %s \12%s have %s\12\0"
.LC4:
	.ascii "CALLOC HAS FALLEN\0"
.LC5:
	.ascii "hash_table->list\0"
	.text
	.globl	_Z8HashCtorP9HashTablei
	.def	_Z8HashCtorP9HashTablei;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8HashCtorP9HashTablei
_Z8HashCtorP9HashTablei:
.LFB539:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L2
	leaq	.LC0(%rip), %r9
	leaq	.LC1(%rip), %r8
	leaq	.LC2(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L3
.L2:
	movl	24(%rbp), %eax
	cltq
	movl	$64, %edx
	movq	%rax, %rcx
	call	calloc
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L4
	leaq	.LC4(%rip), %r9
	leaq	.LC5(%rip), %r8
	leaq	.LC2(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L3
.L4:
	movl	$0, -4(%rbp)
.L6:
	movl	-4(%rbp), %eax
	cmpl	24(%rbp), %eax
	jge	.L5
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movq	%rax, %rcx
	call	_Z9list_ctorP4List
	addl	$1, -4(%rbp)
	jmp	.L6
.L5:
	movq	16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	16(%rbp), %rax
	movq	$0, 16(%rax)
	movl	$0, %eax
.L3:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC6:
	.ascii "ZERO PTR INPUT HASH_TABLE\0"
.LC7:
	.ascii "HashDtor\0"
.LC8:
	.ascii "ZERO PTR INPUT LIST\0"
.LC9:
	.ascii "HashTable is dstrutced\0"
	.text
	.globl	_Z8HashDtorP9HashTable
	.def	_Z8HashDtorP9HashTable;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8HashDtorP9HashTable
_Z8HashDtorP9HashTable:
.LFB540:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L8
	leaq	.LC6(%rip), %r9
	leaq	.LC1(%rip), %r8
	leaq	.LC7(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L9
.L8:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L10
	leaq	.LC8(%rip), %r9
	leaq	.LC5(%rip), %r8
	leaq	.LC7(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L9
.L10:
	movq	16(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$-1, %eax
	jne	.L11
	leaq	.LC9(%rip), %rcx
	call	puts
	movl	$-1, %eax
	jmp	.L9
.L11:
	movl	$0, -4(%rbp)
.L13:
	cmpl	$15, -4(%rbp)
	jg	.L12
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movq	%rax, %rcx
	call	_Z9list_dtorP4List
	addl	$1, -4(%rbp)
	jmp	.L13
.L12:
	movq	16(%rbp), %rax
	movl	$-1, 8(%rax)
	movq	16(%rbp), %rax
	movq	$0, 16(%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	movl	$0, %eax
.L9:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC10:
	.ascii "ZERO PTR TABLE INPUT\0"
.LC11:
	.ascii "HashTableClear\0"
	.text
	.globl	_Z14HashTableClearP9HashTable
	.def	_Z14HashTableClearP9HashTable;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z14HashTableClearP9HashTable
_Z14HashTableClearP9HashTable:
.LFB541:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L15
	leaq	.LC10(%rip), %r9
	leaq	.LC1(%rip), %r8
	leaq	.LC11(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L16
.L15:
	movl	$0, -4(%rbp)
.L20:
	cmpl	$15, -4(%rbp)
	jg	.L17
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movl	$0, (%rax)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movl	$0, (%rax)
	movq	-16(%rbp), %rax
	movb	$1, 56(%rax)
	movq	-16(%rbp), %rax
	movl	40(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	memset
	movq	-16(%rbp), %rax
	movl	40(%rax), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	addq	$4, %rax
	movq	%rdx, %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	memset
	movq	-16(%rbp), %rax
	movl	40(%rax), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	addq	$4, %rax
	movq	%rdx, %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	memset
	movq	-16(%rbp), %rax
	movl	$1, 28(%rax)
	movq	-16(%rbp), %rax
	movl	$1, 32(%rax)
	movq	-16(%rbp), %rax
	movl	$1, 24(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 36(%rax)
	movl	$1, -8(%rbp)
.L19:
	movq	-16(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	%eax, -8(%rbp)
	jge	.L18
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	addl	$1, -8(%rbp)
	jmp	.L19
.L18:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-16(%rbp), %rax
	movl	40(%rax), %eax
	cltq
	salq	$2, %rax
	subq	$4, %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	addl	$1, -4(%rbp)
	jmp	.L20
.L17:
	movq	16(%rbp), %rax
	movq	$0, 16(%rax)
	movl	$0, %eax
.L16:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC12:
	.ascii "FHashPush\0"
.LC13:
	.ascii "ZERO PTR FUNC INPUT\0"
.LC14:
	.ascii "hash_table->HashFunc\0"
.LC15:
	.ascii "ZERO PTR ONEGIN STRUCT INPUT\0"
.LC16:
	.ascii "line\0"
	.text
	.globl	_Z9FHashPushP9HashTableP6Onegini
	.def	_Z9FHashPushP9HashTableP6Onegini;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9FHashPushP9HashTableP6Onegini
_Z9FHashPushP9HashTableP6Onegini:
.LFB542:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L22
	leaq	.LC10(%rip), %r9
	leaq	.LC1(%rip), %r8
	leaq	.LC12(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L23
.L22:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L24
	leaq	.LC13(%rip), %r9
	leaq	.LC14(%rip), %r8
	leaq	.LC12(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L23
.L24:
	cmpq	$0, 24(%rbp)
	jne	.L25
	leaq	.LC15(%rip), %r9
	leaq	.LC16(%rip), %r8
	leaq	.LC12(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L23
.L25:
	movl	$0, -4(%rbp)
.L29:
	movl	-4(%rbp), %eax
	cmpl	32(%rbp), %eax
	jge	.L26
	movq	$0, -24(%rbp)
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	leaq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_Z8HashFindP9HashTablePcPP4List
	testl	%eax, %eax
	setle	%al
	testb	%al, %al
	jne	.L30
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	_Z13list_end_pushPcP4List
	jmp	.L28
.L30:
	nop
.L28:
	addl	$1, -4(%rbp)
	jmp	.L29
.L26:
	movl	$0, %eax
.L23:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC17:
	.ascii "HashFind\0"
.LC18:
	.ascii "str\0"
	.text
	.globl	_Z8HashFindP9HashTablePcPP4List
	.def	_Z8HashFindP9HashTablePcPP4List;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8HashFindP9HashTablePcPP4List
_Z8HashFindP9HashTablePcPP4List:
.LFB543:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L32
	leaq	.LC10(%rip), %r9
	leaq	.LC1(%rip), %r8
	leaq	.LC17(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L33
.L32:
	cmpq	$0, 24(%rbp)
	jne	.L34
	leaq	.LC0(%rip), %r9
	leaq	.LC18(%rip), %r8
	leaq	.LC17(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L33
.L34:
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	*%rdx
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	cqto
	shrq	$60, %rdx
	addq	%rdx, %rax
	andl	$15, %eax
	subq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	salq	$6, %rax
	addq	%rax, %rdx
	movq	32(%rbp), %rax
	movq	%rdx, (%rax)
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movl	28(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
.L37:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L35
	movq	-16(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L36
	movl	$0, %eax
	jmp	.L33
.L36:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L37
.L35:
	movl	$1, %eax
.L33:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC19:
	.ascii "HashClearRepeat\0"
	.text
	.globl	_Z15HashClearRepeatP9HashTable
	.def	_Z15HashClearRepeatP9HashTable;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z15HashClearRepeatP9HashTable
_Z15HashClearRepeatP9HashTable:
.LFB544:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L39
	leaq	.LC10(%rip), %r9
	leaq	.LC1(%rip), %r8
	leaq	.LC19(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L40
.L39:
	movl	$0, -4(%rbp)
.L42:
	cmpl	$15, -4(%rbp)
	jg	.L41
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movq	%rax, %rcx
	call	_Z17list_clean_repeatP4List
	addl	$1, -4(%rbp)
	jmp	.L42
.L41:
	movl	$0, %eax
.L40:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC20:
	.ascii "str_ptr\0"
.LC21:
	.ascii "HashFuncOne\0"
	.text
	.globl	_Z11HashFuncOnePc
	.def	_Z11HashFuncOnePc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z11HashFuncOnePc
_Z11HashFuncOnePc:
.LFB545:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L44
	leaq	.LC0(%rip), %r9
	leaq	.LC20(%rip), %r8
	leaq	.LC21(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movq	$-1, %rax
	jmp	.L45
.L44:
	movl	$1, %eax
.L45:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC22:
	.ascii "HashFuncAsciiFirstLetter\0"
	.text
	.globl	_Z24HashFuncAsciiFirstLetterPc
	.def	_Z24HashFuncAsciiFirstLetterPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z24HashFuncAsciiFirstLetterPc
_Z24HashFuncAsciiFirstLetterPc:
.LFB546:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L47
	leaq	.LC0(%rip), %r9
	leaq	.LC20(%rip), %r8
	leaq	.LC22(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movq	$-1, %rax
	jmp	.L48
.L47:
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
.L48:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC23:
	.ascii "HashFuncLength\0"
	.text
	.globl	_Z14HashFuncLengthPc
	.def	_Z14HashFuncLengthPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z14HashFuncLengthPc
_Z14HashFuncLengthPc:
.LFB547:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L50
	leaq	.LC0(%rip), %r9
	leaq	.LC20(%rip), %r8
	leaq	.LC23(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movq	$-1, %rax
	jmp	.L51
.L50:
	movq	16(%rbp), %rcx
	call	strlen
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	subq	16(%rbp), %rax
.L51:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC24:
	.ascii "HashFuncAsciiAllLeters\0"
	.text
	.globl	_Z22HashFuncAsciiAllLetersPc
	.def	_Z22HashFuncAsciiAllLetersPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z22HashFuncAsciiAllLetersPc
_Z22HashFuncAsciiAllLetersPc:
.LFB548:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L53
	leaq	.LC0(%rip), %r9
	leaq	.LC20(%rip), %r8
	leaq	.LC24(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movq	$-1, %rax
	jmp	.L54
.L53:
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
.L56:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L55
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	addl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
	jmp	.L56
.L55:
	movl	-4(%rbp), %eax
	cltq
.L54:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC25:
	.ascii "HashFuncRol\0"
	.text
	.globl	_Z11HashFuncRolPc
	.def	_Z11HashFuncRolPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z11HashFuncRolPc
_Z11HashFuncRolPc:
.LFB549:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L58
	leaq	.LC0(%rip), %r9
	leaq	.LC20(%rip), %r8
	leaq	.LC25(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movq	$-1, %rax
	jmp	.L59
.L58:
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, -4(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$1, -8(%rbp)
.L61:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, -16(%rbp)
	cmpl	$0, -16(%rbp)
	setne	%al
	testb	%al, %al
	je	.L60
	movl	-4(%rbp), %edx
/APP
 # 248 "HashTable.cpp" 1
	mov eax, %edx
	rol eax, 1
	mov %edx, eax
	
 # 0 "" 2
/NO_APP
	movl	%edx, -12(%rbp)
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %ecx
	call	_ZSt3powIiiEN9__gnu_cxx11__promote_2IT_T0_NS0_9__promoteIS2_XsrSt12__is_integerIS2_E7__valueEE6__typeENS4_IS3_XsrS5_IS3_E7__valueEE6__typeEE6__typeES2_S3_
	cvttsd2siq	%xmm0, %rax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
	jmp	.L61
.L60:
	movl	-4(%rbp), %eax
.L59:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC26:
	.ascii "key\0"
.LC27:
	.ascii "MurmurHash2\0"
	.text
	.globl	_Z11MurmurHash2Pc
	.def	_Z11MurmurHash2Pc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z11MurmurHash2Pc
_Z11MurmurHash2Pc:
.LFB550:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L63
	leaq	.LC0(%rip), %r9
	leaq	.LC26(%rip), %r8
	leaq	.LC27(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movq	$-1, %rax
	jmp	.L64
.L63:
	movq	16(%rbp), %rcx
	call	strlen
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	subq	16(%rbp), %rax
	movl	%eax, -4(%rbp)
	movl	$1540483477, -20(%rbp)
	movl	$0, -24(%rbp)
	movl	$24, -28(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -16(%rbp)
.L66:
	cmpl	$3, -4(%rbp)
	jbe	.L65
	movl	$0, -32(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -32(%rbp)
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	sall	$8, %eax
	orl	%eax, -32(%rbp)
	movq	-16(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	sall	$16, %eax
	orl	%eax, -32(%rbp)
	movq	-16(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	sall	$24, %eax
	orl	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	imull	$1540483477, %eax, %eax
	movl	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	shrl	$24, %eax
	xorl	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	imull	$1540483477, %eax, %eax
	movl	%eax, -32(%rbp)
	movl	-8(%rbp), %eax
	imull	$1540483477, %eax, %eax
	movl	%eax, -8(%rbp)
	movl	-32(%rbp), %eax
	xorl	%eax, -8(%rbp)
	addq	$4, -16(%rbp)
	subl	$4, -4(%rbp)
	jmp	.L66
.L65:
	cmpl	$3, -4(%rbp)
	je	.L67
	cmpl	$3, -4(%rbp)
	ja	.L72
	cmpl	$1, -4(%rbp)
	je	.L69
	cmpl	$2, -4(%rbp)
	je	.L70
	jmp	.L72
.L67:
	movq	-16(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	sall	$16, %eax
	xorl	%eax, -8(%rbp)
	jmp	.L71
.L70:
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	sall	$8, %eax
	xorl	%eax, -8(%rbp)
	jmp	.L71
.L69:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	xorl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	imull	$1540483477, %eax, %eax
	movl	%eax, -8(%rbp)
	jmp	.L71
.L72:
	nop
.L71:
	movl	-8(%rbp), %eax
	shrl	$13, %eax
	xorl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	imull	$1540483477, %eax, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	shrl	$15, %eax
	xorl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
.L64:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC28:
	.ascii "HashVerificate\0"
.LC29:
	.ascii "ERROR_LIST_ARRAY_ZERO_PTR\0"
.LC30:
	.ascii "NO ERROR\0"
	.text
	.globl	_Z14HashVerificateP9HashTable
	.def	_Z14HashVerificateP9HashTable;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z14HashVerificateP9HashTable
_Z14HashVerificateP9HashTable:
.LFB551:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L74
	leaq	.LC10(%rip), %r9
	leaq	.LC1(%rip), %r8
	leaq	.LC28(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L75
.L74:
	movl	$0, -4(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L76
	movl	$14, -4(%rbp)
	movq	16(%rbp), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rdx, 24(%rax)
.L76:
	movl	$0, -8(%rbp)
.L78:
	cmpl	$15, -8(%rbp)
	jg	.L77
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movq	%rax, %rcx
	call	_Z15list_verificateP4List
	addl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
	jmp	.L78
.L77:
	cmpl	$0, -4(%rbp)
	jne	.L79
	movq	16(%rbp), %rax
	leaq	.LC30(%rip), %rdx
	movq	%rdx, 24(%rax)
.L79:
	movl	-4(%rbp), %eax
.L75:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC31:
	.ascii "HashTableDumpVis\0"
.LC32:
	.ascii "w\0"
.LC33:
	.ascii "../output/hash_dump.dot\0"
.LC34:
	.ascii "NOT CREATED\0"
.LC35:
	.ascii "output_file\0"
	.align 8
.LC36:
	.ascii "\11digraph dump_graph{\12\11rankdir=HR;\12\0"
.LC37:
	.ascii "\11subgraph HASH_%d {\12\0"
	.align 8
.LC38:
	.ascii "\11F%p_%d [shape = \"ellipse\", label = \" %d\\nvalue %s, next %d, prev %d\"];\12\0"
	.align 8
.LC39:
	.ascii "\11F%p_%d -> F%p_%d [style=invis];\12\0"
	.align 8
.LC40:
	.ascii "\11INFO%p [shape = record, label = \" <hd> HEAD | <tl> TAIL | <fr> FREE\"];\12\0"
.LC41:
	.ascii "\11HASH_%d -> INFO%p\12\0"
	.align 8
.LC42:
	.ascii "\11INFO%p: <hd> -> F%p_%d [color= \"blue\"];\12\0"
	.align 8
.LC43:
	.ascii "\11INFO%p: <tl> -> F%p_%d [color= \"blue\"];\12\0"
	.align 8
.LC44:
	.ascii "\11INFO%p: <fr> -> F%p_%d [color= \"red\"];\12\0"
	.align 8
.LC45:
	.ascii "\11F%p_%d -> F%p_%d [color= \"blue\"];\12\0"
	.align 8
.LC46:
	.ascii "\11F%p_%d -> F%p_%d [color= \"red\"];\12\0"
.LC47:
	.ascii "}\12\0"
	.align 8
.LC48:
	.ascii "ERROR in function : %s \12writing file falled\12\0"
	.text
	.globl	_Z16HashTableDumpVisP9HashTable
	.def	_Z16HashTableDumpVisP9HashTable;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z16HashTableDumpVisP9HashTable
_Z16HashTableDumpVisP9HashTable:
.LFB552:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L81
	leaq	.LC10(%rip), %r9
	leaq	.LC1(%rip), %r8
	leaq	.LC31(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L82
.L81:
	leaq	.LC32(%rip), %rdx
	leaq	.LC33(%rip), %rcx
	call	fopen
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L83
	leaq	.LC34(%rip), %r9
	leaq	.LC35(%rip), %r8
	leaq	.LC31(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L82
.L83:
	movq	-32(%rbp), %rax
	movq	%rax, %r9
	movl	$34, %r8d
	movl	$1, %edx
	leaq	.LC36(%rip), %rcx
	call	fwrite
	movl	$0, -4(%rbp)
.L92:
	cmpl	$15, -4(%rbp)
	jg	.L84
	movl	-4(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC37(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movq	%rax, -40(%rbp)
	movl	$0, -8(%rbp)
.L87:
	movq	-40(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	%eax, -8(%rbp)
	jge	.L85
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %r8d
	movq	-40(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-8(%rbp), %r9d
	movq	-40(%rbp), %r10
	movq	-32(%rbp), %rax
	movl	%r8d, 56(%rsp)
	movl	%ecx, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movl	-8(%rbp), %edx
	movl	%edx, 32(%rsp)
	movq	%r10, %r8
	leaq	.LC38(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	cmpl	$1, -8(%rbp)
	jle	.L86
	movl	-8(%rbp), %eax
	leal	-1(%rax), %r8d
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rax
	movl	-8(%rbp), %edx
	movl	%edx, 40(%rsp)
	movq	-40(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movl	%r8d, %r9d
	movq	%rcx, %r8
	leaq	.LC39(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L86:
	addl	$1, -8(%rbp)
	jmp	.L87
.L85:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC40(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %r9
	movl	%ecx, %r8d
	leaq	.LC41(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-40(%rbp), %rax
	movl	28(%rax), %edx
	movq	-40(%rbp), %r8
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rax
	movl	%edx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	leaq	.LC42(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-40(%rbp), %rax
	movl	32(%rax), %edx
	movq	-40(%rbp), %r8
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rax
	movl	%edx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	leaq	.LC43(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-40(%rbp), %rax
	movl	24(%rax), %edx
	movq	-40(%rbp), %r8
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rax
	movl	%edx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	leaq	.LC44(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-40(%rbp), %rax
	movl	28(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	$1, -16(%rbp)
.L89:
	movq	-40(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	%eax, -16(%rbp)
	jg	.L88
	movq	-40(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L88
	movq	-40(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-12(%rbp), %r8d
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rax
	movl	%edx, 40(%rsp)
	movq	-40(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movl	%r8d, %r9d
	movq	%rcx, %r8
	leaq	.LC45(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-40(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	addl	$1, -16(%rbp)
	jmp	.L89
.L88:
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -20(%rbp)
.L91:
	movq	-40(%rbp), %rax
	movl	40(%rax), %eax
	subl	$1, %eax
	cmpl	%eax, -20(%rbp)
	jge	.L90
	movq	-40(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L90
	movq	-40(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-12(%rbp), %r8d
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rax
	movl	%edx, 40(%rsp)
	movq	-40(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movl	%r8d, %r9d
	movq	%rcx, %r8
	leaq	.LC46(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-40(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	addl	$1, -20(%rbp)
	jmp	.L91
.L90:
	movq	-32(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC47(%rip), %rcx
	call	fwrite
	addl	$1, -4(%rbp)
	jmp	.L92
.L84:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$125, %ecx
	call	fputc
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	ferror
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L93
	leaq	.LC31(%rip), %rdx
	leaq	.LC48(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L82
.L93:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	$0, %eax
.L82:
	addq	$112, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC49:
	.ascii "HashTableDumpTxt\0"
.LC50:
	.ascii "../output/hash_dump_txt.txt\0"
.LC51:
	.ascii "list_status_file\0"
	.align 8
.LC52:
	.ascii "Hash have %s at %s at (%s:%d) \12\12\0"
	.align 8
.LC53:
	.ascii "Hash pointer = %p, pointer of array of lists = %p, hash have function = %d \12\12\0"
.LC54:
	.ascii "Hash %d list:\12\0"
.LC55:
	.ascii "\11List have %s\12\12\0"
	.align 8
.LC56:
	.ascii "\11Capacity = %d\12\11Size = %d\12\11head = %d\12\11tail = %d\12\11free = %d\12\11Pointer of next = %p\12\11Pointer of prev = %p\12\11Pointer of data = %p\12\12\0"
	.align 8
.LC57:
	.ascii "\11%d : value = %s -- next = %d -- prev = %d\12\0"
.LC58:
	.ascii "\12\12\12\0"
	.text
	.globl	_Z16HashTableDumpTxtP9HashTablePKciS2_
	.def	_Z16HashTableDumpTxtP9HashTablePKciS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z16HashTableDumpTxtP9HashTablePKciS2_
_Z16HashTableDumpTxtP9HashTablePKciS2_:
.LFB553:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movl	%r8d, 48(%rbp)
	movq	%r9, 56(%rbp)
	cmpq	$0, 32(%rbp)
	jne	.L95
	leaq	.LC10(%rip), %r9
	leaq	.LC1(%rip), %r8
	leaq	.LC49(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L96
.L95:
	leaq	.LC32(%rip), %rdx
	leaq	.LC50(%rip), %rcx
	call	fopen
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L97
	leaq	.LC34(%rip), %r9
	leaq	.LC51(%rip), %r8
	leaq	.LC49(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L96
.L97:
	movq	32(%rbp), %rax
	movq	24(%rax), %rcx
	movq	40(%rbp), %r8
	movq	-16(%rbp), %rax
	movl	48(%rbp), %edx
	movl	%edx, 40(%rsp)
	movq	56(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	leaq	.LC52(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	32(%rbp), %rax
	movl	8(%rax), %edx
	movq	32(%rbp), %rax
	movq	(%rax), %rcx
	movq	-16(%rbp), %rax
	movl	%edx, 32(%rsp)
	movq	%rcx, %r9
	movq	32(%rbp), %r8
	leaq	.LC53(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L98
	movl	$0, -4(%rbp)
.L101:
	cmpl	$15, -4(%rbp)
	jg	.L98
	movl	-4(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC54(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	32(%rbp), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	48(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC55(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-24(%rbp), %rax
	movq	(%rax), %r11
	movq	-24(%rbp), %rax
	movq	8(%rax), %r10
	movq	-24(%rbp), %rax
	movq	16(%rax), %r9
	movq	-24(%rbp), %rax
	movl	24(%rax), %r8d
	movq	-24(%rbp), %rax
	movl	32(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	28(%rax), %edx
	movq	-24(%rbp), %rax
	movl	36(%rax), %esi
	movq	-24(%rbp), %rax
	movl	40(%rax), %ebx
	movq	-16(%rbp), %rax
	movq	%r11, 72(%rsp)
	movq	%r10, 64(%rsp)
	movq	%r9, 56(%rsp)
	movl	%r8d, 48(%rsp)
	movl	%ecx, 40(%rsp)
	movl	%edx, 32(%rsp)
	movl	%esi, %r9d
	movl	%ebx, %r8d
	leaq	.LC56(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L99
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L99
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L99
	movl	$0, -8(%rbp)
.L100:
	movq	-24(%rbp), %rax
	movl	40(%rax), %eax
	subl	$1, %eax
	cmpl	%eax, -8(%rbp)
	jge	.L99
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movq	(%rax), %r8
	movl	-8(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%r8, %rax
	movq	(%rax), %r9
	movl	-8(%rbp), %r8d
	movq	-16(%rbp), %rax
	movl	%ecx, 40(%rsp)
	movl	%edx, 32(%rsp)
	leaq	.LC57(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	addl	$1, -8(%rbp)
	jmp	.L100
.L99:
	movq	-16(%rbp), %rax
	movq	%rax, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC58(%rip), %rcx
	call	fwrite
	addl	$1, -4(%rbp)
	jmp	.L101
.L98:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	ferror
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L102
	leaq	.LC49(%rip), %rdx
	leaq	.LC48(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L96
.L102:
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	$0, %eax
.L96:
	addq	$112, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC59:
	.ascii "ZERO PTR ARRAY INPUT\0"
.LC60:
	.ascii "size_array\0"
.LC61:
	.ascii "MakeDiagram\0"
.LC62:
	.ascii "ZERO PTR FILE INPUT\0"
.LC63:
	.ascii "file_output\0"
.LC64:
	.ascii "Hash_%d;\0"
.LC65:
	.ascii "%d;\0"
.LC66:
	.ascii "\12\12\0"
	.text
	.globl	_Z11MakeDiagramPiP6_iobuf
	.def	_Z11MakeDiagramPiP6_iobuf;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z11MakeDiagramPiP6_iobuf
_Z11MakeDiagramPiP6_iobuf:
.LFB554:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L104
	leaq	.LC59(%rip), %r9
	leaq	.LC60(%rip), %r8
	leaq	.LC61(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L105
.L104:
	cmpq	$0, 24(%rbp)
	jne	.L106
	leaq	.LC62(%rip), %r9
	leaq	.LC63(%rip), %r8
	leaq	.LC61(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L105
.L106:
	movl	$0, -4(%rbp)
.L110:
	cmpl	$5, -4(%rbp)
	jg	.L107
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC64(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, -8(%rbp)
.L109:
	cmpl	$15, -8(%rbp)
	jg	.L108
	movl	-4(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC65(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	addl	$1, -8(%rbp)
	jmp	.L109
.L108:
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	.LC66(%rip), %rcx
	call	fwrite
	addl	$1, -4(%rbp)
	jmp	.L110
.L107:
	movl	$0, %eax
.L105:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC67:
	.ascii "MakeHashNDiagram\0"
.LC68:
	.ascii "ERROR CALLOC\0"
	.text
	.globl	_Z16MakeHashNDiagramP9HashTableP6OneginiP6_iobuf
	.def	_Z16MakeHashNDiagramP9HashTableP6OneginiP6_iobuf;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z16MakeHashNDiagramP9HashTableP6OneginiP6_iobuf
_Z16MakeHashNDiagramP9HashTableP6OneginiP6_iobuf:
.LFB555:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L112
	leaq	.LC10(%rip), %r9
	leaq	.LC1(%rip), %r8
	leaq	.LC67(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L113
.L112:
	cmpq	$0, 40(%rbp)
	jne	.L114
	leaq	.LC62(%rip), %r9
	leaq	.LC63(%rip), %r8
	leaq	.LC67(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L113
.L114:
	cmpq	$0, 24(%rbp)
	jne	.L115
	leaq	.LC15(%rip), %r9
	leaq	.LC16(%rip), %r8
	leaq	.LC67(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L113
.L115:
	movl	$4, %edx
	movl	$96, %ecx
	call	calloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L116
	leaq	.LC68(%rip), %r9
	leaq	.LC60(%rip), %r8
	leaq	.LC67(%rip), %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$-1, %eax
	jmp	.L113
.L116:
	movq	16(%rbp), %rax
	movl	$1, 8(%rax)
	movq	16(%rbp), %rcx
	call	_Z14HashTableClearP9HashTable
	movq	16(%rbp), %rax
	leaq	_Z11HashFuncOnePc(%rip), %rdx
	movq	%rdx, 16(%rax)
	movl	32(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_Z9FHashPushP9HashTableP6Onegini
	movl	$0, -4(%rbp)
.L118:
	cmpl	$15, -4(%rbp)
	jg	.L117
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movl	36(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -4(%rbp)
	jmp	.L118
.L117:
	movq	16(%rbp), %rcx
	call	_Z14HashTableClearP9HashTable
	movq	16(%rbp), %rax
	leaq	_Z24HashFuncAsciiFirstLetterPc(%rip), %rdx
	movq	%rdx, 16(%rax)
	movl	32(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_Z9FHashPushP9HashTableP6Onegini
	movl	$0, -8(%rbp)
.L120:
	cmpl	$15, -8(%rbp)
	jg	.L119
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$16, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movl	36(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -8(%rbp)
	jmp	.L120
.L119:
	movq	16(%rbp), %rcx
	call	_Z14HashTableClearP9HashTable
	movq	16(%rbp), %rax
	leaq	_Z14HashFuncLengthPc(%rip), %rdx
	movq	%rdx, 16(%rax)
	movl	32(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_Z9FHashPushP9HashTableP6Onegini
	movl	$0, -12(%rbp)
.L122:
	cmpl	$15, -12(%rbp)
	jg	.L121
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$32, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movl	36(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -12(%rbp)
	jmp	.L122
.L121:
	movq	16(%rbp), %rcx
	call	_Z14HashTableClearP9HashTable
	movq	16(%rbp), %rax
	leaq	_Z22HashFuncAsciiAllLetersPc(%rip), %rdx
	movq	%rdx, 16(%rax)
	movl	32(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_Z9FHashPushP9HashTableP6Onegini
	movl	$0, -16(%rbp)
.L124:
	cmpl	$15, -16(%rbp)
	jg	.L123
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-16(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	addq	$48, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movl	36(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -16(%rbp)
	jmp	.L124
.L123:
	movq	16(%rbp), %rcx
	call	_Z14HashTableClearP9HashTable
	movq	16(%rbp), %rax
	leaq	_Z11HashFuncRolPc(%rip), %rdx
	movq	%rdx, 16(%rax)
	movl	32(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_Z9FHashPushP9HashTableP6Onegini
	movl	$0, -20(%rbp)
.L126:
	cmpl	$15, -20(%rbp)
	jg	.L125
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-20(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	addq	$64, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movl	36(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -20(%rbp)
	jmp	.L126
.L125:
	movq	16(%rbp), %rcx
	call	_Z14HashTableClearP9HashTable
	movq	16(%rbp), %rax
	leaq	_Z11MurmurHash2Pc(%rip), %rdx
	movq	%rdx, 16(%rax)
	movl	32(%rbp), %edx
	movq	24(%rbp), %rax
	movl	%edx, %r8d
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_Z9FHashPushP9HashTableP6Onegini
	movl	$0, -24(%rbp)
.L128:
	cmpl	$15, -24(%rbp)
	jg	.L127
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-24(%rbp), %eax
	cltq
	salq	$6, %rax
	addq	%rdx, %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	addq	$80, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movl	36(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -24(%rbp)
	jmp	.L128
.L127:
	movq	40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_Z11MakeDiagramPiP6_iobuf
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	$0, %eax
.L113:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZSt3powIiiEN9__gnu_cxx11__promote_2IT_T0_NS0_9__promoteIS2_XsrSt12__is_integerIS2_E7__valueEE6__typeENS4_IS3_XsrS5_IS3_E7__valueEE6__typeEE6__typeES2_S3_,"x"
	.linkonce discard
	.globl	_ZSt3powIiiEN9__gnu_cxx11__promote_2IT_T0_NS0_9__promoteIS2_XsrSt12__is_integerIS2_E7__valueEE6__typeENS4_IS3_XsrS5_IS3_E7__valueEE6__typeEE6__typeES2_S3_
	.def	_ZSt3powIiiEN9__gnu_cxx11__promote_2IT_T0_NS0_9__promoteIS2_XsrSt12__is_integerIS2_E7__valueEE6__typeENS4_IS3_XsrS5_IS3_E7__valueEE6__typeEE6__typeES2_S3_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt3powIiiEN9__gnu_cxx11__promote_2IT_T0_NS0_9__promoteIS2_XsrSt12__is_integerIS2_E7__valueEE6__typeENS4_IS3_XsrS5_IS3_E7__valueEE6__typeEE6__typeES2_S3_
_ZSt3powIiiEN9__gnu_cxx11__promote_2IT_T0_NS0_9__promoteIS2_XsrSt12__is_integerIS2_E7__valueEE6__typeENS4_IS3_XsrS5_IS3_E7__valueEE6__typeEE6__typeES2_S3_:
.LFB584:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	24(%rbp), %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdl	16(%rbp), %xmm2
	movq	%xmm2, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 10.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	calloc;	.scl	2;	.type	32;	.endef
	.def	_Z9list_ctorP4List;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	_Z9list_dtorP4List;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	_Z13list_end_pushPcP4List;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	_Z17list_clean_repeatP4List;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	_Z15list_verificateP4List;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	ferror;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	pow;	.scl	2;	.type	32;	.endef
