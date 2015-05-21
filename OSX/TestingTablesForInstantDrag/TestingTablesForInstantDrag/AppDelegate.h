//
//  AppDelegate.h
//  TestingTablesForInstantDrag
//
//  Created by Miguel Oliveira on 13/04/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

