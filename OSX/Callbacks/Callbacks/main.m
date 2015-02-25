//
//  main.m
//  Callbacks
//
//  Created by Miguel Oliveira on 23/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MOLogger *logger = [[MOLogger alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:logger
                                                 selector:@selector(zoneChange:)
                                                     name:NSSystemTimeZoneDidChangeNotification
                                                   object:nil];
        
        NSURL *url = [NSURL URLWithString:@"http://www.gutenber.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request
                                                                              delegate:logger
                                                                      startImmediately:YES];
        
        
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                          target:logger
                                                        selector:@selector(updateLastTime:)
                                                        userInfo:nil
                                                         repeats:YES];
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
