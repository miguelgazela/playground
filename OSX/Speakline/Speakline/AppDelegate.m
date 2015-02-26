//
//  AppDelegate.m
//  Speakline
//
//  Created by Miguel Oliveira on 26/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

# pragma mark Overloaded Functions

- (instancetype)init
{
    if (self = [super init]) {
        
        // logs can help the beginner understand what
        // is happening and hunt down bugs
        NSLog(@"init");
        
        // Create a new instance of NSSpeechSynthesizer
        // with the default voice
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

# pragma mark Actions

- (IBAction)stopIt:(id)sender
{
    NSLog(@"Stopping");
    [_speechSynth stopSpeaking];
}

- (IBAction)sayIt:(id)sender
{
    NSString *string = [[self textField] stringValue];
    
    // is the string zero-length?
    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length", [self textField]);
        return;
    }
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say %@", string);
}
@end
