//
//  DesignerProductCellItem.h
//  TestingStuff
//
//  Created by MacMiniHome on 08/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "FFSXIBView.h"

@interface DesignerProductCellItem : FFSXIBView

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIImageView *placeholderImageView;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *imageViewTopConstraintToContainer;

@end
