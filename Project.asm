.data
array:			.space		1000
sort_array:		.space		50	
menu: 			.asciiz 	"D:\COAL LAB PROJECT\menu.txt"
source:			.asciiz		"D:\COAL LAB PROJECT\pseudocode.txt"
input_buffer:	.space		10000 	
star:			.asciiz		"*  "
line:			.asciiz		"\n"
sol_msg:		.asciiz		"\n\n\n\t\t\t*************************\n\t\t\t Solution of the Problem\n\t\t\t*************************\n\n"
code_msg:		.asciiz		"\n\n\n\t\t\t*************************\n\t\t\tSourceCode of the Problem\n\t\t\t*************************\n\n"
enter_choice:	.asciiz		"\n\nEnter Your Code (choice) : "	
choice1_msg1:	.asciiz		"Enter N (number of rows ) for pyramid : "
choice3_msg1:	.asciiz		"Enter 10 values for array : \n"
choice3_msg2:	.asciiz		"Array after performing BUBBLESORT : \n"
choice4_msg1:	.asciiz		"Enter Number to check whether it is palindrome or not : "
choice4_true:	.asciiz		"It is a palindrome number"
choice4_false:	.asciiz		"It is not a palindrome number"
choice5_msg1:	.asciiz		"Enter Number in Decimal : "
choice5_msg2:	.asciiz		"Number in Binary is : "
choice6_msg1:	.asciiz		"Enter Number in Binary : "
choice6_msg2:	.asciiz		"Number in Decimal is : "
choice7_msg1:	.asciiz		"Enter number to reverse : "
choice7_msg2:	.asciiz		"Reversed Number : "
choice8_msg:	.asciiz		"Enter Number to check if it is a perfect number or not : "
choice8_true:	.asciiz		"It is a perfect number"
choice8_false:	.asciiz		"It is not a perfect number"
choice9_msg:	.asciiz		"Enter three digit Number to check whether it is armstrong number or not : "
choice9_true:	.asciiz		"It is an Armstrong number"
choice9_false:	.asciiz		"It is not an Armstrong number"
choice10_msg:	.asciiz		"Enter an year to check whether it is a leap year or not : "
choice10_true:	.asciiz		"It is a Leap Year"
choice10_false:	.asciiz		"It is not a Leap year"
code1:			.asciiz		"\n.data\nchoice1_msg1:	.asciiz		'Enter N (number of rows ) for pyramid : '\n star:			.asciiz		'*  '\n line:			.asciiz		'\ n'\n.text\n.globl main\nmain:\nla $a0,choice1_msg1\nli $v0,4\nsyscall\nli $v0,5\nsyscall\nmove $t0,$v0 #$t0 contain N\nli $t1,0 #i\nli $t2,0 #j\nc10:\nbgt $t1,$t0,exit	\nc11:\nbge $t2,$t1,end_c11\nla $a0,star\nli $v0,4\nsyscall\naddi $t2,$t2,1\nb c11\nend_c11:\nli $t2,0 #j=0\nli $v0,4\nla $a0,line\nsyscall\naddi $t1,$t1,1\nb c10\nexit:\nli $v0,10\nsyscall\n"
code2:			.asciiz		"\n.data\nchoice1_msg1:	.asciiz		'Enter N (number of rows ) for pyramid : '\n star:			.asciiz		'*  ' \nline:			.asciiz		'\ n'\n.text\n.globl main\nmain:\n\nla $a0,choice1_msg1\nli $v0,4\nsyscall\nli $v0,5\nsyscall\nmove $t0,$v0 #$t0 contain N\n	li $t1,0 #i\n	move $t2,$t0 #j\nc20:\n	bgt $t1,$t0,exit\n	move $t2,$t0\nc21:\n	\n	blt $t2,$t1,end_c21\n	\n	la $a0,star\n	li $v0,4\n	syscall\n	\n	subu $t2,$t2,1\n	b c21\nend_c21:\n\n	li $t2,0 #j=0\n	li $v0,4\n	la $a0,line\n	syscall\n	\n	addi $t1,$t1,1\n	b c20\n\nexit:\n	li $v0,10\n	syscall"
code3:			.asciiz		"\n.data\nsort_array:		.space		50	\nchoice3_msg1:	.asciiz		'Enter 10 values for array : \n'\nchoice3_msg2:	.asciiz		'Array after performing BUBBLESORT : \n'\nline:			.asciiz		'\n'\n.text\n.globl main\nmain:\n\n\nBubbleSort:\nla $a0,choice3_msg1\nli $v0,4\nsyscall\n\n\nla $t0,sort_array\nli $t1,0 #i\n\nc30:		#input\n	beq $t1,10,end_c30\n	li $v0,5\n	syscall\n	move $t2,$v0\n	sw $t2,($t0)\n	addi $t0,$t0,4\n	addi $t1,$t1,1\n	b c30\n\nend_c30:\n\n\n	la $a0,choice3_msg2\n	li $v0,4\n	syscall\n\n	la $t0,sort_array\n\n	li $t1,0	\n	li $t2,0\n\n\nc31:\n	bgt $t1,10,print_3\n	lw $t3,($t0) #t3= a[i]\n	move $t4,$t0\n	addi $t4,$t4,4 # loop will start from j=i+1\n	move $t2,$t1\n	addi $t2,$t2,1\n	addi $t2,$t2,1\nc32:\n	bgt $t2,10,end_c32\n	lw $t5,($t4)\n	blt $t5,$t3,swap_3\nafter_swap:\n	addi $t2,$t2,1\n	addi $t4,$t4,4\n	b c32\n\nend_c32:\n\n	addi $t0,$t0,4\n	addi $t1,$t1,1\n	b c31\n\nswap_3:\n\nsw $t5,($t0)\nsw $t3,($t4)\nmove $t3,$t5\nb after_swap\n\n\nprint_3:\n\n	la $t0,sort_array\n	li $t1,0 #counter\n\nprint_31:\n	beq $t1,10,exit\n	lw $a0,($t0)\n	li $v0,1\n	syscall\n\n	la $a0,line\n	li $v0,4\n	syscall\n	\n	addi $t0,$t0,4\n	addi $t1,$t1,1\n	b print_31\n	\n\nexit:\n li $v0,10\n syscall"
code4:			.asciiz		"\n.data\nchoice4_msg1:	.asciiz		'Enter Number to check whether it is palindrome or not : '\nchoice4_true:	.asciiz		'It is a palindrome number'\nchoice4_false:	.asciiz		'It is not a palindrome number'\n.text\n.globl main\nmain:\n\nPalindrome:\n\n	la $a0,choice4_msg1\n	li $v0,4\n	syscall\n	\n	li $v0,5\n	syscall\n	\n	move $t7,$v0 # Entered number is in $t7\n	move $t5,$t7 #temp\n	\n	li $t0,0 #rev\n	li $t6,10 # load 10 in $t6\n\nc40:\n	beq $t7,0,end_c40  #while(number is not equal to 0)\n	mul $t0,$t0,10\n	div $t7,$t7,$t6\n	mfhi $t4 #rem\n	add $t0,$t0,$t4\n	b c40\n	\nend_c40:\n\n	beq $t0,$t5,c40_yes #branch if palindrome\n	la $a0,choice4_false		#else not palindrome\n	li $v0,4\n	syscall\n	b exit\n	\nc40_yes:\n	la $a0,choice4_true\n	li $v0,4\n	syscall\n	b exit\n\nexit:\n	li $v0,10\n	syscall"
code5:			.asciiz		"\n.data\nchoice5_msg1:	.asciiz		'Enter Number in Decimal : '\nchoice5_msg2:	.asciiz		'Number in Binary is : '\n.text\n.globl main\nmain:\n\nDecimalToBinary:\n\nla $a0,choice5_msg1\nli $v0,4\nsyscall\n\nli $v0,5\nsyscall\nmove $t0,$v0 #decimal number in $t\n\n\nla $t7,array #storing in array .. as we need to reverse it\nla $t6,array #for comparing\n\n\nbeq $t0,0,out_zero #special case for 0 input\n\n\n\nc50:\n	beq $t0,0,end_c50\n	move $t1,$t0 #temp\n	div $t0,$t0,2\n	mfhi $t2\n	sw $t2,($t7)\n	addi $t7,$t7,4\n	\n	b c50\n\nend_c50:\n	la $a0,choice5_msg2\n	li $v0,4\n	syscall\n\n	subu $t7,$t7,4 #qk end me ek extra add hogya tha\n\nprint_5:\n\n	blt $t7,$t6,exit\n	lw $a0,($t7)\n	li $v0,1\n	syscall\n	subu $t7,$t7,4\n	b print_5\n	\nout_zero:\n\nla $a0,choice5_msg2\nli $v0,4\nsyscall\n\nli $a0,0\nli $v0,1\nsyscall\n \nb exit\n \nexit:\n	li $v0,10\n	syscall"
code6:			.asciiz		"\n.data\nchoice6_msg1:	.asciiz		'Enter Number in Binary : '\nchoice6_msg2:	.asciiz		'Number in Decimal is : '\n.text\n.globl main\nmain:\nBinaryToDecimal:\n\nla $a0,choice6_msg1\nli $v0,4\nsyscall\n\nli $v0,5\nsyscall\nmove $t0,$v0 #binary number in $t0\n\nla $a0,choice6_msg2\nli $v0,4\nsyscall\n\nli $t3,1 #base=1\nli $t4,0 #dec=0\n\nc60:\nbeq $t0,0,print_6 #while(num>0)\ndiv $t0,$t0,10 #num = num /10\nmfhi $t2\nmul $t2,$t2,$t3 #rem = rem*base\nadd $t4,$t4,$t2\nmul $t3,$t3,2\nb c60\n\nprint_6:\nmove $a0,$t4\nli $v0,1\nsyscall\nb exit\n\nexit:\nli $v0,10\nsyscall"
code7:			.asciiz		"\n.data\nchoice7_msg1:	.asciiz		'Enter number to reverse : '\nchoice7_msg2:	.asciiz		'Reversed Number : '\n.text\n.globl main\nmain:\nReverseNumber:\n\n	la $a0,choice7_msg1\n	li $v0,4\n	syscall\n	\n	li $v0,5\n	syscall\n	\n	move $t7,$v0 # Entered number is in $t7\n	\n	li $t0,0 #rev\n	li $t6,10 # load 10 in $t6\n\nc70:\n	beq $t7,0,end_c70  #while(number is not equal to 0)\n	mul $t0,$t0,10\n	div $t7,$t7,$t6\n	mfhi $t4 #rem\n	add $t0,$t0,$t4\n	b c70\n\nend_c70:\n	\n	la $a0,choice7_msg2\n	li $v0,4\n	syscall\n	\n	move $a0,$t0\n	li $v0,1\n	syscall\n	\n	b exit\nexit:\nli $v0,10\nsyscall"
code8:			.asciiz		"\n.data\nchoice8_msg:	.asciiz		'Enter Number to check if it is a perfect number or not : '\nchoice8_true:	.asciiz		'It is a perfect number'\nchoice8_false:	.asciiz		'It is not a perfect number'\n.text\n.globl main\n\nmain:\nPerfectNum:\n\n	la $a0,choice8_msg\n	li $v0,4\n	syscall\n	\n	li $v0,5\n	syscall\n	move $t0,$v0 #input number in $t0\n\n	li $t1,1 #i\n	move $t2,$t0\n	sub $t2,$t2,1 #loop till this\n	li $t6,0 #sum\n	\nc80:\n	bgt $t1,$t2,print_80\n	\n	div $t7,$t0,$t1\n	mfhi $t7 #rem = num %i\n	beq $t7,0,sum_8\naftersum_8:\n	addi $t1,$t1,1\n	b c80\n	\nsum_8:\n	add $t6,$t6,$t1\n	b aftersum_8\n\nprint_80:\n	beq $t6,$t0,c80_yes #if sum==num then print perfect number\n	la $a0,choice8_false\n	li $v0,4\n	syscall\n	b exit\n	\n	\nc80_yes:\n	la $a0,choice8_true\n	li $v0,4\n	syscall\n	b exit\n	\nexit:\n	li $v0,10\n	syscall"
code9:			.asciiz		"\n.data\nchoice9_msg:	.asciiz		'Enter three digit Number to check whether it is armstrong number or not : '\nchoice9_true:	.asciiz		'It is an Armstrong number'\nchoice9_false:	.asciiz		'It is not an Armstrong number'\n.text\n.globl main\nmain:\n\narmstrong:\n\n	la $a0,choice9_msg\n	li $v0,4\n	syscall\n	\n	li $v0,5\n	syscall\n	move $t0,$v0 #input number in $t0\n	\n	move $t1,$t0 #temp(t1) = number\n	\nc90:\n	beq $t1,0,end_c90\n	div $t1,$t1,10				#rem = $t1%10\n	mfhi $t2\n	move $t4,$t2\n	mul $t2,$t2,$t2\n	mul $t2,$t2,$t4\n	add $t3,$t3,$t2  #result($t3)+=rem*rem*rem\n	b c90\n\nend_c90:\n	beq $t3,$t0,armstrong_true #it is armstrong\n	la $a0,choice9_false #else\n	li $v0,4\n	syscall\n	b exit\n	\narmstrong_true:\n	la $a0,choice9_true\n	li $v0,4\n	syscall\n	b exit\n	\nexit:\n	li $v0,10\n	syscall"
code10:			.asciiz		"\n.data\nchoice10_msg:	.asciiz		'Enter an year to check whether it is a leap year or not : '\nchoice10_true:	.asciiz		'It is a Leap Year'\nchoice10_false:	.asciiz		'It is not a Leap year'\n.text\n.globl main\nmain:\n\nleapyear:\n\n	la $a0,choice10_msg\n	li $v0,4\n	syscall\n	\n	li $v0,5\n	syscall\n	\n	move $t7,$v0 # Entered year is in $t7\n	\n	div $t0,$t7,4\n	mfhi $t0\n	\n	beq $t0,0,ItsLeap #true\n	la $a0,choice10_false\n	li $v0,4\n	syscall\n	b exit\n	\n\nItsLeap:\n	la $a0,choice10_true\n	li $v0,4\n	syscall\n	b exit\n\n\nexit:\n	li $v0,10\n	syscall" 
pseudo1:		.asciiz		"Pseudocode for printing half pyramid:\n\nInput n.\nloop from i =i to i<=1 [outer loop].\n	loop from j=1 to j<=i [inner loop].\n	print '  * '\n	[end of inner loop]\n	print '\ n'\n	[end of outer loop]\nexit"
pseudo2:		.asciiz		"Pseudocode for printing half inverted pyramid:\n\nInput n.\nloop from i =n to i>=1 [outer loop].\n	loop from j=1 to j<=i [inner loop]\n	print '  * '\n	[end of inner loop]\n	print '\ n'\n	[end of outer loop]\nexit"					
pseudo3:		.asciiz		"Pseudocode for BUBBLE SORT:\n\n    for i from 1 to N [outer loop]\n       for j from i+1 to N  [inner loop]\n         if a[i] > a[j]\n           swap( a[i], a[j] )\n[end of inner loop]\n[end of outer loop]\nexit"
pseudo4:		.asciiz		"Pseudocode for Palindrome Number:\n\nInput n \nSet temp=n \nSet rev=0 \nSet rem=0 \n	Loop While temp!=0\nSetrem=temp%10 \n	Set rev=rev*10+rem \n	Set temp=temp/10 \n	[End loop] \nIf rev=n Then \n'Its is palindrome' \nElse \n'Its not palindrome'\n[EndIf]\nexit"
pseudo5:		.asciiz		"Pseudocode for Decimal to Binary:\n\nInput N.\nDeclare array[]\nint i=0 \n	loop while N!=0\n	array[i]=N%2\n	N=N/2\n	i=i+1\n	[end of loop]\nprint array[] in reverse \nexit"
pseudo6:		.asciiz     "Pseudocode for Binary to Decimal:\n\nInput N.\nSet base =1.\nSet bin = N.\n	loop while(N>0)\n	Set rem = N %10.\n	Set dec = dec + rem * base\n	Set base = base * 2.\n	Set N = N / 10\n	[end of while loop]\nprint 'dec'\nexit"
pseudo7:		.asciiz		"Pseudocode for Reverse Number : \n\nInput N.\nSet rev = 0;\n	loop while(N!=0)\n	Set rev = rev * 10		\n	Set rev = rev + N/10\n	Set N = N/10\n	[end of loop]\nprint rev\nexit"
pseudo8:		.asciiz		"Pseudocode for Perfect Number:\n\nInput n. \nSet sum=0\nloop from i =1 to i<=n.\n	if(n%i==0)\n	Set sum=sum+i\n	[end if]	 \n	[end of loop]\nif(sum=n)\nIt is a perfect Number\nelse\nIt is not a perfect Number\n[end if]	\n\nexit"
pseudo9:		.asciiz		"Pseudocode for Armstrong Number:\n\nInput N\nSet temp = N \nSet rem   = 0\nSet sum 	= 0\n 	loop  WHILE temp!= 0 \n      	rem = temp % 10\n      	sum = sum + (rem*rem*rem)\n	temp = temp / 10\n    	[END while loop]\n      \n   IF (sum = number)\n      PRINT armstrong\n   ELSE\n      PRINT not an armstrong \n  END IF\nExit"
pseudo10:		.asciiz		"Pseudocode for Leap Year:\n\nInput Year\nIF Year%4 = 0\nthen It is a leap year\nELSE\nIt is not a leap year\n\nexit"
 .text
 .globl main
 main:
 
