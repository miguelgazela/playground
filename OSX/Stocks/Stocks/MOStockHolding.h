//
//  MOStockHolding.h
//  Stocks
//
//  Created by Miguel Oliveira on 19/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOStockHolding : NSObject

@property (nonatomic) float purchaseSharePrice;
@property (nonatomic) float currentSharePrice;
@property (nonatomic) int numberOfShares;
@property (nonatomic) NSString *symbol;

- (float)costInDollars;
- (float)valueInDollars;

@end
