//
//  AppDelegate.h
//  Speakline
//
//  Created by Miguel Oliveira on 26/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

{
    NSSpeechSynthesizer *_speechSynth;
}

@property (weak) IBOutlet NSTextField *textField;

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;


@end

