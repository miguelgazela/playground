//
//  Person.m
//  RaiseMan
//
//  Created by Miguel Oliveira on 27/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    if (self = [super init]) {
        _expectedRaise = 0.05;
        _personName = @"Nem Person";
    }
    return self;
}

- (void)setNilValueForKey:(NSString *)key
{
    if ([key isEqual:@"expectedRaise"]) {
        [self setExpectedRaise:0.0];
    } else {
        [super setNilValueForKey:key];
    }
}

@end