li $v0,13	# System call for opening the file
la $a0, menu
li $a1,0		# Opening the File for reading  (Flags are 0: Read, 1:Write)
li $a2,0		# Mode is ignored
syscall		# Open the File (File descriptor returned in $v0)
move $t6,$v0
# Now Read from the File 
li $v0, 14		# System call for reading from  the file
move $a0, $t6		#Copying the file descriptor
la $a1, input_buffer	#Address of input buffer; at this address the content of file would be written 
li $a2, 10000		#Size of input buffer
syscall
# Now Close the file
li $v0, 16	# System call for closing the file
move $a0, $t6	# Copying file descriptor
syscall


la $a0,input_buffer
li $v0,4
syscall



 
 
 
 li $v0,4
 la $a0,enter_choice
 syscall
 
 
 
 
li $v0,5
syscall
move $t0,$v0 #choice in $t0



la $a0,sol_msg
li $v0,4
syscall




beq $t0,1,half_pyramid
beq $t0,2,inverted_half_pyramid
beq $t0,3,BubbleSort
beq $t0,4,Palindrome
beq $t0,5,DecimalToBinary
beq $t0,6,BinaryToDecimal
beq $t0,7,ReverseNumber
beq $t0,8,PerfectNum #Number is a perfect number if the sum of its divisors is equal to the number example: (6 is a perfect number because the its divisors are 1,2,3 and 1+2+3=6 )
beq $t0,9,armstrong #Number is an armstrong number if the sum of cubes of each digits is equal to the number itself (153 is an armstrong number because 153 = 1*1*1 + 5*5*5 + 3*3*3)
beq $t0,10,leapyear 





