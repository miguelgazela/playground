//
//  MOAnalyticsManager.m
//  testAspects
//
//  Created by MacMiniHome on 15/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "MOAnalyticsManager.h"\

#import "MOAnalytics.h"
#import "MOBarAnalytics.h"
#import "MOFooAnalytics.h"

@interface MOAnalyticsManager ()

@property (nonatomic, copy, readwrite) NSArray <MOAnalytics *> *analytics;

@end

@implementation MOAnalyticsManager

- (instancetype)init {
    self = [super init];
    if (self) {
        
        _analytics = @[ [[MOFooAnalytics alloc] init], [[MOBarAnalytics alloc] init]];
    }
    return self;
}

@end
