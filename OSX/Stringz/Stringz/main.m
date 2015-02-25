//
//  main.m
//  Stringz
//
//  Created by Miguel Oliveira on 23/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0; i < 10; i++) {
            [str appendString:@"Aaron is cool!\n"];
        }
        
        // declare a pointer to an NSError object, but do not instantiate it.
        // The NSError instance will only be created if there is, in fact, an error.
        NSError *error;
        
        // Pass the NSError pointer by reference to the NSString method
        
        BOOL success = [str writeToFile:@"cool.txt/"
                             atomically:YES
                               encoding:NSUTF8StringEncoding
                                  error:&error];
        
        // test the returns BOOl, and query the NSError if the write failed
        if (success) {
            NSLog(@"Done writing to cool.txt");
        } else {
            NSLog(@"Writing failed: %@", [error localizedDescription]);
        }
        
        NSError *errorReading;
        NSString *str2 = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
                                                         encoding:NSASCIIStringEncoding
                                                            error:&errorReading];
        
        if (!str2) {
            NSLog(@"Read failed: %@", [error localizedDescription]);
        } else {
            NSLog(@"resolv.conf looks like this: %@", str2);
        }
        
    }
    return 0;
}
