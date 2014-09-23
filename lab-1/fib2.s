#if __ARM_ARCH_ISA_THUMB ==2
	.syntax unified
#else
	.syntax divided
#endif

#if defined(__ARM_ARCH_7A__)
	.arch armv7-a
#endif
#if defined(__ARM_ARCH_6ZK__ )
	.arch armv6zk
#endif
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	@ R4 = R0 - 0 (update flags)
	sub r4, r0, #0
	
	@ if(R0 <= 0) goto .L3 (which returns 0)
	cmp r0, #0
	ble .L3
	
	@ Compare R4 wtih 1
	@ If R4 == 1 goto .L4 (which returns 1)
	cmp r4, #1
	beq .L4
	
	mov r1, #0
	mov r2, #1
.L5:
	add r0, r1, r2	
	mov r1, r2
	mov r2, r0
	sub r4, #1
	cmp r4, #1
	bgt .L5 
	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
