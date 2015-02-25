//
//  BNRPerson.h
//  
//
//  Created by Miguel Oliveira on 19/02/15.
//
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject

{
    // BNRPerson has two instance variables
    float _heightInMeters;
    int _weightInKilos;
}

// BNRPerson has methods to read and set itsinstance variables
- (float)heightInMeters;
- (void)setHeightInMeters:(float)h;
- (int)weightInKilos;
- (void)setWeightInKilos:(int)w;

// BNRPerson has a method that calculates the Body Mass Index
- (float)bodyMassIndex;

@end
