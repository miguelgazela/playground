//
//  AppDelegate.h
//  ToDoListApplication
//
//  Created by Miguel Oliveira on 24/03/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic) NSMutableArray *tasks;

@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTableView *tableView;

- (IBAction)addTask:(id)sender;

@end

