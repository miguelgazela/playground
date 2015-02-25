//
//  MOLogger.h
//  Callbacks
//
//  Created by Miguel Oliveira on 23/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOLogger : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

{
    NSMutableData *_incomingData;
}

@property (nonatomic) NSDate *lastTime;

- (NSString *)lastTimeString;
- (void)updateLastTime:(NSTimer *)t;

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data;

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error;

@end
