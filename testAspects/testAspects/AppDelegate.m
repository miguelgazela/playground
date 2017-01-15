//
//  AppDelegate.m
//  testAspects
//
//  Created by MacMiniHome on 12/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "AppDelegate.h"

#import "MOAnalyticsManager.h"
#import "MOBarViewController.h"
#import "MOFooViewController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (nonatomic, strong) MOAnalyticsManager *analyticsManager;

@property (nonatomic, strong) MOFooViewController *fooViewController;
@property (nonatomic, strong) MOBarViewController *barViewController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    // initialize views
    
    self.barViewController = [[MOBarViewController alloc] initWithNibName:[self.barViewController className] bundle:nil];
    
    self.fooViewController = [[MOFooViewController alloc] initWithNibName:[self.fooViewController className] bundle:nil];
    
    [self.fooView addSubview:self.fooViewController.view];
    [self.barView addSubview:self.barViewController.view];
    
    
    // initialize analytics
    
    self.analyticsManager = [[MOAnalyticsManager alloc] init];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
