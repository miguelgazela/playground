//
//  MOAnalytics.m
//  testAspects
//
//  Created by MacMiniHome on 15/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "MOAnalytics.h"

@implementation MOAnalytics

- (instancetype)init {
    self = [super init];
    if (self) {
        [self executeHooks];
    }
    
    return self;
}

- (void)executeHooks {
    
    // empty implementation
}

@end
