//
//  Document.m
//  RaiseMan
//
//  Created by Miguel Oliveira on 27/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "Document.h"
#import "Person.h"

static void *DocumentKVOContext;

@interface Document ()

@end

@implementation Document

- (void)startObservingPerson:(Person *)person
{
    [person addObserver:self forKeyPath:@"personName" options:NSKeyValueObservingOptionOld context:&DocumentKVOContext];
    [person addObserver:self forKeyPath:@"expectedRaise" options:NSKeyValueObservingOptionOld context:&DocumentKVOContext];
}

- (void)stopObservingPerson:(Person *)person
{
    [person removeObserver:self forKeyPath:@"personName" context:&DocumentKVOContext];
    [person removeObserver:self forKeyPath:@"expectedRaise" context:&DocumentKVOContext];
}

- (void)changeKeyPath:(NSString *)keyPath ofObject:(id)object toValue:(id)newValue
{
    [object setValue:newValue forKeyPath:keyPath];
}

 -(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context != &DocumentKVOContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    NSUndoManager *undo = [self undoManager];
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    if (oldValue == [NSNull null]) {
        oldValue = nil;
    }
    NSLog(@"oldvalue = %@", oldValue);
    [[undo prepareWithInvocationTarget:self] changeKeyPath:keyPath ofObject:object toValue:oldValue];
    [undo setActionName:@"Edit"];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        employees = [[NSMutableArray alloc] init];
    }
    return self;
}

- (IBAction)createEmployee:(id)sender
{
    NSWindow *w = [_tableView window];
    
    BOOL editingEnded = [w makeFirstResponder:w];
    if (!editingEnded) {
        NSLog(@"Unable to end editing");
        return;
        
    }
    
    NSUndoManager *undo = [self undoManager];
}

- (void)setEmployees:(NSMutableArray *)a
{
    if (a == employees) {
        return;
    }
    
    for (Person *p in employees) {
        [self stopObservingPerson:p];
    }
    
    employees = a;
    
    for (Person *p in employees) {
        [self startObservingPerson:p];
    }
}

- (void)insertObject:(Person *)p inEmployeesAtIndex:(NSUInteger)index
{
    NSLog(@"adding %@ to %@", p, employees);
    
    // add the inverse of this operation to the undo stack
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self] removeObjectFromEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Add person"];
    }
    
    // add the person to the array
    [self startObservingPerson:p];
    [employees insertObject:p atIndex:index];
}

- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index
{
    Person *p = [employees objectAtIndex:index];
    NSLog(@"removing %@ from %@", p, employees);
    
    // add the inverse of this operation to the undo stack
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self] insertObject:p inEmployeesAtIndex:index];
    if (![undo isUndoing]) {
        [undo setActionName:@"Remove person"];
    }
    
    [self stopObservingPerson:p];
    [employees removeObjectAtIndex:index];
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
