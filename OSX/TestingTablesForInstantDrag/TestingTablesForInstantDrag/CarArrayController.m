//
//  CarArrayController.m
//  TestingTablesForInstantDrag
//
//  Created by Miguel Oliveira on 13/04/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "CarArrayController.h"

@implementation CarArrayController

- (id)newObject
{
    id newObj = [super newObject];
    NSDate *now = [NSDate date];
    
    int random = arc4random_uniform(74);
    
    NSString *name = [NSString stringWithFormat:@"Car %d", random];
    
    [newObj setValue:name forKey:@"makeModel"];
    [newObj setValue:now forKey:@"datePurchased"];
    return newObj;
}

@end
