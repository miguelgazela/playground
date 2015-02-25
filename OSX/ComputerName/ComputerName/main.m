//
//  main.m
//  ComputerName
//
//  Created by Miguel Oliveira on 17/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSHost *host = [NSHost currentHost];
        NSString *localName = [host localizedName];
        
        NSLog(@"Host: %@", localName);
    }
    return 0;
}
