//
//  main.m
//  NewReadline
//
//  Created by Miguel Oliveira on 18/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>
#import <readline/readline.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Where should I start counting?");
        NSString *initialValue = [NSString stringWithUTF8String:readline(NULL)];
        NSLog(@"The timer will start at %@", initialValue);
    }
    return 0;
}
