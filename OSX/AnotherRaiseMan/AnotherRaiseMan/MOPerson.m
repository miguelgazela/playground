//
//  MOPerson.m
//  AnotherRaiseMan
//
//  Created by Miguel Oliveira on 24/03/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "MOPerson.h"

@implementation MOPerson

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _expectedRaise = 0.5;
        _name = @"New Person";
    }
    
    return self;
}

@end