#********************************choice1**********************#
half_pyramid:

la $a0,choice1_msg1
li $v0,4
syscall
li $v0,5
syscall
move $t0,$v0 #$t0 contain N


	li $t1,0 #i
	li $t2,0 #j
c10:
	bgt $t1,$t0,end_c10
	
c11:
	bge $t2,$t1,end_c11
	
	la $a0,star
	li $v0,4
	syscall
	
	addi $t2,$t2,1
	b c11
end_c11:
	li $t2,0 #j=0
	li $v0,4
	la $a0,line
	syscall
	

	addi $t1,$t1,1
	b c10
	
end_c10:



la $a0,code_msg
li $v0,4
syscall

la $a0,code1
li $v0,4
syscall



li $v0,13	# System call for opening the file
la $a0, source
li $a1,1		# Opening the File for writing  (Flags are 0: Read, 1:Write, 9:Write and append)
li $a2,0		# Mode is ignored
syscall		# Open the File (File descriptor returned in $v0)
move $t6,$v0

# Now Write in the File 
li $v0, 15	# System call for writing in the file
move $a0, $t6	#Copying the file descriptor
la $a1,	pseudo1	#Address of buffer from which to write
li $a2, 196	#Buffer length
syscall

# Now Close the file
li $v0, 16	# System call for closing the file
move $a0, $t6	# Copying file descriptor
syscall

