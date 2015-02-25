//
//  main.c
//  Triangle
//
//  Created by Miguel Oliveira on 17/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#include <stdio.h>

float remainingAngle(a, b) {
    return 180 - a - b;
}

int main(int argc, const char * argv[]) {
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB);
    printf("The third angle is %.2f\n", angleC);
}
