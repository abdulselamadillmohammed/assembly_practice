.data
msg:    .asciiz "Hello from MIPS!\n"

.text
.globl main

main:
    li $v0, 4         # syscall code 4 = print_string
    la $a0, msg       # load address of string into $a0
    syscall           # perform the syscall

    li $v0, 10        # syscall code 10 = exit
    syscall