b exit






#*************************************************************#



#********************************choice2**********************#




inverted_half_pyramid:

la $a0,choice1_msg1
li $v0,4
syscall
li $v0,5
syscall
move $t0,$v0 #$t0 contain N


	li $t1,0 #i
	move $t2,$t0 #j
c20:
	bgt $t1,$t0,inv
	move $t2,$t0
c21:
	
	blt $t2,$t1,end_c21
	
	la $a0,star
	li $v0,4
	syscall
	
	subu $t2,$t2,1
	b c21
end_c21:

	li $t2,0 #j=0
	li $v0,4
	la $a0,line
	syscall
	

	addi $t1,$t1,1
	b c20

	
inv:


la $a0,code_msg
li $v0,4
syscall

la $a0,code2
li $v0,4
syscall

	
li $v0,13	# System call for opening the file
la $a0, source
li $a1,1		# Opening the File for writing  (Flags are 0: Read, 1:Write, 9:Write and append)
li $a2,0		# Mode is ignored
syscall		# Open the File (File descriptor returned in $v0)
move $t6,$v0

# Now Write in the File 
li $v0, 15	# System call for writing in the file
move $a0, $t6	#Copying the file descriptor
la $a1, pseudo2	#Address of buffer from which to write
li $a2, 203	#Buffer length
syscall

