//
//  MOStockHolding.m
//  Stocks
//
//  Created by Miguel Oliveira on 19/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOStockHolding.h"

@implementation MOStockHolding


- (float)costInDollars
{
    return [self purchaseSharePrice] * [self numberOfShares];
}

- (float)valueInDollars
{
    return [self currentSharePrice] * [self numberOfShares];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Stock bought at %.2f with current value of %.2f, has %d shares", self.purchaseSharePrice, self.currentSharePrice, self.numberOfShares];
}


@end
