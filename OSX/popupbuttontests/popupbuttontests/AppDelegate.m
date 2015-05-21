//
//  AppDelegate.m
//  popupbuttontests
//
//  Created by Miguel Oliveira on 18/05/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSMenu *theMenu = [[NSMenu alloc] initWithTitle:@""];
    NSMenuItem *Item = [[NSMenuItem alloc] initWithTitle:@"NameList" action:NULL keyEquivalent:@""];
    
    [Item setView:[self menuView]];
    [theMenu addItem:Item];
    
    NSMenuItem *Item2 = [[NSMenuItem alloc] initWithTitle:@"Man" action:NULL keyEquivalent:@""];
    
    [theMenu addItem:Item2];
    
    [[self button] setMenu:theMenu];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
