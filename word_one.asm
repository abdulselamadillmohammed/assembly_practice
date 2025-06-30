.data
    age: .word 23
.text

    # print an integer to the screen
    li $v0, 1 # 4 if char/string
    lw $a0, age
    syscall