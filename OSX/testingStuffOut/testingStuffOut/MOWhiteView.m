//
//  MOWhiteView.m
//  testingStuffOut
//
//  Created by Miguel Oliveira on 21/05/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "MOWhiteView.h"

@implementation MOWhiteView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    [[NSColor whiteColor] set];
    NSRectFill([self bounds]);
}

@end
