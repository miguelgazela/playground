//
//  Document.h
//  TahDoodle
//
//  Created by Miguel Oliveira on 24/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument

@property (nonatomic) NSMutableArray *tasks;
@property (nonatomic) IBOutlet NSTableView *taskTable;

- (IBAction)addTask:(id)sender;

@end

