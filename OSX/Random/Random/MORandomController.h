//
//  MORandomController.h
//  Random
//
//  Created by Miguel Oliveira on 25/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface MORandomController : NSObject

@property (nonatomic) IBOutlet NSTextField *textField;

- (IBAction)seed:(id)sender;
- (IBAction)generate:(id)sender;

@end
