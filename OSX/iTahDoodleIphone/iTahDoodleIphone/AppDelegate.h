//
//  AppDelegate.h
//  iTahDoodleIphone
//
//  Created by Miguel Oliveira on 23/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <UIKit/UIKit.h>

// declare a helper function that you will use to get a path
// to the location on disk where you can save the to-do list
NSString *MODocPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

@property (nonatomic) NSMutableArray *tasks;

- (void)addTask:(id)sender;

@end

