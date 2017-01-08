//
//  MOWishlistModuleCollectionViewCell.h
//  TestingStuff
//
//  Created by MacMiniHome on 08/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MOWishlistModuleCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak, nullable) IBOutlet UILabel *titleLabel;

+ (CGFloat)cellHeight;

- (void)configureWithTitle:(nonnull NSString *)title;

@end
