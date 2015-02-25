//
//  main.m
//  InterestingNames
//
//  Created by Miguel Oliveira on 19/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // read in file as a huge string
        NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        // break it into an array of strings
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];
        
        NSArray *words = @[@"aaron", @"world", @"wolf", @"apple"];
        
        // Go through the array one string at a time
        for (NSString *n in names) {
            // look for the string "aa" in a case-insensitive manner
            
            for (NSString *w in words) {
                NSComparisonResult equal = [w caseInsensitiveCompare:n];
//                NSRange r = [n rangeOfString:w options:NSCaseInsensitiveSearch];
                
                // was it found?
                if (equal == NSOrderedSame) {
                    NSLog(@"%@", n);
                }
            }
        }
    }
    return 0;
}
