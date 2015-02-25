//
//  MOAppliance.h
//  Appliances
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOAppliance : NSObject

@property (nonatomic, copy) NSString *productName;
@property (nonatomic) int voltage;

// The designated initializer
- (instancetype)initWithProductName:(NSString *)pn;

@end
