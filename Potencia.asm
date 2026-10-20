.text
main:
    addi a1, zero, 6        # m = 6
    addi a2, zero, 6        # n = 6
    jal  ra, potencia
    jal  zero, exit

potencia:
	addi t0, zero, 1
	bge a2, t0, recursivo # if(n<t0);
	addi a0, zero, 1 #a0 = 1;
	jalr zero, ra, 0 #return;

recursivo:
   	addi sp, sp, -8
	sw ra, 0(sp)
	sw a1, 4(sp)
	addi a2,a2, -1 # n -=1;
    	jal  ra, potencia
	lw a1, 4(sp)
	lw ra, 0(sp)
	addi sp, sp, 8
	mul a0,a1,a0
	jr ra #return;

exit: nop
