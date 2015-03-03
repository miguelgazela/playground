//
//  MOAppController.m
//  RaiseMan
//
//  Created by Miguel Oliveira on 27/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOAppController.h"
#import "MOPreferenceController.h"
#import "MOAboutController.h"

@implementation MOAppController

- (IBAction)showPreferencePanel:(id)sender
{
    if (![self preferenceController]) {
        [self setPreferenceController:[[MOPreferenceController alloc] init]];
    }
    NSLog(@"showing %@", [self preferenceController]);
    [[self preferenceController] showWindow:self];
}

- (IBAction)showAboutPanel:(id)sender
{
    if (![self aboutController]) {
        [self setAboutController:[[MOAboutController alloc] init]];
    }
    NSLog(@"showing %@", [self aboutController]);
    [[self aboutController] showWindow:self];}

@end
