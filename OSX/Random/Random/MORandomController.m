//
//  MORandomController.m
//  Random
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MORandomController.h"

@implementation MORandomController

- (IBAction)generate:(id)sender
{
    // generate a number between 1 and 100 inclusive
    int generated = (int)(random() % 100) + 1;
    
    NSLog(@"generated = %d", generated);
    
    // Ask the text field to change what it is displaying
    [self.textField setIntValue:generated];
}

- (IBAction)seed:(id)sender
{
    // seed the random number generator with the time
    srandom((unsigned)time(NULL));
    [self.textField setStringValue:@"Generator seeded"];
}

- (void)awakeFromNib
{
    NSDate *now = [NSDate date];
    [self.textField setObjectValue:now];
}

@end
