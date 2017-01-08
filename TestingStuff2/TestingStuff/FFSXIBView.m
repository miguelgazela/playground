//
//  FFSXIBView.m
//  TestingStuff
//
//  Created by MacMiniHome on 08/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "FFSXIBView.h"
#import "UIView+FFSAutoLayout.h"

@implementation FFSXIBView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self = [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        self = [self commonInit];
    }
    
    return self;
}

- (instancetype)commonInit {
    
    NSString *className = NSStringFromClass([self class]);
    self.view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:className owner:self options:nil] firstObject];
    
    [self addSubview:self.view];
    
    [self.view ffs_constrainEqualWidth:self];
    [self.view ffs_constrainEqualHeight:self];
    [self.view ffs_centerInContainer];
    
    [self customizeView];
    
    return self;
}

#pragma mark - Public

- (void)customizeView {
    
}

@end