# Now Close the file
li $v0, 16	# System call for closing the file
move $a0, $t6	# Copying file descriptor
syscall
	
	
b exit
	
	

#*************************************************************#




#********************************choice3**********************#

BubbleSort:

la $a0,choice3_msg1
li $v0,4
syscall


la $t0,sort_array
li $t1,0 #i

c30:		#input
	beq $t1,10,end_c30
	li $v0,5
	syscall
	move $t2,$v0
	sw $t2,($t0)
	addi $t0,$t0,4
	addi $t1,$t1,1
	b c30

end_c30:


	la $a0,choice3_msg2
	li $v0,4
	syscall


	la $t0,sort_array

	li $t1,0	
	li $t2,0


c31:
	bgt $t1,10,print_3
	lw $t3,($t0) #t3= a[i]
	move $t4,$t0
	addi $t4,$t4,4 # loop will start from j=i+1
	move $t2,$t1
	addi $t2,$t2,1
	addi $t2,$t2,1
c32:
	bgt $t2,10,end_c32
	lw $t5,($t4)
	blt $t5,$t3,swap_3
after_swap:
	addi $t2,$t2,1
	addi $t4,$t4,4
	b c32

end_c32:

	addi $t0,$t0,4
	addi $t1,$t1,1
	b c31


swap_3:

