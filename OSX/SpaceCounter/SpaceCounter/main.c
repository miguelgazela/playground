//
//  main.c
//  SpaceCounter
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int spaceCount(const char *sentence) {
    unsigned int count = 0;
    
    for (int i = 0; i < strlen(sentence); i++) {
        if (sentence[i] == 0x20) {
            count += 1;
        }
    }
    return count;
}

float averageFloats(float data[], int dataCount) {
    float sum = 0.0;
    for (int i = 0; i < dataCount; i++) {
        sum = sum + data[i];
    }
    return sum / dataCount;
}

int main(int argc, const char * argv[]) {
    
//    const char *sentence = "He was not in the cab at the time.";
//    printf("\"%s\" has %d spaces\n", sentence, spaceCount(sentence));
    
    // create a new array of floats
//    float gradeBook[3];
//    gradeBook[0] = 60.2;
//    gradeBook[1] = 94.5;
//    gradeBook[2] = 81.1;
    float gradeBook[] = {60.2, 94.5, 81.1};
    
    // calculate the average
    float average = averageFloats(gradeBook, 3);
    
    printf("Average = %.2f\n", average);
    
    return 0;
}
