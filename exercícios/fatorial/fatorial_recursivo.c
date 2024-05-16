#include <stdio.h>

int fatorial(int n){
    if(n <= 1)
        return 1;
    return n * fatorial(n-1);
}

int main(){
    printf("Resultado: %d", fatorial(10));
    return 0;
}