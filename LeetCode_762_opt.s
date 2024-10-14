.data
.text
main:
    li a0, 6
    li a1, 10
    jal ra, countPrimeSetBits
     
    add a1, a0, x0
    li a7, 1
    ecall
    li a7, 10
    ecall

countPrimeSetBits:
    li t0, 0
    add t1, a0, x0
    add t2, a1, x0
    li s0, 0b10100010100010101100
    li s1, 0x55555555
    li s2, 0x33333333
    li s3, 0x0F0F0F0F
    li s4, 0x00FF00FF
    li s5, 0x0000FFFF
    li s6, 1

loop:
    bgt t1, t2, loop_end

    add t4, t1, x0
    and t5, t4, s1
    srli t4, t4, 1
    and t4, t4, s1

    add t4, t4, t5
    and t5, t4, s2
    srli t4, t4, 2
    and t4, t4, s2

    add t4, t4, t5
    and t5, t4, s3
    srli t4, t4, 4
    and t4, t4, s3

    add t4, t4, t5
    and t5, t4, s4
    srli t4, t4, 8
    and t4, t4, s4

    add t4, t4, t5
    and t5, t4, s5
    srli t4, t4, 16
    and t4, t4, s5

    add t4, t4, t5
    sll t5, s6, t4
    and t5, s0, t5
    beq t5, x0, not_prime
    addi t0, t0, 1

not_prime:
    addi t1, t1, 1
    j loop

loop_end:
    add a0, t0, x0
    ret
