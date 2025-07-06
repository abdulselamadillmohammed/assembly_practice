.data
    number1: .double 3.00
    number2: .double 2.00
    
.text
    ldc1 $f2, number1 #ldc1 (for doubles) [stored in f2 and f3]
    ldc1 $f4, number2
    
    # add.s $f12, $f2, $f4
    
    mul.d $f12, $f2, $f4
    
    #li $v0, 2 # 3 for doubles
    li $v0, 3
    syscall