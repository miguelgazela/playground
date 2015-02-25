//
//  main.m
//  DateList
//
//  Created by Miguel Oliveira on 18/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        // create an array containing all three
//        NSArray *dateList = @[now, tomorrow, yesterday];
        NSMutableArray *dateList = [NSMutableArray array];
        
        [dateList addObject:now];
        [dateList addObject:tomorrow];
        [dateList addObject:yesterday];
        
        // print a couple of dates
        for(NSDate *d in dateList) {
            NSLog(@"The date is %@", d);
        }
        
        // remove yesterday
        [dateList removeObjectAtIndex:0];
        
        // How many dates are in the array?
        NSLog(@"There are %lu dates", [dateList count]);
    }
    return 0;
}
