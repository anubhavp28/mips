.data
    msg: .asciiz "Enter N:"
.text
func:
    li $t1, 0
    li $s1, 0
    loop:
    add $t1, $t1, 1 #increment counter
    slt $s0, $t1, $a0 # check counter < N
    add $s1, $t1, $s1 # add to sum
    beq $s0, 1, loop
    move $a0, $s1
    li $v0, 1
    syscall
    jr $ra
 
main:
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 5
    syscall
    move $a0, $v0 # move N into $t0
    jal func
    li $v0, 10
    syscall
