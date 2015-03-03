//
//  Document.m
//  RaiseManOldSchool
//
//  Created by Miguel Oliveira on 27/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "Document.h"
#import "MOPerson.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        employees = [NSMutableArray array];
    }
    return self;
}

# pragma mark - Action methods

- (IBAction)createEmployee:(id)sender
{
    MOPerson *newEmployee = [[MOPerson alloc] init];
    [employees addObject:newEmployee];
    [tableView reloadData];
}

- (IBAction)deleteSelectedEmployees:(id)sender
{
    
}

# pragma mark - Data source methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [employees count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    // what is the identifier for the column
    NSString *identifier = [tableColumn identifier];
    
    // what person?
    MOPerson *person = [employees objectAtIndex:row];
    
    NSLog(@"Person : %@", person);
    
    // what is the value of the attribute named identifier?
    
    NSLog(@"value : %@", [person valueForKey:identifier]);
    
    return [person valueForKey:identifier];
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString *identifier = [tableColumn identifier];
    MOPerson *person = [employees objectAtIndex:row];
    
    [person setValue:object forKey:identifier];
}

# pragma mark - Others

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
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES;
}

@end