sw $t5,($t0)
sw $t3,($t4)
move $t3,$t5


	b after_swap


print_3:

	la $t0,sort_array
	li $t1,0 #counter

print_31:

	beq $t1,10,bubble
	lw $a0,($t0)
	li $v0,1
	syscall
	
	la $a0,line
	li $v0,4
	syscall
	
	addi $t0,$t0,4
	addi $t1,$t1,1
	b print_31
	

bubble:

la $a0,code_msg
li $v0,4
syscall

la $a0,code3
li $v0,4
syscall




li $v0,13	# System call for opening the file
la $a0, source
li $a1,1		# Opening the File for writing  (Flags are 0: Read, 1:Write, 9:Write and append)
li $a2,0		# Mode is ignored
syscall		# Open the File (File descriptor returned in $v0)
move $t6,$v0

# Now Write in the File 
li $v0, 15	# System call for writing in the file
move $a0, $t6	#Copying the file descriptor
la $a1, pseudo3	#Address of buffer from which to write
li $a2, 203 #Buffer length
syscall

# Now Close the file
li $v0, 16	# System call for closing the file
move $a0, $t6	# Copying file descriptor
syscall
	
	
b exit





#*************************************************************#


#********************************choice4**********************#
Palindrome:

	la $a0,choice4_msg1
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	
	
	
	move $t7,$v0 # Entered number is in $t7
	move $t5,$t7 #temp
	
	li $t0,0 #rev
	li $t6,10 # load 10 in $t6

c40:
	beq $t7,0,end_c40  #while(number is not equal to 0)
	mul $t0,$t0,10
	div $t7,$t7,$t6
	mfhi $t4 #rem
	add $t0,$t0,$t4
	b c40
	
end_c40:

	beq $t0,$t5,c40_yes #branch if palindrome
	la $a0,choice4_false		#else not palindrome
	li $v0,4
	syscall
	b pal
	
c40_yes:
	la $a0,choice4_true
	li $v0,4
	syscall
	b pal

pal:

la $a0,code_msg
li $v0,4
syscall

la $a0,code4
li $v0,4
syscall





li $v0,13	# System call for opening the file
la $a0, source
li $a1,1		# Opening the File for writing  (Flags are 0: Read, 1:Write, 9:Write and append)
li $a2,0		# Mode is ignored
syscall		# Open the File (File descriptor returned in $v0)
move $t6,$v0

# Now Write in the File 
li $v0, 15	# System call for writing in the file
move $a0, $t6	#Copying the file descriptor
la $a1, pseudo4	#Address of buffer from which to write
li $a2,258 #Buffer length
syscall

# Now Close the file
li $v0, 16	# System call for closing the file
move $a0, $t6	# Copying file descriptor
syscall
	
	
b exit





#*************************************************************#


#********************************choice5**********************#
DecimalToBinary:

la $a0,choice5_msg1
li $v0,4
syscall

li $v0,5
syscall
move $t0,$v0 #decimal number in $t0


