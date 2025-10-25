#include <stdio.h>


int dot_product_float(int *a, int *b, int n) {
    float sum = 0;

    for (int i = 0; i < n; i++){
        float a_i = (float)a[i];
        float b_i = (float)b[i];
        sum += a_i * b_i;
    }
    int result = (int) sum;
    return result;
}

int main(){
    int n = 1000000;
    int a[n], b[n];
    for(int i=0; i<n; i++){
        a[i] = 1;
        b[i] = 1;
    }
    int result = dot_product_float(a, b, n);
    printf("Dot product: %d\n", result);
    return 0;
}