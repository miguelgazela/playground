//
//  main.m
//  Appliances
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOAppliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MOAppliance *a = [[MOAppliance alloc] init];
        NSLog(@"a is %@", a);
        [a setProductName:@"Washing Machine"];
        [a setVoltage:240];
        NSLog(@"a is %@", a);
    }
    return 0;
}
