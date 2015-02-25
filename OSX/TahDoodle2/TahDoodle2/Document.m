//
//  Document.m
//  TahDoodle2
//
//  Created by Miguel Oliveira on 24/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

# pragma mark - NSDocument Overrides

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // this method is called when our document is being saved
    // you are expected to hand the caller an NSData object wraping our data
    // so that it can be written to disk
    // If there is no array, write out an empty array
    if (!self.tasks) {
        self.tasks = [NSMutableArray array];
    }
    
    // pack the tasks array into an NSData object
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:self.tasks format:NSPropertyListXMLFormat_v1_0 options:0 error:outError];
    
    // return the newly-packed NSData object
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // this method is called when a document is being loaded
    // You are handed an NSData object and expected to pull our data out of it
    // extract the tasks
    self.tasks = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListMutableContainers format:NULL error:outError];
    
    // return success or failure depending on success of the above call
    return (self.tasks != nil);
}

# pragma mark - Data Source Methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.tasks count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return [self.tasks objectAtIndex:row];
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    [self.tasks replaceObjectAtIndex:row withObject:object];
    [self updateChangeCount:NSChangeDone];
}



# pragma mark - Actions

- (void)addTask:(id)sender
{
    if (!self.tasks) {
        self.tasks = [NSMutableArray array];
    }
    
    [self.tasks addObject:@"New item"];
    [self.taskTable reloadData];
    [self updateChangeCount:NSChangeDone];
}

- (void)deleteTask:(id)sender
{
    NSInteger selectedRow = [self.taskTable selectedRow];
    
    // remove the task from the table
    [self.taskTable removeRowsAtIndexes:[NSIndexSet indexSetWithIndex:selectedRow]
                          withAnimation: NSTableViewAnimationSlideRight];
    
    // remove the task from the data source
    [self.tasks removeObjectAtIndex:selectedRow];
    
    [self.taskTable reloadData];
}

@end
