//
//  AppDelegate.m
//  StringLenghtCounter
//
//  Created by Miguel Oliveira on 26/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)countIt:(id)sender
{
    NSString *string = [[self textField] stringValue];
    NSString *result = [NSString stringWithFormat:@"'%@' has %d characters.", string, (unsigned int)[string length]];
    
    [[self labelField] setStringValue:result];
}
@end
