//
//  main.m
//  VowelMovement
//
//  Created by Miguel Oliveira on 23/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // create array of strings and a container for devowelized ones
        NSArray *originalStrings = @[@"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Missisippi"];
        NSLog(@"original strings. %@", originalStrings);
        
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        
        // create a list of characters to be removed from the string
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        // declare the block variable
        void (^devowelizer)(id, NSUInteger, BOOL *);
        
        devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            // iterate over the array of vowels, replacing occurrences of each with an empty string
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            [devowelizedStrings addObject:newString];
        }; // end of block assignment
        
        // iterate over the array with your block
        [originalStrings enumerateObjectsUsingBlock:devowelizer];
        NSLog(@"devowelized strings: %@", devowelizedStrings);
    }
    return 0;
}
