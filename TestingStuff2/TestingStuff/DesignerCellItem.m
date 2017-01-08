//
//  DesignerCellItem.m
//  TestingStuff
//
//  Created by MacMiniHome on 08/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "DesignerCellItem.h"
#import "UIColor+Utils.h"

@implementation DesignerCellItem

- (instancetype)init {
    self = [super init];
    if (self) {
        
        NSString *className = NSStringFromClass([self class]);
        self = [[[NSBundle bundleForClass:[self class]] loadNibNamed:className owner:self options:nil] firstObject];
    }
    
    return self;
}

- (void)configureWithDesigner:(NSString *)designer {
    
    [self.titleLabel setText:[designer uppercaseString]];
    [self.separatorView setBackgroundColor:[UIColor colorWithHEX:@"#e5e5e5"]];
}

@end
