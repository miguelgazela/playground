//
//  main.c
//  Degrees
//
//  Created by Miguel Oliveira on 17/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#include <stdio.h>

static float lastTemperature = 50.0;

float fahrenheitFromCelcius(float cel) {
    lastTemperature = cel;
    float fahr = cel * 1.8 + 32.0;
    printf("%f Celsius is %f Fahrenheit\n", cel, fahr);
    return fahr;
}

int main(int argc, const char * argv[]) {
    float freezeInC = 0;
    float freezeInF = fahrenheitFromCelcius(freezeInC);
    printf("Water freezes at %f degrees Fahrenheit.\n", freezeInF);
    return 0;
}
