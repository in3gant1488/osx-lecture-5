//
//  AppDelegate.m
//  Speaker
//
//  Created by Rakhim Davletkaliyev on 12-11-12.
//  Copyright (c) 2012 Rakhim Davletkaliyev. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    speaker = [[NSSpeechSynthesizer alloc] initWithVoice:NULL];
    [speaker setDelegate:self];
    voices = [NSSpeechSynthesizer availableVoices];
}

- (IBAction)speakIt:(id)sender {
    [speaker startSpeakingString:[_textField stringValue]];
}

- (IBAction)stopIt:(id)sender {
    [speaker stopSpeaking];
}

-(void)tableViewSelectionDidChange: (NSNotification *)notification {
    NSInteger row = [_tableView selectedRow];
    if (row==-1) { return; }
    NSString *selectedVoice = [voices objectAtIndex:row];
    [speaker setVoice:selectedVoice];
}

-(void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking {
    [_textField setStringValue:@""];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView*) tv {
    return (NSInteger)[[NSSpeechSynthesizer availableVoices]count];
}

-(id)tableView:(NSTableView*) tv objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *v = [voices objectAtIndex:row];
    return v;
}



@end
