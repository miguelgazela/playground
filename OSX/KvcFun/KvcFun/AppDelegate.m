//
//  AppDelegate.m
//  KvcFun
//
//  Created by Miguel Oliveira on 26/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (instancetype)init
{
    if (self = [super init]) {
        [self setValue:[NSNumber numberWithInt:5] forKey:@"fido"];
        NSNumber *n = [self valueForKey:@"fido"];
        NSLog(@"fido = %@", n);
    }
    return self;
}

- (void)setFido:(int)fido
{
    NSLog(@"Setting fido = %d", fido);
    _fido = fido;
}

- (IBAction)incrementFido:(id)sender
{
    [self setFido:[self fido] + 1];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
