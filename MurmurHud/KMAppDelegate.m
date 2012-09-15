//
//  KMAppDelegate.m
//  MurmurHud
//
//  Created by Kyle McElyea on 9/15/12.
//  Copyright (c) 2012 Kyle McElyea. All rights reserved.
//

#import "KMAppDelegate.h"
#import "CustomView.h"
#import "MAAttachedWindow.h"

@implementation KMAppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

-(void)awakeFromNib {
    
    [attachedWindow setLevel:NSMainMenuWindowLevel];
    float width = 25.0;
    float height = [[NSStatusBar systemStatusBar] thickness];
    NSRect viewFrame = NSMakeRect(0, 0, width, height);
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:width];
    
    [statusItem setView:[[CustomView alloc] initWithFrame:viewFrame controller:self]];
    
    NSString * path = [[NSBundle mainBundle]pathForResource:@"LaunchMurmur" ofType:@"scpt"];
    NSURL * url = [NSURL fileURLWithPath:path];
    NSAppleScript * script = [[NSAppleScript alloc] initWithContentsOfURL:url error:nil];
    [script executeAndReturnError:nil];
}

- (void)toggleAttachedWindowAtPoint:(NSPoint)pt
{
    // Attach/detach window.
    if (!attachedWindow) {
        attachedWindow = [[MAAttachedWindow alloc] initWithView:_view
                                                attachedToPoint:pt
                                                       inWindow:nil
                                                         onSide:MAPositionBottom
                                                     atDistance:18.0];
        [attachedWindow makeKeyAndOrderFront:self];
    } else {
        [attachedWindow orderOut:self];
        
        attachedWindow = nil;
    }
}


#pragma mark Actions

-(IBAction)startMurmur:(id)sender {
    NSString * path = [[NSBundle mainBundle]pathForResource:@"LaunchMurmur" ofType:@"scpt"];
    NSURL * url = [NSURL fileURLWithPath:path];
    NSAppleScript * script = [[NSAppleScript alloc] initWithContentsOfURL:url error:nil];
    [script executeAndReturnError:nil];
    
}


-(IBAction)stopMurmur:(id)sender {
    NSString * path = [[NSBundle mainBundle]pathForResource:@"TerminalQuit" ofType:@"scpt"];
    NSURL * url = [NSURL fileURLWithPath:path];
    NSAppleScript * script = [[NSAppleScript alloc] initWithContentsOfURL:url error:nil];
    [script executeAndReturnError:nil];
    
}

-(IBAction)quitHud:(id)sender {
    
    [NSApp terminate:self];
}

#pragma mark End Application

-(void)applicationWillTerminate:(NSNotification *)notification {

    _view = nil;
    _statusMenu = nil;
    
}

@end
