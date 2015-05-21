//
//  AppDelegate.m
//  TestingImageCreation
//
//  Created by Miguel Oliveira on 31/03/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSImageView *imageView;

@end

@implementation AppDelegate

- (void)awakeFromNib {
    
    NSImage *fallbackThumbnail = [[NSImage alloc] initWithSize:NSMakeSize(200.f, 200.f)];
    [fallbackThumbnail lockFocus];
    
    NSColor *mailcubeOrange = [NSColor colorWithCalibratedRed:247.0 green:150.0 blue:107.0 alpha:1.f];

    NSColor *backgroundFill = [NSColor colorWithCalibratedRed:1.0 green:0.5 blue:0.4 alpha:1.0];
    
    [backgroundFill setFill];
    
    [NSBezierPath fillRect:NSMakeRect(0, 0, 200.f, 200.f)];
    [fallbackThumbnail unlockFocus];
    
    [_imageView setImage:fallbackThumbnail];
    
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
