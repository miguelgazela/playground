//
//  RandomController.m
//  RandomGenerator
//
//  Created by Miguel Oliveira on 23/03/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "RandomController.h"

@implementation RandomController

- (IBAction)seed:(id)sender {
    
    srandom((unsigned)time(NULL));
}

- (IBAction)generate:(id)sender {
    
    int generated = (int) (random() % 100) + 1;

    [[self textField] setIntValue:generated];
}
@end
