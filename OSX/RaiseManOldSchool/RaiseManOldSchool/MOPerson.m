//
//  MOPerson.m
//  RaiseManOldSchool
//
//  Created by Miguel Oliveira on 27/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOPerson.h"

@implementation MOPerson

- (instancetype)init
{
    if (self = [super init]) {
        _expectedRaise = 0.05;
        _personName = @"New Person";
    }
    return self;
}

@end
