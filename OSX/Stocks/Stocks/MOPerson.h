//
//  MOPerson.h
//  Stocks
//
//  Created by Miguel Oliveira on 19/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOPerson : NSObject

@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;

- (float)bodyMassIndex;

@end
