//
//  KMAppDelegate.h
//  MurmurHud
//
//  Created by Kyle McElyea on 9/15/12.
//  Copyright (c) 2012 Kyle McElyea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MAAttachedWindow;
@interface KMAppDelegate : NSObject <NSApplicationDelegate> {
    NSMenu *statusMenu;
    MAAttachedWindow *attachedWindow;
    NSStatusItem * statusItem;

}

@property (nonatomic, strong) IBOutlet NSView *view;
@property (nonatomic, strong) NSMenu *statusMenu;


-(void)toggleAttachedWindowAtPoint:(NSPoint)pt;

@end
