//
//  MOCarArrayController.m
//  CarLot
//
//  Created by Miguel Oliveira on 27/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOCarArrayController.h"

@implementation MOCarArrayController

- (id)newObject
{
    id newObject = [super newObject];
    NSDate *now = [NSDate date];
    [newObject setValue:now forKey:@"datePurchased"];
    return newObject;
}

@end
