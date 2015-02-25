//
//  MOOwnedAppliance.m
//  Appliances
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOOwnedAppliance.h"

@interface MOOwnedAppliance ()
{
    NSMutableSet *_ownerNames;
}

@end

@implementation MOOwnedAppliance

- (instancetype)initWithProductName:(NSString *)pn
{
    return [self initWithProductName:pn firstOwnerName:nil];
}

- (instancetype)initWithProductName:(NSString *)pn
                     firstOwnerName:(NSString *)n
{
    
    // call the superclass's initializer
    if (self = [super initWithProductName:pn]) {
        
        // create a set to hold owners names
        _ownerNames = [[NSMutableSet alloc] init];
        
        // is the first owner name non-nil?
        if (n) {
            [_ownerNames addObject:n];
        }
    }
    
    // return a pointer to the new object
    return self;
}

- (void)addOwnerName:(NSString *)n
{
    [_ownerNames addObject:n];
}

- (void)removeOwnerName:(NSString *)n
{
    [_ownerNames removeObject:n];
}

- (NSSet *)ownerNames
{
    return [_ownerNames copy];
}

@end
