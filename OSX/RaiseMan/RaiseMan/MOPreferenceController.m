//
//  MOPreferenceController.m
//  RaiseMan
//
//  Created by Miguel Oliveira on 27/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "MOPreferenceController.h"

@interface MOPreferenceController ()

@end

@implementation MOPreferenceController

- (instancetype)init
{
    self = [super initWithWindowNibName:@"Preferences"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    NSLog(@"Nib file is loaded");
}

- (IBAction)changeBackgroundColor:(id)sender
{
    NSColor *color = [[self colorWell] color];
    NSLog(@"color changed to %@", color);
}

- (IBAction)changeNewEmptyDoc:(id)sender
{
    NSInteger state = [[self checkbox] state];
    NSLog(@"checkbox changed to %ld", state);
}

@end
