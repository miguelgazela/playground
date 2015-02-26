//
//  AppDelegate.m
//  SimpleToDo
//
//  Created by Miguel Oliveira on 26/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSArray *)tasks
{
    return [_tasks copy];
}

- (void)setTasks:(NSArray *)tasks
{
    _tasks = [tasks mutableCopy];
}

#pragma mark - DataSource Methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return (NSInteger)[_tasks count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return [_tasks objectAtIndex:row];
}

- (IBAction)addTask:(id)sender
{
    NSString *string = [_textField stringValue];
    
    if (!_tasks) {
        _tasks = [[NSMutableArray alloc] init];
    }
    
    if ([string length] == 0) {
        NSLog(@"No task was added.");
        return;
    }
    
    [_tasks addObject:string];
    [_tableView reloadData];
    [_lastTaskLabel setStringValue:string];
    [_textField setStringValue:@""];
}
@end
