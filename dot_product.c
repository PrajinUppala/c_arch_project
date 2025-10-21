#include <stdio.h>


int dot_product(int *a, int *b, int n) {
    int sum = 0;
    for (int i = 0; i < n; i++)
        sum += a[i] * b[i];
    return sum;
}

int main(){
    int n = 3;
    int a[] = {1, 2, 3};
    int b[] = {4, 5, 6};
    int result = dot_product(a, b, n);
    printf("Dot product: %d\n", result);
    return 0;
}