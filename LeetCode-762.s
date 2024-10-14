.data
.text
main:
    li a0, 6   # left
    li a1, 10  # right
    jal ra, countPrimeSetBits
 
    add a1, a0, x0
    li a7, 1 
    ecall
    li a7, 10
    ecall

countPrimeSetBits:
    addi sp, sp, -12
    sw ra, 8(sp)
    sw s0, 4(sp)
    sw s1, 0(sp)

    li s0, 0 # count = 0
    add s1, a0, x0
    add s2, a1, x0
    li s3, 0b10100010100010101100 # primemask

loop:
    bgt s1, s2, loop_end
    add a0, s1, x0
    jal ra, hamming_weight

    li t0, 1
    sll t0, t0, a0
    and t1, s3, t0
    beq t1, zero, not_prime
    addi s0, s0, 1 # count++

not_prime:
    addi s1, s1, 1 # n++
    j loop

loop_end:
    add a0, s0, x0 
    lw s1, 0(sp)
    lw s0, 4(sp)
    lw ra, 8(sp)
    addi sp, sp, 12
    jalr x0, ra, 0

hamming_weight:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw s0, 8(sp)
    sw s1, 4(sp)
    sw s2, 0(sp)
    add s0, a0 ,x0

    li s1, 0x55555555
    and s2, s0, s1
    srli s0, s0, 1
    and s0, s0, s1
    add s0, s0, s2

    li s1, 0x33333333
    and s2, s0, s1
    srli s0, s0, 2
    and s0, s0, s1
    add s0, s0, s2

    li s1, 0x0F0F0F0F
    and s2, s0, s1
    srli s0, s0, 4
    and s0, s0, s1
    add s0, s0, s2

    li s1, 0x00FF00FF
    and s2, s0, s1
    srli s0, s0, 8
    and s0, s0, s1
    add s0, s0, s2

    li s1, 0x0000FFFF
    and s2, s0, s1
    srli s0, s0, 16
    and s0, s0, s1
    add s0, s0, s2
    add a0, s0, x0
    
    lw s2, 0(sp)
    lw s1, 4(sp)
    lw s0, 8(sp)
    lw ra, 12(sp)
    addi sp, sp, 16
    jalr x0, ra, 0
