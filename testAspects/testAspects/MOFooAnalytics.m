//
//  MOFooAnalytics.m
//  testAspects
//
//  Created by MacMiniHome on 15/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "MOFooAnalytics.h"

#import "MOFooViewController.h"

@interface MOFooViewController (Analytics)

- (void)didTapFooButton:(id)sender;

@end

@implementation MOFooAnalytics

- (void)executeHooks {
    
    [MOFooViewController aspect_hookSelector:@selector(didTapFooButton:)
                  withOptions:AspectPositionAfter
                   usingBlock:^(id <AspectInfo> info, id sender) {
                       
                       NSLog(@"Analytics - didTapFooButton:");
                       
                   } error:nil];
}

@end
