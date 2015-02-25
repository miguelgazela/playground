//
//  main.m
//  Strings
//
//  Created by Miguel Oliveira on 18/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *description = @"My name is Miguel and I'm from Portugal.";
        NSRange match = [description rangeOfString:@"miguel"];
        
        NSLog(@"%@", description);
        if (match.location == NSNotFound) {
            NSLog(@"Not found!");
        } else {
            NSLog(@"Found!");
        }
        
        match = [description rangeOfString:@"miguel" options:NSCaseInsensitiveSearch];
        if (match.location == NSNotFound) {
            NSLog(@"Not found!");
        } else {
            NSLog(@"Found!");
            NSString *matched = [description substringWithRange:match];
            NSLog(@"%@", matched);
        }
        
        
    }
    return 0;
}
