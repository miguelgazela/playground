//
//  AppDelegate.h
//  testingStuffOut
//
//  Created by Miguel Oliveira on 21/05/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, weak) IBOutlet NSView *mainView;
@property (nonatomic, weak) IBOutlet NSView *contentView;

@property (nonatomic, weak) IBOutlet NSView *controlsView;

@end

