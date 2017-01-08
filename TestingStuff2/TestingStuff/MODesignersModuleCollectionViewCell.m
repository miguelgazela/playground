//
//  ModulesViewController.m
//  TestingStuff
//
//  Created by MacMiniHome on 08/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "MODesignersModuleCollectionViewCell.h"
#import "UIView+FFSAutoLayout.h"
#import "DesignerCellItem.h"

@interface MODesignersModuleCollectionViewCell ()

@property (nonatomic, strong) UIStackView *stackView;

@property (nonatomic, copy) NSArray<DesignerCellItem *> *designers;

@end

@implementation MODesignersModuleCollectionViewCell

+ (CGFloat)cellHeight {
    
    return 1173.0;
}

- (void)configure {
    
    self.stackView = [[UIStackView alloc] initWithArrangedSubviews:@[]];
    self.stackView.backgroundColor = [UIColor purpleColor];
    self.stackView.alignment = UIStackViewAlignmentFill;
    self.stackView.axis = UILayoutConstraintAxisVertical;
    
    [self.contentView addSubview:self.stackView];
    
    [self.stackView ffs_constrainTopSpaceToContainer];
    [self.stackView ffs_constrainBottomSpaceToContainer];
    [self.stackView ffs_constrainTrailingSpaceToContainer];
    [self.stackView ffs_constrainLeadingSpaceToContainer];
    
    NSMutableArray *designers = [NSMutableArray array];
    
    for (NSString *designerName in @[@"Prada", @"Gucci", @"Valentino"]) {
        
        DesignerCellItem *designer = [[DesignerCellItem alloc] init];
        [designer configureWithDesigner:designerName];
        
        [self.stackView addArrangedSubview:designer];
        
        [designers addObject:designer];
    }
    
    self.designers = [designers copy];
}

@end
