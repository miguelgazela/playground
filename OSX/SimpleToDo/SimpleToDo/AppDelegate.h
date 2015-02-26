//
//  AppDelegate.h
//  SimpleToDo
//
//  Created by Miguel Oliveira on 26/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

{
    NSMutableArray *_tasks;
}

@property (nonatomic) NSArray *tasks;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSTextField *lastTaskLabel;

- (IBAction)addTask:(id)sender;

@end

