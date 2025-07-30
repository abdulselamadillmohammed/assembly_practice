# ==============================================================================
# Data Segment
# ==============================================================================
.data
ask_for_num: .asciiz "Enter a number: "
result:      .asciiz "The result is: "
newline:     .asciiz "\n"

# ==============================================================================
# Text Segment (Code)
# ==============================================================================
.text
.globl main

# ------------------------------------------------------------------------------
# Main function
# - Prompts the user for a number n.
# - Calls the mystery function with n.
# - Prints the result returned by mystery(n).
# - Exits the program.
# ------------------------------------------------------------------------------
main:
    # Print the prompt string
    li $v0, 4
    la $a0, ask_for_num
    syscall

    # Read an integer from the user (the result is stored in $v0)
    li $v0, 5
    syscall
    
    # Move the user's input into $a0 to pass it as an argument to mystery
    move $a0, $v0

    # Call the mystery function. The return value will be in $v0.
    jal mystery

    # --- FIX ---
    # The original code had a bug here. System calls (like printing a string)
    # can modify the $v0 register. We must save the result from mystery()
    # before making another system call. We'll use a saved register, $s0.
    move $s0, $v0

    # Print the "result" label string
    li $v0, 4
    la $a0, result
    syscall

    # Print the integer result of the mystery function
    li $v0, 1
    move $a0, $s0       # Use the saved result from $s0
    syscall

    # Print a newline character for clean formatting
    li $v0, 4
    la $a0, newline
    syscall

    # Exit the program cleanly
    li $v0, 10
    syscall


# ------------------------------------------------------------------------------
# Function: mystery(n)
# Description: Recursively calculates the function mystery(n) = n^2 + 1.
#              This is achieved by the recurrence relation:
#              mystery(n) = mystery(n-1) + 2n - 1, with mystery(0) = 1.
# ------------------------------------------------------------------------------
# Arguments:
#   $a0 - The input integer n.
# Return value:
#   $v0 - The result (n^2 + 1).
# Stack Frame Layout:
#   A frame of 8 bytes is used for each recursive call.
#   +4($sp): Stores the return address ($ra).
#   +0($sp): Stores the original value of n for this frame.
# ------------------------------------------------------------------------------
mystery:
    # Base Case: If n == 0, the function returns 1.
    beq $a0, $zero, base_case

    # --- Recursive Step ---
    # Prologue: Set up the stack frame for the current function call.
    addi $sp, $sp, -8   # Allocate 8 bytes on the stack.
    sw $ra, 4($sp)      # Save the return address on the stack.
    sw $a0, 0($sp)      # Save the current value of n (argument) on the stack.

    # Prepare for the recursive call: mystery(n-1).
    addi $a0, $a0, -1   # The argument for the next call is n-1.
    jal mystery         # Make the recursive call. The result will be in $v0.

    # After the call returns, $v0 = mystery(n-1).
    # We now need the original n for this frame to calculate the final result.
    
    move $t1, $v0       # Temporarily save the result of mystery(n-1) in $t1.
    lw $a0, 0($sp)      # Restore the original n for this frame from the stack.

    # Calculate the term (2*n - 1).
    sll $t0, $a0, 1     # $t0 = 2 * n
    addi $t0, $t0, -1   # $t0 = 2n - 1

    # Calculate the final result for this frame: mystery(n-1) + (2n - 1).
    add $v0, $t1, $t0   # $v0 = result. This will be the return value.
    # Epilogue: Tear down the stack frame and return to the caller.
    lw $ra, 4($sp)      # Restore the caller's return address from the stack.
    addi $sp, $sp, 8    # Deallocate the stack frame.
    jr $ra              # Return.

base_case:
    # The base case (n=0) returns 1.
    li $v0, 1
    jr $ra              # Return to the caller.