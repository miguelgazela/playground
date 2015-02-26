//
//  main.m
//  Lottery
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotteryEntry.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // create the date object
        NSDate *now = [NSDate date];
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDateComponents *weekComponents = [[NSDateComponents alloc] init];
        
        // see the randoim number generator
        srandom((unsigned)time(NULL));
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            
            [weekComponents setWeekOfYear:i];
            
            // create a date/time object that is 'i' weeks from now
            NSDate *iWeeksFromNow = [cal dateByAddingComponents:weekComponents toDate:now options:0];
            
            // create a new instance of LotteryEntry
            LotteryEntry *newEntry = [[LotteryEntry alloc] initWithEntryDate:iWeeksFromNow];
            
            [array addObject:newEntry];
            [newEntry release];
        }
        
        [now release];
        [weekComponents release];
        
        for (LotteryEntry *e in array) {
            NSLog(@"%@", e);
        }
        
        [array release];
    }
    return 0;
}
