//
//  Document.h
//  RaiseMan
//
//  Created by Miguel Oliveira on 27/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Person;

@interface Document : NSDocument

{
    NSMutableArray *employees;
}


@property (weak) IBOutlet NSTableView *tableView;
@property (strong) IBOutlet NSArrayController *employeeController;

- (IBAction)createEmployee:(id)sender;

- (void)setEmployees:(NSMutableArray *)a;
- (void)insertObject:(Person *)p inEmployeesAtIndex:(NSUInteger)index;
- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index;


@end