la $t7,array #storing in array .. as we need to reverse it
la $t6,array #for comparing


beq $t0,0,out_zero #special case for 0 input



c50:
	beq $t0,0,end_c50
	move $t1,$t0 #temp
	div $t0,$t0,2
	mfhi $t2
	sw $t2,($t7)
	addi $t7,$t7,4
	
	b c50

end_c50:

	
	la $a0,choice5_msg2
	li $v0,4
	syscall

	

	subu $t7,$t7,4 #qk end me ek extra add hogya tha

print_5:

	blt $t7,$t6,dectobin
	lw $a0,($t7)
	li $v0,1
	syscall
	subu $t7,$t7,4
	b print_5


	
	
	
	
	
	
	
out_zero:

la $a0,choice5_msg2
li $v0,4
syscall

li $a0,0 
li $v0,1
syscall
 
 b dectobin
 
 
 dectobin:
 
 la $a0,code_msg
li $v0,4
syscall

la $a0,code5
li $v0,4
syscall
 
 
 
 li $v0,13	# System call for opening the file
la $a0, source
li $a1,1		# Opening the File for writing  (Flags are 0: Read, 1:Write, 9:Write and append)
li $a2,0		# Mode is ignored
syscall		# Open the File (File descriptor returned in $v0)
move $t6,$v0

# Now Write in the File 
li $v0, 15	# System call for writing in the file
move $a0, $t6	#Copying the file descriptor
la $a1, pseudo5	#Address of buffer from which to write
li $a2,174 #Buffer length
syscall

# Now Close the file
li $v0, 16	# System call for closing the file
move $a0, $t6	# Copying file descriptor
syscall
	
	
b exit
 
 
 






#*************************************************************#


#********************************choice6**********************#

BinaryToDecimal:

la $a0,choice6_msg1
li $v0,4
syscall

li $v0,5
syscall
move $t0,$v0 #binary number in $t0

la $a0,choice6_msg2
li $v0,4
syscall

li $t3,1 #base=1
li $t4,0 #dec=0

c60:
beq $t0,0,print_6 #while(num>0)
div $t0,$t0,10 #num = num /10
mfhi $t2
mul $t2,$t2,$t3 #rem = rem*base
add $t4,$t4,$t2
mul $t3,$t3,2
b c60

print_6:
move $a0,$t4
li $v0,1
syscall
b bintodec


bintodec:

la $a0,code_msg
li $v0,4
syscall

la $a0,code6
li $v0,4
syscall



 li $v0,13	# System call for opening the file
la $a0, source
li $a1,1		# Opening the File for writing  (Flags are 0: Read, 1:Write, 9:Write and append)
li $a2,0		# Mode is ignored
syscall		# Open the File (File descriptor returned in $v0)
move $t6,$v0

# Now Write in the File 
li $v0, 15	# System call for writing in the file
move $a0, $t6	#Copying the file descriptor
la $a1, pseudo6	#Address of buffer from which to write
li $a2,220 #Buffer length
syscall

# Now Close the file
li $v0, 16	# System call for closing the file
move $a0, $t6	# Copying file descriptor
syscall
	
	
b exit




#*************************************************************#



#********************************choice7**********************#

ReverseNumber:

	la $a0,choice7_msg1
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	
	move $t7,$v0 # Entered number is in $t7
	
	li $t0,0 #rev
	li $t6,10 # load 10 in $t6

c70:
	beq $t7,0,end_c70  #while(number is not equal to 0)
	mul $t0,$t0,10
	div $t7,$t7,$t6
	mfhi $t4 #rem
	add $t0,$t0,$t4
	b c70

end_c70:
	
	la $a0,choice7_msg2
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	
	b revint
	
	
revint:

la $a0,code_msg
li $v0,4
syscall

la $a0,code7
li $v0,4
syscall




 li $v0,13	# System call for opening the file
la $a0, source
li $a1,1		# Opening the File for writing  (Flags are 0: Read, 1:Write, 9:Write and append)
li $a2,0		# Mode is ignored
syscall		# Open the File (File descriptor returned in $v0)
move $t6,$v0

# Now Write in the File 
li $v0, 15	# System call for writing in the file
move $a0, $t6	#Copying the file descriptor
la $a1, pseudo7	#Address of buffer from which to write
li $a2,162 #Buffer length
syscall

# Now Close the file
li $v0, 16	# System call for closing the file
move $a0, $t6	# Copying file descriptor
syscall
	
	
b exit


	





#*************************************************************#


