//
//  main.m
//  ImageFetch
//
//  Created by Miguel Oliveira on 23/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL
                                                         error:&error];
        
        if (!data) {
            NSLog(@"Fetch failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
        
        // the function returns an array of paths
        NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
        
        // but I know the user has exactly one desktop directory
        NSString *desktopPath = desktops[0];
        
        BOOL written = [data writeToFile:@"/tmp/google.png"
                                 options:NSDataWritingAtomic
                                   error:&error];
        
        if (!written) {
            NSLog(@"Write failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"Success");
        
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        NSLog(@"The file read from the disk has %lu bytes", (unsigned long)[readData length]);
    }
    return 0;
}
