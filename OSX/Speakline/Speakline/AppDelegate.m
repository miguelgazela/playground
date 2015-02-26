//
//  AppDelegate.m
//  Speakline
//
//  Created by Miguel Oliveira on 26/02/15.
//  Copyright (c) 2015 GAZELAINC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

# pragma mark Overloaded Functions

- (instancetype)init
{
    if (self = [super init]) {
        
        // logs can help the beginner understand what
        // is happening and hunt down bugs
        NSLog(@"init");
        
        // Create a new instance of NSSpeechSynthesizer
        // with the default voice
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
        [_speechSynth setDelegate:self];
        
        _voices = [NSSpeechSynthesizer availableVoices];
    }
    return self;
}

- (void)awakeFromNib
{
    // when the table view appears on screen, the default voice
    // should be selected
    NSString *defaultVoice = [NSSpeechSynthesizer defaultVoice];
    NSInteger *defaultRow = [_voices indexOfObject:defaultVoice];
    NSIndexSet *indices = [NSIndexSet indexSetWithIndex:defaultRow];
    [_tableView selectRowIndexes:indices byExtendingSelection:NO];
    [_tableView scrollRowToVisible:defaultRow];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking
{
    [_stopButton setEnabled:NO];
    [_speakButton setEnabled:YES];
    [_tableView setEnabled:YES];
    NSLog(@"Finished Speaking = %d", finishedSpeaking);
}

# pragma mark - TableView Methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    return (NSInteger)[_voices count];
}

- (id)tableView:(NSTableView *)tv objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString *v = [_voices objectAtIndex:row];
    NSDictionary *dict = [NSSpeechSynthesizer attributesForVoice:v];
    
    return [dict objectForKey:NSVoiceName];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSInteger row = [_tableView selectedRow];
    if (row == -1) {
        return;
    }
    NSString *selectedVoice = [_voices objectAtIndex:row];
    [_speechSynth setVoice:selectedVoice];
    NSLog(@"New voice = %@", selectedVoice);
}

# pragma mark Actions

- (IBAction)stopIt:(id)sender
{
    NSLog(@"Stopping");
    [_speechSynth stopSpeaking];
}

- (IBAction)sayIt:(id)sender
{
    NSString *string = [[self textField] stringValue];
    
    // is the string zero-length?
    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length", [self textField]);
        return;
    }
    
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say %@", string);
    
    [_stopButton setEnabled:YES];
    [_speakButton setEnabled:NO];
    [_tableView setEnabled:NO];
}
@end
