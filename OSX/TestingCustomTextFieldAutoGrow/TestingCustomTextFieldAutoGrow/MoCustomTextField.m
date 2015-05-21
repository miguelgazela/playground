//
//  MoCustomTextField.m
//  TestingCustomTextFieldAutoGrow
//
//  Created by Miguel Oliveira on 26/03/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "MoCustomTextField.h"

@implementation MoCustomTextField

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)textDidChange:(NSNotification *)notification {
    [super textDidChange:notification];
    [self invalidateIntrinsicContentSize];
}

- (NSSize)intrinsicContentSize {
    
    NSLog(@"HERE!!!!!!!!!!!");
    
    if ( ![self.cell wraps] ) {
        return [super intrinsicContentSize];
    }
    
    NSRect frame = [self frame];
    
    CGFloat width = frame.size.width;
    
    // Make the frame very high, while keeping the width
    frame.size.height = CGFLOAT_MAX;
    
    // Calculate new height within the frame
    // with practically infinite height.
    CGFloat height = [self.cell cellSizeForBounds: frame].height;
    
    return NSMakeSize(width, height);
}

@end
