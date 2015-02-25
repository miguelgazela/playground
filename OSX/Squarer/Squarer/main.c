//
//  main.c
//  Squarer
//
//  Created by Miguel Oliveira on 17/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#include <stdio.h>

int squarer(int num) {
    return num * num;
}

int main(int argc, const char * argv[]) {
    int number = 5;
    int square = squarer(number);
    printf("\"%d\" squared is \"%d\".\n", number, square);
}
