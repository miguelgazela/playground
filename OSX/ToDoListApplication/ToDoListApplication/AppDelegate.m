//
//  AppDelegate.m
//  ToDoListApplication
//
//  Created by Miguel Oliveira on 24/03/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)awakeFromNib {
    _tasks = [[NSMutableArray alloc] init];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return (NSInteger)[_tasks count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return [_tasks objectAtIndex:row];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger row = [_tableView selectedRow];
    if (row == -1) {
        return;
    }
    
    NSString *selectedTask = [_tasks objectAtIndex:row];
    NSLog(@"task: %@", selectedTask);
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)addTask:(id)sender {
    NSString *newTask = [_textField stringValue];
    [_tasks addObject:newTask];
    [_tableView reloadData];
}
@end
