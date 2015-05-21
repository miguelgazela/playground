//
//  AppDelegate.m
//  TextViewCustom
//
//  Created by Miguel Oliveira on 24/03/15.
//  Copyright (c) 2015 Miguel Oliveira. All rights reserved.
//

#import "AppDelegate.h"

#import "M3ContactToken.h"

@interface AppDelegate ()

@property (nonatomic) NSArray *suggestions;

@property (nonatomic) NSArray *matches;

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)awakeFromNib {
    [_tokenField setTokenStyle:NSPlainTextTokenStyle];
    [_tokenField setCompletionDelay:0.3];
    [[_tokenField cell] setWraps:YES];
    
    _suggestions = @[@"miguel", @"mariana", @"pedro"];
    _matches = [[NSMutableArray alloc] init];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

# pragma mark NSTokenField Delegate Methods

- (NSTokenStyle)tokenField:(NSTokenField *)tokenField styleForRepresentedObject:(id)representedObject {
    
    if ([representedObject isKindOfClass:[M3ContactToken class]]) {
        return NSRoundedTokenStyle;
    }
    
    return NSPlainTextTokenStyle;
}

- (BOOL)tokenField:(NSTokenField *)tokenField hasMenuForRepresentedObject:(id)representedObject {
    
    if ([representedObject isKindOfClass:[M3ContactToken class]]) {
        return YES;
    }
    
    return NO;
    
}

- (NSArray *)tokenField:(NSTokenField *)tokenField shouldAddObjects:(NSArray *)tokens atIndex:(NSUInteger)index {
    
    return tokens;
}

- (NSArray *)tokenField:(NSTokenField *)tokenField completionsForSubstring:(NSString *)substring indexOfToken:(NSInteger)tokenIndex
    indexOfSelectedItem:(NSInteger *)selectedIndex
{
    [self setMatches:[[self suggestions] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF beginswith[cd] %@", substring]]];
    
    // prevent it from replacing what the user has typed
    *selectedIndex = -1;
    
    return [self matches];
}

- (id)tokenField:(NSTokenField *)tokenField representedObjectForEditingString:(NSString *)editingString
{
    id returnRepresentedObject = nil;
    
    NSArray *foundItems = [[self matches] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF beginswith[cd] %@", editingString]];
    
    if ([foundItems count] > 0) {
        
        NSString *foundString = [foundItems objectAtIndex:0];
        if ([foundString length] > 0) {
            
            M3ContactToken *token = [[M3ContactToken alloc] init];
            
            [token setName:@"Steve Jobs"];
            [token setEmail:@"steve.jobs@gmail.com"];
            
            returnRepresentedObject = token;
        }
    } else {
        
        M3ContactToken *token = [[M3ContactToken alloc] init];
        [token setName:editingString];
        [token setEmail:editingString];
        
        returnRepresentedObject = token;
    }
    
    return returnRepresentedObject;
}

- (NSString *)tokenField:(NSTokenField *)tokenField displayStringForRepresentedObject:(id)representedObject {
    
    NSString *string = nil;
    
    if ([representedObject isKindOfClass:[M3ContactToken class]]) {
        
        M3ContactToken *token = representedObject;
        string = [token name];
    } else {
        string = representedObject;
    }
    
    return string;
}


@end
