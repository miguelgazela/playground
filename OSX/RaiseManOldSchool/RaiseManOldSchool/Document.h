//
//  Document.h
//  RaiseManOldSchool
//
//  Created by Miguel Oliveira on 27/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class MOPerson;

@interface Document : NSDocument

{
    NSMutableArray *employees;
    __weak IBOutlet NSTableView *tableView;
    __weak IBOutlet NSTextField *raiseTextField;
    __weak IBOutlet NSTextField *nameTextField;
}

- (IBAction)createEmployee:(id)sender;
- (IBAction)deleteSelectedEmployees:(id)sender;


@end

