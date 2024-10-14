#include <stdio.h>
#include <stdint.h>

int hamming_weight(int n) {
    //with Brian Kernighan's Algorithm
    int setbit = 0;
    while (n) {
        setbit++;
        n &= (n - 1);
    }
    return setbit;
}

int countPrimeSetBits(int left, int right) {
    int primemask = 0b10100010100010101100;
    int count = 0;
    for (int n = left; n <= right; n++) {
        int setbit = hamming_weight(n);
        if (primemask & (1 << setbit)) {
            count++;
        }
    }
    return count;
}

int main() {
    printf("test case 1 = %d\n", countPrimeSetBits(6,10));
    printf("test case 2 = %d\n", countPrimeSetBits(10,15));
    printf("test case 3 = %d\n", countPrimeSetBits(15,20));
}