//
//  RandomController.h
//  RandomGenerator
//
//  Created by Miguel Oliveira on 23/03/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface RandomController : NSObject

@property (weak) IBOutlet NSTextField *textField;

- (IBAction)seed:(id)sender;
- (IBAction)generate:(id)sender;


@end