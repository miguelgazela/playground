//
//  MOAppController.h
//  RaiseMan
//
//  Created by Miguel Oliveira on 27/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MOPreferenceController;
@class MOAboutController;

@interface MOAppController : NSObject

@property (nonatomic) MOPreferenceController *preferenceController;
@property (nonatomic) MOAboutController *aboutController;

- (IBAction)showPreferencePanel:(id)sender;
- (IBAction)showAboutPanel:(id)sender;

@end
