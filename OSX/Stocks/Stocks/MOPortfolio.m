//
//  MOPortfolio.m
//  Stocks
//
//  Created by Miguel Oliveira on 20/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOPortfolio.h"
#import "MOStockHolding.h"

// class extension

@interface MOPortfolio ()

{
    NSMutableArray *_stocks;
}

@end

@implementation MOPortfolio

- (void)setStocks:(NSArray *)a
{
    _stocks = [a mutableCopy];
}

- (NSArray *)stocks
{
    return [_stocks copy];
}

- (void)addStock:(MOStockHolding *)s
{
    if (!_stocks) {
        _stocks = [[NSMutableArray alloc] init];
    }
    [_stocks addObject:s];
}

- (float)totalValue
{
    unsigned int sum = 0;
    for (MOStockHolding *s in _stocks) {
        sum += [s valueInDollars];
    }
    
    return sum;
}

- (NSArray *)topNValuableHoldings:(unsigned int)n
{
    NSSortDescriptor *vid = [NSSortDescriptor sortDescriptorWithKey:@"valueInDollars" ascending:NO];
    NSArray *sorted = [[self stocks] sortedArrayUsingDescriptors:@[vid]];
    NSRange range = NSMakeRange(0, MIN(n, [sorted count]));
    return [sorted subarrayWithRange:range];
}

- (NSArray *)topThreeValuableHoldings
{
    return [self topNValuableHoldings:3];
}

@end
