//
//  DesignerCellItem.h
//  TestingStuff
//
//  Created by MacMiniHome on 08/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "FFSXIBView.h"

@class DesignerProductCellItem;

@interface DesignerCellItem : UIView

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@property (nonatomic, weak) IBOutlet UIView *separatorView;

@property (nonatomic, weak) IBOutlet DesignerProductCellItem *leftItem;
@property (nonatomic, weak) IBOutlet DesignerProductCellItem *centerItem;
@property (nonatomic, weak) IBOutlet DesignerProductCellItem *rightItem;

- (void)configureWithDesigner:(NSString *)designer;

@end
