//
//  AppDelegate.h
//  TextViewCustom
//
//  Created by Miguel Oliveira on 24/03/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "CustomTextView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet CustomTextView *tokenField;

@end

