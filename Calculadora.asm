.text 
	addi s0,zero,3 #int selector = 0;
	addi s1,zero,5 #int a = 5; 
	addi s2,zero,3 #int b = 3; 
	addi s3,zero,0 #int c = 0;


addi t0, zero, 1
        beq  s0, t0, case1     # si x == 1, salta a case1
        addi t0, zero, 2
        beq  s0, t0, case2     # si x == 2, salta a case2
	addi t0, zero, 3
        beq  s0, t0, case3     # si x == 3, salta a case3
        
        # default (si no coincidió ninguno)
        jal andBitwise
        jal  zero, end         # break

case1:	jal suma #suma()
        jal  zero, end         # break

case2: jal resta #resta()
        jal  zero, end         # break
        
case3:  jal multiplica #multiplica()
        jal  zero, end         # break
        
suma: 	add s3,s1,s2 # c = a + b;
	jr ra #return
	
resta: 	sub s3,s1,s2 # c = a - b;
	jr ra #return
	
multiplica: mul s3,s1,s2 # c = a * b;
	jr ra #return
	
andBitwise: and s3,s1,s2 # c = a & b;
	jr ra #return

end:    nop
 
	
	
