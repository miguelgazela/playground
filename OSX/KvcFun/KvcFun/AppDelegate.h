//
//  AppDelegate.h
//  KvcFun
//
//  Created by Miguel Oliveira on 26/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic) int fido;

- (IBAction)incrementFido:(id)sender;

@end

