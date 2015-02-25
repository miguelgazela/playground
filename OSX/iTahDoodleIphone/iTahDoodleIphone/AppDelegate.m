//
//  AppDelegate.m
//  iTahDoodleIphone
//
//  Created by Miguel Oliveira on 23/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "AppDelegate.h"

// helper function to fetch the path to our to-do data stored on disk
NSString *MODocPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Application delegate callbacks

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    self.tasks = [NSMutableArray array];
    // load an existing dataset or create a new one
    NSArray *plist = [NSArray arrayWithContentsOfFile:MODocPath()];
    if (plist) {
        self.tasks = [plist mutableCopy];
    } else {
        self.tasks = [NSMutableArray array];
    }
    
    // create and configure the UIWindow instance
    // A CGRect is a struct with an origin (x, y) and a size (width, height)
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:winFrame];
    
    self.window = theWindow;
    
    // define the frame rectangles of the three UI elements
    // CGRectMake() creates a CFRect from (x, y, width, height)
    CGRect tableFrame = CGRectMake(0, 80, winFrame.size.width, winFrame.size.height - 100);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    // create and configure the UITableView instance
    self.taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // make the AppDelegate the table view's dataSource
    self.taskTable.dataSource = self;
    
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task, tap Insert";
    
    // create and configure the UIButton instance
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.insertButton.frame = buttonFrame;
    
    // give the button a title
    [self.insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    [self.insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    // add ui elements to the window
    [self.window addSubview:self.taskTable];
    [self.window addSubview:self.taskField];
    [self.window addSubview:self.insertButton];
    
    // finalize the window and put it on the screen
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    // save our tasks array to disk
    [self.tasks writeToFile:MODocPath() atomically:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

# pragma mark - Actions

- (void)addTask:(id)sender
{
    // get the task
    NSString *text = [self.taskField text];
    
    // quit here if taskfield is empty
    if ([text length] == 0) {
        return;
    }
    
    [self.tasks addObject:text];
    [self.taskTable reloadData];
    
    // clear out the text field
    [self.taskField setText:@""];
    
    // dismiss the keyboard
    [self.taskField resignFirstResponder];
}

# pragma mark - Table view management

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // because this table view only has one section
    // the number of rows in it is equal to the number of items in the tasks array
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *c = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    c.textLabel.text = item;
    return c;
}

@end
