//
//  MOOwnedAppliance.h
//  Appliances
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOAppliance.h"

@interface MOOwnedAppliance : MOAppliance

@property (readonly) NSSet *ownerNames;

// The designated initializer
- (instancetype)initWithProductName:(NSString *)pn
                     firstOwnerName:(NSString *)n;

- (void)addOwnerName:(NSString *)n;
- (void)removeOwnerName:(NSString *)n;

@end
