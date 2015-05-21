//
//  CustomButtonCell.m
//  buttonTesting
//
//  Created by Miguel Oliveira on 14/05/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "CustomButtonCell.h"

@implementation CustomButtonCell

-(void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView
{
    [[NSGraphicsContext currentContext] saveGraphicsState];
    
    frame.size.height = 22.0;
    frame.size.width = 69.0;
    
//    NSLog(@"Frame x:%f y:%f w:%f h:%f", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    
    [[NSColor clearColor] setFill];
    NSBezierPath *rectanglePath = [NSBezierPath bezierPathWithRect:frame];
    [rectanglePath fill];
    
    [[NSColor grayColor] set];
    NSBezierPath* roundedPath = [NSBezierPath bezierPathWithRoundedRect:NSInsetRect(frame, 1, 1) xRadius:3.0 yRadius:3.0];
    [roundedPath stroke];
    
    [NSGraphicsContext restoreGraphicsState];
}

- (NSRect)titleRectForBounds:(NSRect)theRect {
    /* get the standard text content rectangle */
    NSRect titleFrame = [super titleRectForBounds:theRect];
    
    /* find out how big the rendered text will be */
    NSAttributedString *attrString = self.attributedStringValue;
    NSRect textRect = [attrString boundingRectWithSize: titleFrame.size
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin ];
    
    /* If the height of the rendered text is less then the available height,
     * we modify the titleRect to center the text vertically */
    if (textRect.size.height < titleFrame.size.height) {
        titleFrame.origin.y = theRect.origin.y + (theRect.size.height - textRect.size.height) / 2.0;
        titleFrame.size.height = textRect.size.height;
    }
    
    titleFrame.origin.x = 8;
    titleFrame.origin.y = 3;
    
    return titleFrame;
}

- (NSAttributedString *)attributedTitle {
    NSFont *font = [NSFont systemFontOfSize:13.0];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, [NSColor grayColor], NSForegroundColorAttributeName, nil];
    
    return [[NSAttributedString alloc] initWithString:[self title] attributes:attributes];
}


@end
