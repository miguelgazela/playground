//
//  MOAsset.m
//  Stocks
//
//  Created by Miguel Oliveira on 20/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOAsset.h"

@implementation MOAsset

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: $%u>", self.label, self.resaleValue];
}

- (void)dealloc
{
    NSLog(@"%@", self);
}

@end
