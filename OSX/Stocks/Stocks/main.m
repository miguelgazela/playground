//
//  main.m
//  Stocks
//
//  Created by Miguel Oliveira on 19/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOStockHolding.h"
#import "MOForeignStockHolding.h"
#import "MOEmployee.h"
#import "MOAsset.h"
#import "MOPortfolio.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MOStockHolding *s1 = [[MOStockHolding alloc] init];
        MOStockHolding *s2 = [[MOStockHolding alloc] init];
        MOStockHolding *s3 = [[MOStockHolding alloc] init];
        MOForeignStockHolding *s4 = [[MOForeignStockHolding alloc] init];
        
        [s1 setPurchaseSharePrice:2.3];
        [s1 setCurrentSharePrice:4.5];
        [s1 setNumberOfShares:40];
        
        // or
        
        s2.purchaseSharePrice = 12.19;
        s2.currentSharePrice = 10.56;
        s2.numberOfShares = 90;
        
        s3.purchaseSharePrice = 12.19;
        s3.currentSharePrice = 10.56;
        s3.numberOfShares = 90;
        
        s4.purchaseSharePrice = 2.30;
        s4.currentSharePrice = 4.50;
        s4.numberOfShares = 40;
        s4.conversationRate = 0.94;
        
        MOPortfolio *portfolio = [[MOPortfolio alloc] init];
        [portfolio addStock:s1];
        [portfolio addStock:s2];
        [portfolio addStock:s3];
        [portfolio addStock:s4];
        
        NSLog(@"Portfolio value: %.2f", [portfolio totalValue]);
        
        NSArray *stocks = @[s1, s2, s3, s4];
        
        for (MOStockHolding *s in stocks) {
            NSLog(@"Stock cost %.2f dollars and is worth %.2f dollars", [s costInDollars], [s valueInDollars]);
        }
        
        NSLog(@"Ordered portfolio %@", [portfolio topNValuableHoldings:3]);
    }
    return 0;
}

//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // create an array of MOEmployee objects
//        NSMutableArray *employees = [[NSMutableArray alloc] init];
//        
//        // Create a dictionary of executives
//        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
//        
//        for (int i = 0; i < 10; i++) {
//            // create an instance of MOEmployee
//            MOEmployee *mikey = [[MOEmployee alloc] init];
//            
//            mikey.weightInKilos = 90 + 1;
//            mikey.heightInMeters = 1.8 - i/10.0;
//            mikey.employeeID = i;
//            
//            // put the employee in the employees array
//            [employees addObject:mikey];
//            
//            if (i == 0) {
//                [executives setObject:mikey forKey:@"CEO"];
//            }
//            
//            if (i == 1) {
//                [executives setObject:mikey forKey:@"CTO"];
//            }
//        }
//        
//        // create 10 assets
//        for (int i = 0; i < 10; i++) {
//            // create asset
//            MOAsset *asset = [[MOAsset alloc] init];
//            
//            // give it a label
//            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
//            asset.label = currentLabel;
//            asset.resaleValue = 350 + i * 17;
//            
//            // get a random number between 0 and 9 inclusive
//            NSUInteger randomIndex = random() % [employees count];
//            
//            // find that employee
//            MOEmployee *randomEmployee = [employees objectAtIndex:randomIndex];
//            [randomEmployee addAsset:asset];
//        }
//        
//        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
//        NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
//        
//        [employees sortUsingDescriptors: @[voa, eid]];
//        
//        NSLog(@"Employees: %@", employees);
//        NSLog(@"Giving up ownership of one employee");
//        [employees removeObjectAtIndex:5];
//        
//        NSLog(@"Giving up ownership of arrays");
//        employees = nil;
//    }
//    return 0;
//}

