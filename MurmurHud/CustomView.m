//
//  CustomView.m


#import "CustomView.h"
#import "KMAppDelegate.h"


@implementation CustomView


- (id)initWithFrame:(NSRect)frame controller:(KMAppDelegate *)ctrlr
{
    if (self = [super initWithFrame:frame]) {
        controller = ctrlr; // deliberately weak reference.
    }
    
    return self;
}


- (void)dealloc
{
    controller = nil;
    
}


- (void)drawRect:(NSRect)rect {
    // Draw background if appropriate.
    if (clicked) {
       // [[NSColor selectedMenuItemColor] set];
       // NSRectFill(rect);
    }
    // load image from library:
    
    NSImage *icon = [NSImage imageNamed:@"20xIcon"];
    
    // prepare to center image in view (my icon is 20 x 20 px):
    
    int xoffset = (30 - 25) / 2; 
    int yoffset = ([[NSStatusBar systemStatusBar] thickness] - 20 ) / 2;
    
    // draw image into view:
    
    [icon drawInRect:NSMakeRect(xoffset, yoffset, [icon size].width, [icon size].height) fromRect:NSMakeRect(0, 0, [icon size].width, [icon size].height) operation:NSCompositeSourceOver fraction:1.0];
   
    
    
    
}


- (void)mouseDown:(NSEvent *)event
{
    NSRect frame = [[self window] frame];
    NSPoint pt = NSMakePoint(NSMidX(frame), NSMinY(frame));
    [controller toggleAttachedWindowAtPoint:pt];
    clicked = !clicked;
    [self setNeedsDisplay:YES];
}


@end
