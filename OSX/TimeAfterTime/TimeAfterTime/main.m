//
//  main.m
//  TimeAfterTime
//
//  Created by Miguel Oliveira on 17/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [NSDate date];
        NSLog(@"This NSDate object lives at %p", now);
        NSLog(@"The date is %@", now);
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970.", seconds);
        
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 100,000 seconds it will be %@", later);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"My calendar is %@", [cal calendarIdentifier]);
        unsigned long day = [cal ordinalityOfUnit:NSCalendarUnitDay
                                           inUnit:NSCalendarUnitMonth
                                          forDate:now];
        NSLog(@"This is day %lu of the month", day);
        
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1988];
        [comps setMonth:11];
        [comps setDay:11];
        [comps setHour:13];
        [comps setMinute:25];
        [comps setSecond:0];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *birthDate = [g dateFromComponents:comps];
        
        seconds = [now timeIntervalSinceDate:birthDate];
        NSLog(@"I've been alive for %f seconds.", seconds);
    }
    return 0;
}
