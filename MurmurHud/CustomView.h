//
//  CustomView.h

#import <Cocoa/Cocoa.h>

@class KMAppDelegate;
@interface CustomView : NSView {
    __weak KMAppDelegate *controller;
    BOOL clicked;
}

- (id)initWithFrame:(NSRect)frame controller:(KMAppDelegate *)ctrlr;

@end
