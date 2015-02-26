//
//  LotteryEntry.m
//  Lottery
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "LotteryEntry.h"

@implementation LotteryEntry

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"MOBadInitCall" reason:@"Initialize LotteryEntry with initWithEntryDate" userInfo:nil];
    return nil;
}

// this is the designated initializer
- (instancetype)initWithEntryDate:(NSDate *)d
{
    if (self = [super init]) {
        NSAssert(d != nil, @"Argument must be non-nil");
        _firstNumber = ((int)random() % 100) + 1;
        _secondNumber = ((int)random() % 100) + 1;
        
        _entryDate = [d retain];
    }
    
    return self;
}

- (NSString *)description
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    
//    [df setTimeStyle:NSDateFormatterNoStyle];
//    [df setDateStyle:NSDateFormatterMediumStyle];
    return [NSString stringWithFormat:@"%@ = %d and %d", [df stringFromDate:self.entryDate], self.firstNumber, self.secondNumber];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
    [_entryDate release];
    [super dealloc];
}

@end
