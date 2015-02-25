//
//  MOForeignStockHolding.m
//  Stocks
//
//  Created by Miguel Oliveira on 19/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOForeignStockHolding.h"

@implementation MOForeignStockHolding

- (float)costInDollars
{
    return (self.purchaseSharePrice * self.conversationRate) * self.numberOfShares;
}

- (float)valueInDollars
{
    return (self.currentSharePrice * self.conversationRate) * self.numberOfShares;
}

@end
