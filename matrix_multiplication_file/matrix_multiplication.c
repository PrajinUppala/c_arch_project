#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 512  // you can vary this for performance benchmarking

int main() {
    int i, j, k;
    static int A[N][N], B[N][N], C[N][N];

    // Initialize matrices with random integers
    srand(time(NULL));
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            A[i][j] = rand() % 100;
            B[i][j] = rand() % 100;
            C[i][j] = 0;
        }
    }

    clock_t start = clock();

    // Matrix multiplication
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            int sum = 0;
            for (k = 0; k < N; k++) {
                sum += A[i][k] * B[k][j];
            }
            C[i][j] = sum;
        }
    }

    clock_t end = clock();

    double time_taken = (double)(end - start) / CLOCKS_PER_SEC;
    printf("Time taken for %dx%d integer matrix multiplication: %.6f seconds\n", N, N, time_taken);

    // Optional: verify result for small N
    // for (i = 0; i < 5; i++) {
    //     for (j = 0; j < 5; j++)
    //         printf("%d ", C[i][j]);
    //     printf("\n");
    // }

    return 0;
}
