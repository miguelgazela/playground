//
//  MOAppliance.m
//  Appliances
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOAppliance.h"

@implementation MOAppliance

- (instancetype)init
{
    return [self initWithProductName:@"Unknown"];
}

- (instancetype)initWithProductName:(NSString *)pn
{
    
    // did it return something non-nil?
    if (self = [super init]) {
        
        // set the product name
        _productName = [pn copy];
        
        // give voltage a starting value
        _voltage = 120;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %d volts>", self.productName, self.voltage];
}



@end
