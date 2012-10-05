//
//  KMHudController.h
//  MurmurHud
//
//  Created by Kyle McElyea on 10/4/12.
//  Copyright (c) 2012 Kyle McElyea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMHudController : NSObject {
    int delay;
    
}

@property(assign)NSTimer *delaytimer;
@property(assign)IBOutlet NSComboBox *timebox;
@property(assign)IBOutlet NSSegmentedControl *timewaitcontrol;

-(IBAction)startMurmur:(id)sender;
-(IBAction)stopMurmur:(id)sender;
-(IBAction)quitHud:(id)sender;

@end
