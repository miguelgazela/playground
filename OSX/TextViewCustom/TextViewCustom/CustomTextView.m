//
//  CustomTextView.m
//  TextViewCustom
//
//  Created by Miguel Oliveira on 24/03/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "CustomTextView.h"

@implementation CustomTextView

- (instancetype) initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if(self) {
        NSFont* fnt = self.font;
        NSFont* regular = [NSFont systemFontOfSize:0];
        BOOL restoreFont = NO;
        if(regular != self.font) restoreFont = YES;
        [self commonInit];
        if(restoreFont) self.font = fnt;
    }
    return self;
}

- (instancetype) initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if(self) {
        [self commonInit];
    }
    return self;
}

- (void) commonInit {
//    self.font = [NSFont fontWithName:@"Helvetica Neue Thin" size:16.0];
    self.bordered = false;
    self.backgroundColor = [NSColor clearColor];
    self.focusRingType = NSFocusRingTypeNone;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [NSGraphicsContext saveGraphicsState];
    
    NSRect bounds = [self bounds];
    [self.textColor set];
    
    NSBezierPath *bottomLine = [NSBezierPath bezierPath];
    NSPoint p = NSZeroPoint;//bounds.origin;
    p.y = bounds.size.height;
    [bottomLine moveToPoint:p];
    p.x += bounds.size.width;
    [bottomLine lineToPoint:p];
    [bottomLine stroke];
    
    [NSGraphicsContext restoreGraphicsState];
    //	[super drawRect:dirtyRect];
}

@end
