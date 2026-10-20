.data
	Vector1: .word 1 2 3 4 5 6 7 8 9
	Vector2: .word -1 2 -3 4 -5 6 -7 8 -9

.text	
	lui  s0, %hi(Vector1)
    addi s0, s0, %lo(Vector1)
    lui  s1, %hi(Vector2)
    addi s1, s1, %lo(Vector2)
    addi s2,zero,0 #int i = 0;
	addi t0,zero,0 #int resultado = 0; 
	addi t1, zero, 36

#!(i<9)
for: bge s2, t1, endfor
	add t2, s0, s2      # t2 = dirección de Vector1[i]
    lw  a0, 0(t2)       # a0 = Vector1[i]
	add t2, s1, s2      # t2 = dirección de Vector2[i]
	lw  a1, 0(t2)       # a1 = Vector2[i]
	jal ra,ProductoPunto # a0 = a0 * a1
	add t0, t0, a0 #resultado += a0
	addi s2, s2, 4 #i += 1
	jal zero,for

endfor: jal  zero, exit

ProductoPunto:
 	mul a0,a0,a1
 	jr ra #return;

exit:nop
