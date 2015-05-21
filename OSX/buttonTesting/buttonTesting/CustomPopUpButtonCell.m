//
//  CustomPopUpButtonCell.m
//  buttonTesting
//
//  Created by Miguel Oliveira on 18/05/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "CustomPopUpButtonCell.h"

@implementation CustomPopUpButtonCell

-(void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView
{
    [super drawBezelWithFrame:frame inView:controlView];
    
    [[NSGraphicsContext currentContext] saveGraphicsState];
    
    frame.size.height = 22.0;
    frame.size.width = 69.0;
    
    //    NSLog(@"Frame x:%f y:%f w:%f h:%f", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    
    [[NSColor orangeColor] setFill];
    NSBezierPath *rectanglePath = [NSBezierPath bezierPathWithRect:frame];
    [rectanglePath fill];
    
//    [[NSColor grayColor] set];
//    NSBezierPath* roundedPath = [NSBezierPath bezierPathWithRoundedRect:NSInsetRect(frame, 1, 1) xRadius:3.0 yRadius:3.0];
//    [roundedPath stroke];
    
    [NSGraphicsContext restoreGraphicsState];
}

@end
