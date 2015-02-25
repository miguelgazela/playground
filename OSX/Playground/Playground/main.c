//
//  main.c
//  Playground
//
//  Created by Miguel Oliveira on 17/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#include <stdio.h>
#include <readline/readline.h>
#include <math.h>
#include <time.h>

void countdown(int start) {
    while (start >= 0) {
        printf("%d\n", start);
        if (start % 5 == 0) {
            printf("Found one!\n");
        }
        start -= 3;
    }
}

void countDownWithInput() {
    printf("Where should I start counting? ");
    const char *start = readline(NULL);
    countdown(atoi(start));
}

typedef struct {
    float heightInMeters;
    int weightInKilos;
} Person;

void metersToFeetAndInches(double meters, double *ftPtr, double *inPtr) {
    
    // assumes meters is non-negative
    
    // converts the number of meters into a floating-point number of feet
    double rawFeet = meters * 3.281;
    
    double fractionalFoot = modf(rawFeet, ftPtr);
//    
//    // store the number of feet at the supplied address
//    if (ftPtr) {
//        printf("Storing %u to the address %p\n", feet, ftPtr);
//        *ftPtr = feet;
//    }
    
    // calculate inches
    double inches = fractionalFoot * 12.0;
    
    // store the number of inches at the supplied address
    if (inPtr) {
        printf("Storing %.2f to the address %p\n", inches, inPtr);
        *inPtr = inches;
    }
}

float bodyMassIndex(Person p) {
    return p.weightInKilos / (p.heightInMeters * p.heightInMeters);
}

struct tm getFutureDate(unsigned long seconds) {
    long secondsSince1970 = time(NULL);
    secondsSince1970 += seconds;
    struct tm now;
    localtime_r(&secondsSince1970, &now);
    return now;
}

int main(int argc, const char * argv[]) {
//    countdown(99);
//    countDownWithInput();
    
    
    // Getting addresses
    int i = 17;
    int *addressOfI = &i;
    
//    printf("This function starts at %p\n", main);
//    printf("i stores its value at %p\n", addressOfI);
//    printf("The int stored at addressOfI is %d\n", *addressOfI);
//    
//    printf("An int is %zu bytes\n", sizeof(int));
//    printf("A pointer is %zu bytes\n", sizeof(int * ));
//    
//    printf("A flot is %zu bytes\n", sizeof(float));
    
    // Pass-By-Reference
    
    double pi = 3.14;
    double integerPart;
    double fractionPart;
    
    // pass the address of integerPart as an argument
    fractionPart = modf(pi, &integerPart);
    
    // find the value stored in integerPart
    printf("integerPart = %.0f, fractionPart = %.2f\n", integerPart, fractionPart);
    
    double meters = 3.0;
    double feet;
    double inches;
    
    metersToFeetAndInches(meters, &feet, &inches);
//    printf("%.1f meters is equal to %.0f feet and %.1f inches.\n", meters, feet, inches);
    
    // 11. STRUCTS
    
    Person mikey;
    mikey.heightInMeters = 1.7;
    mikey.weightInKilos = 96;
    
    Person aaron;
    aaron.heightInMeters = 1.97;
    aaron.weightInKilos = 84;
    
//    printf("mikey is %.2f meters tall\n", mikey.heightInMeters);
    
    float bmi;
    bmi = bodyMassIndex(mikey);
//    printf("mikey has a BMI of %.2f\n", bmi);
    
    struct tm future = getFutureDate(4000000);
//    printf("%d-%d-%d\n", future.tm_mday, future.tm_mon + 1, future.tm_year);
    
    float *startOfBuffer;
    
    // ask to use some bytes from the heap
    startOfBuffer = malloc(1000 * sizeof(float));
    
    // use the buffer here
    
    // relinquish your claim on the memory so it can be reused
    free(startOfBuffer);
    
    // forget where that memory is
    startOfBuffer = NULL;
    
    return 0;
}