#********************************choice8**********************#

PerfectNum:

	la $a0,choice8_msg
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0 #input number in $t0

	li $t1,1 #i
	move $t2,$t0
	sub $t2,$t2,1 #loop till this
	li $t6,0 #sum
	
c80:
	bgt $t1,$t2,print_80
	
	div $t7,$t0,$t1
	mfhi $t7 #rem = num %i
	beq $t7,0,sum_8
aftersum_8:
	addi $t1,$t1,1
	b c80
	
sum_8:
	add $t6,$t6,$t1
	b aftersum_8

print_80:
	beq $t6,$t0,c80_yes #if sum==num then print perfect number
	la $a0,choice8_false
	li $v0,4
	syscall
	b per
	
	
c80_yes:
	la $a0,choice8_true
	li $v0,4
	syscall
	b per
	
	
	
per:


la $a0,code_msg
li $v0,4
syscall

la $a0,code8
li $v0,4
syscall




 li $v0,13	# System call for opening the file
la $a0, source
li $a1,1		# Opening the File for writing  (Flags are 0: Read, 1:Write, 9:Write and append)
li $a2,0		# Mode is ignored
syscall		# Open the File (File descriptor returned in $v0)
move $t6,$v0

# Now Write in the File 
li $v0, 15	# System call for writing in the file
move $a0, $t6	#Copying the file descriptor
la $a1, pseudo8	#Address of buffer from which to write
li $a2,225 #Buffer length
syscall

# Now Close the file
li $v0, 16	# System call for closing the file
move $a0, $t6	# Copying file descriptor
syscall
	
	
b exit




#*************************************************************#


#********************************choice9**********************#
armstrong:

	la $a0,choice9_msg
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0 #input number in $t0
	
	move $t1,$t0 #temp(t1) = number
	
c90:
	beq $t1,0,end_c90
	div $t1,$t1,10				#rem = $t1%10
	mfhi $t2
	move $t4,$t2
	mul $t2,$t2,$t2
	mul $t2,$t2,$t4
	add $t3,$t3,$t2  #result($t3)+=rem*rem*rem
	b c90

end_c90:
	beq $t3,$t0,armstrong_true #it is armstrong
	la $a0,choice9_false #else
	li $v0,4
	syscall
	b arm
	
armstrong_true:
	la $a0,choice9_true
	li $v0,4
	syscall
	b arm
	
	
arm:


la $a0,code_msg
li $v0,4
syscall

la $a0,code9
li $v0,4
syscall



 li $v0,13	# System call for opening the file
la $a0, source
li $a1,1		# Opening the File for writing  (Flags are 0: Read, 1:Write, 9:Write and append)
li $a2,0		# Mode is ignored
syscall		# Open the File (File descriptor returned in $v0)
move $t6,$v0

# Now Write in the File 
li $v0, 15	# System call for writing in the file
move $a0, $t6	#Copying the file descriptor
la $a1, pseudo9	#Address of buffer from which to write
li $a2,304 #Buffer length
syscall

# Now Close the file
li $v0, 16	# System call for closing the file
move $a0, $t6	# Copying file descriptor
syscall
	
	
b exit
	
	




#*************************************************************#


#********************************choice10**********************#
leapyear:

	la $a0,choice10_msg
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	
	move $t7,$v0 # Entered year is in $t7
	
	div $t0,$t7,4
	mfhi $t0
	
	beq $t0,0,ItsLeap #true
	la $a0,choice10_false
	li $v0,4
	syscall
	b lp
	

ItsLeap:
	la $a0,choice10_true
	li $v0,4
	syscall
	b lp

	
lp:


la $a0,code_msg
li $v0,4
syscall

la $a0,code10
li $v0,4
syscall




 li $v0,13	# System call for opening the file
la $a0, source
li $a1,1		# Opening the File for writing  (Flags are 0: Read, 1:Write, 9:Write and append)
li $a2,0		# Mode is ignored
syscall		# Open the File (File descriptor returned in $v0)
move $t6,$v0

# Now Write in the File 
li $v0, 15	# System call for writing in the file
move $a0, $t6	#Copying the file descriptor
la $a1, pseudo10	#Address of buffer from which to write
li $a2,115 #Buffer length
syscall

# Now Close the file
li $v0, 16	# System call for closing the file
move $a0, $t6	# Copying file descriptor
syscall
	
	
b exit
	
	



#*************************************************************#


exit:
li $v0,10
syscall

