//
//  MOEmployee.m
//  Stocks
//
//  Created by Miguel Oliveira on 19/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOEmployee.h"
#import "MOAsset.h"

// A class extension
@interface MOEmployee ()

{
    NSMutableSet *_assets;
}

@property (nonatomic) unsigned int officeAlarmCode;

@end


@implementation MOEmployee

// Accessors for assets properties

- (void)setAssets:(NSArray *)a
{
    _assets = [a mutableCopy];
}

- (NSArray *)assets
{
    return [_assets copy];
}

- (void)addAsset:(MOAsset *)a
{
    // Is assets nil?
    if (!_assets) {
        // lazy instantiation
        _assets = [[NSMutableSet alloc] init];
    }
    [_assets addObject:a];
}

- (unsigned int)valueOfAssets
{
    // sum up the resale value of the assets
    unsigned int sum = 0;
    for (MOAsset *a in _assets) {
        sum += [a resaleValue];
    }
    
    return sum;
}

- (double)yearsOfEmployment
{
    // do I have a non-nil hireDate?
    if (self.hireDate) {
        // NSTimeInterval is the same as double
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate: self.hireDate];
        return secs / 31557600.0; // seconds per year
    } else {
        return 0;
    }
}

- (float)bodyMassIndex
{
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %u : $%u in assets>", self.employeeID, self.valueOfAssets];
}

- (void)dealloc
{
    NSLog(@"%@", self);
}

@end
