//
//  MOEmployee.h
//  Stocks
//
//  Created by Miguel Oliveira on 19/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOPerson.h"
@class MOAsset;

@interface MOEmployee : MOPerson

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSSet *assets;

- (double)yearsOfEmployment;
- (void)addAsset:(MOAsset *)a;
- (unsigned int)valueOfAssets;

@end
