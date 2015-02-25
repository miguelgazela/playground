//
//  MOPerson.m
//  Stocks
//
//  Created by Miguel Oliveira on 19/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOPerson.h"

@implementation MOPerson

- (float)bodyMassIndex
{
    return self.weightInKilos / (self.heightInMeters * self.heightInMeters);
}

@end
