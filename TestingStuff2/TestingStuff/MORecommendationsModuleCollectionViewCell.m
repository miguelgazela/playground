//
//  MORecommendationsModuleCollectionViewCell.m
//  TestingStuff
//
//  Created by MacMiniHome on 08/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "MORecommendationsModuleCollectionViewCell.h"

static const CGFloat cellHeight = 260;

@implementation MORecommendationsModuleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    }
    
    return self;
}

+ (CGFloat)cellHeight {
    
    return cellHeight;
}

- (void)configureWithTitle:(NSString *)title {
    
    [self.titleLabel setText:[title uppercaseString]];
}

@end
