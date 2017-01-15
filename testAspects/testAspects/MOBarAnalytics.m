//
//  MOBarAnalytics.m
//  testAspects
//
//  Created by MacMiniHome on 15/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "MOBarAnalytics.h"

#import "MOBarViewController.h"

@interface MOBarViewController (Analytics)

- (void)didTapBarButton:(id)sender;

@end

@implementation MOBarAnalytics

- (void)executeHooks {
    
    [MOBarViewController aspect_hookSelector:@selector(didTapBarButton:)
                  withOptions:AspectPositionAfter
                   usingBlock:^(id <AspectInfo> info, id sender) {
                       
                       NSLog(@"Analytics - didTapBarButton:");
                       
                   } error:nil];
}

@end
