//
//  MOPreferenceController.h
//  RaiseMan
//
//  Created by Miguel Oliveira on 27/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MOPreferenceController : NSWindowController

@property (nonatomic) IBOutlet NSColorWell *colorWell;
@property (nonatomic) IBOutlet NSButton *checkbox;

- (IBAction)changeBackgroundColor:(id)sender;
- (IBAction)changeNewEmptyDoc:(id)sender;

@end
