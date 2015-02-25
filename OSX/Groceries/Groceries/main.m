//
//  main.m
//  Groceries
//
//  Created by Miguel Oliveira on 19/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *groceries = [NSMutableArray array];
        
        NSString *bread = @"Loaf of bread";
        NSString *milk = @"Container of milk";
        NSString *butter = @"Stick of butter";
        
        [groceries addObject:bread];
        [groceries addObject:milk];
        [groceries addObject:butter];
        
        for (NSString *i in groceries) {
            NSLog(@"The item is: %@", i);
        }
        
        // Create an instance of BNRPerson
        BNRPerson *mikey = [[BNRPerson alloc] init];
        
        // give it some interesting values
        [mikey setWeightInKilos:96];
        [mikey setHeightInMeters:1.8];
        
        float height = [mikey heightInMeters];
        int weight = [mikey weightInKilos];
        NSLog(@"mikey is %.2f meters tall and weighs %d kilograms", height, weight);
        
        float bmi = [mikey bodyMassIndex];
        NSLog(@"mikey has a BMI of %f", bmi);
        
    }
    return 0;
}
