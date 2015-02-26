//
//  WindowManager.m
//  MakeDelegate
//
//  Created by Miguel Oliveira on 26/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "WindowManager.h"

@implementation WindowManager

- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize
{
    NSSize original = [sender frame].size;
    
    if (original.width != frameSize.width && original.height != frameSize.height) {
        return NSMakeSize(frameSize.width, (frameSize.width * 2));
    } else if (original.width != frameSize.width) {
        return NSMakeSize(frameSize.width, (frameSize.width * 2));
    } else if (original.height != frameSize.height) {
        return NSMakeSize((frameSize.height / 2), frameSize.height);
    }
    return NSMakeSize(200.0, 400.0);
}

@end
