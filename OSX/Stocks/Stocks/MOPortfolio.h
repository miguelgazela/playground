//
//  MOPortfolio.h
//  Stocks
//
//  Created by Miguel Oliveira on 20/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MOStockHolding;

@interface MOPortfolio : NSObject

@property (nonatomic, copy) NSArray *stocks;

- (void)addStock:(MOStockHolding *)s;
- (float)totalValue;
- (NSArray *)topThreeValuableHoldings;
- (NSArray *)topNValuableHoldings:(unsigned int)n;

@end
