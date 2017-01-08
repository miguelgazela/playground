//
//  ModulesViewController.h
//  TestingStuff
//
//  Created by MacMiniHome on 08/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModulesViewController : UIViewController

- (void)reloadWithContent;

- (CGFloat)contentHeightForTraitCollection:(nonnull UITraitCollection*)traitCollection;

@end
