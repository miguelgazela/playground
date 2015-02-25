//
//  main.m
//  Lottery
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            NSNumber *newNumber = [[NSNumber alloc] initWithInt:(i * 3)];
            [array addObject:newNumber];
        }
        
        for (int i = 0; i < 10; i++) {
            NSNumber *numberToPrint = [array objectAtIndex:i];
            NSLog(@"The number at index %d is %@", i, numberToPrint);
        }
    }
    return 0;
}
