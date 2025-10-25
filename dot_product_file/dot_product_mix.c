#include <stdio.h>


int dot_product_mix(int *a, int *b, int n) {
    float sum = 0;
    int sum_int = 0;
    for(int i = 0; i < n-10; i+=11){
         sum_int += a[i]* b[i] + a[i+1]* b[i+1] + a[i+2]*b[i+2] + a[i+3] * b[i+3] + a[i+4]* b[i+4] + a[i+5]* b[i+5] + a[i+6]*b[i+6] + a[i+7] * b[i+7] + a[i+8]* b[i+8];
        float a_i9 = (float)a[i+9];
        float b_i9 = (float)b[i+9];
        float a_i10 = (float)a[i+10];
        float b_i10 = (float)b[i+10];
        sum += a_i9 * b_i9 + a_i10*b_i10;
    }
    int result = sum_int+(int) sum;
    return result;
}

int main(){
    int n = 1000000;
    int a[n], b[n];
    for(int i=0; i<n; i++){
        a[i] = 1;
        b[i] = 1;
    }
    int result = dot_product_mix(a, b, n);
    printf("Dot product: %d\n", result);
    return 0;
}