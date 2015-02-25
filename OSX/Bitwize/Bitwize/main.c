//
//  main.c
//  Bitwize
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    unsigned long a = 0x00000001;
    unsigned long b = 0x0;
    
    for (int i = 0; i < 31; i++) {
        a = a << 2;
        a = a | 0x1;
        
        printf("Hex: 0x%lx\n", a);
    }
    
    printf("Decimal: %lu\n", a);
}
