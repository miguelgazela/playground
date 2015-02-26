//
//  LotteryEntry.h
//  Lottery
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryEntry : NSObject

@property (nonatomic) NSDate *entryDate;
@property (nonatomic) int firstNumber;
@property (nonatomic) int secondNumber;

// this is the designated initializer
- (instancetype)initWithEntryDate:(NSDate *)d;

@end
