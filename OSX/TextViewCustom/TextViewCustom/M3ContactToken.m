//
//  M3ContactToken.m
//  TextViewCustom
//
//  Created by Miguel Oliveira on 25/03/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "M3ContactToken.h"

@implementation M3ContactToken

- (instancetype)initWithCoder:(NSCoder *)decoder {
    _name = [decoder decodeObjectForKey:@"name"];
    _email = [decoder decodeObjectForKey:@"email"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[self name] forKey:@"name"];
    [encoder encodeObject:[self email] forKey:@"email"];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ <%@>", [self name], [self email]];
}

@end
