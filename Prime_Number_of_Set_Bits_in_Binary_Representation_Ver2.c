#include <stdio.h>
#include <stdint.h>

int hamming_weight(int n) {
    //with bitwise parellel method
    n = (n & 0x55555555) + ((n >> 1) & 0x55555555); 
    n = (n & 0x33333333) + ((n >> 2) & 0x33333333); 
    n = (n & 0x0F0F0F0F) + ((n >> 4) & 0x0F0F0F0F); 
    n = (n & 0x00FF00FF) + ((n >> 8) & 0x00FF00FF);
    n = (n & 0x0000FFFF) + ((n >> 16) & 0x0000FFFF); 
    return n;
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