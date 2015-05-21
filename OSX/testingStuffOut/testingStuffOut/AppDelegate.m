//
//  AppDelegate.m
//  testingStuffOut
//
//  Created by Miguel Oliveira on 21/05/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self window].styleMask |= NSFullSizeContentViewWindowMask;
    [[self window] setTitleVisibility:NSWindowTitleHidden];
    [[self window] setTitlebarAppearsTransparent:YES];
    
    NSLayoutConstraint *topEdgeConstraint = [NSLayoutConstraint constraintWithItem:[self controlsView] attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:[[self window] contentLayoutGuide] attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
//
    [topEdgeConstraint setActive:YES];
    
    [[self mainView] addConstraint:topEdgeConstraint];
    
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
