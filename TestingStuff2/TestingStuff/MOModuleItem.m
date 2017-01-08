//
//  MOModuleItem.m
//  TestingStuff
//
//  Created by MacMiniHome on 08/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "MOModuleItem.h"

@interface MOModuleItem ()

@property (nonatomic, assign, readwrite) MOModuleItemType type;

@end

@implementation MOModuleItem

- (instancetype)initWithType:(MOModuleItemType)type {
    
    self = [super init];
    
    if (self) {
        
        self.type = type;
    }
    
    return self;
}

@end
