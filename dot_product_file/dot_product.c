#include <stdio.h>


int dot_product(int *a, int *b, int n) {
    int sum = 0;
    for (int i = 0; i < n; i++)
        sum += a[i] * b[i];
    return sum;
}

int main(){
    int n = 1000000;
    int a[n], b[n];
    for(int i=0; i<n; i++){
        a[i] = 1;
        b[i] = 1;
    }
    int result = dot_product(a, b, n);
    printf("Dot product: %d\n", result);
    return 0;
}