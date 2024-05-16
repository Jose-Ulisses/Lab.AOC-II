#include <stdio.h>

int fatorial(int n){
    int i, mult = n;

    for(i = n-1; i >= 1; i--){
        mult = mult * i;
    }
    return mult;
}

int main(){
    printf("Resultado: %d", fatorial(10));
    return 0;
}