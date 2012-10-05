//
//  KMHudController.m
//  MurmurHud
//
//  Created by Kyle McElyea on 10/4/12.
//  Copyright (c) 2012 Kyle McElyea. All rights reserved.
//

#import "KMHudController.h"
#import "NomClockClass.h"

@interface KMHudController ()

-(void)updateTimes:(NSTimer *)timer;

@end


@implementation KMHudController

-(void)awakeFromNib {
    delay = 1800;
    [self loadViewTimes];
    
}


-(void)loadViewTimes {
    

    _delaytimer = [NSTimer scheduledTimerWithTimeInterval:delay
                                     target:self
                                   selector:@selector(updateTimes:)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)updateTimes:(NSTimer *)timer {
    
    NSString *shutdowntime = [_timebox objectValueOfSelectedItem];
    if ([[NSString stringWithFormat:@"%@",[[NomClockClass instance]currentHourReturn]] isEqualToString:shutdowntime]){
        NSString * path = [[NSBundle mainBundle]pathForResource:@"TerminalQuit" ofType:@"scpt"];
        NSURL * url = [NSURL fileURLWithPath:path];
        NSAppleScript * script = [[NSAppleScript alloc] initWithContentsOfURL:url error:nil];
        [script executeAndReturnError:nil];
        
    }
    else {
    
    NSLog(@"Current hour was == %@",[[NomClockClass instance]currentHourReturn]);
    }   
    
    
}

-(IBAction)setTImeDelay:(id)sender {
    
    NSInteger selectedSegment = [sender selectedSegment];
    NSInteger clickedSegmentTag = [[sender cell] tagForSegment:selectedSegment];
    
    switch (clickedSegmentTag)
    {
        case 0:
            delay = 900;
            [_delaytimer invalidate];
            _delaytimer = [NSTimer scheduledTimerWithTimeInterval:delay
                                                           target:self
                                                         selector:@selector(updateTimes:)
                                                         userInfo:nil
                                                          repeats:YES];
            break;
        case 1:
            delay = 1800;
            [_delaytimer invalidate];
            _delaytimer = [NSTimer scheduledTimerWithTimeInterval:delay
                                                           target:self
                                                         selector:@selector(updateTimes:)
                                                         userInfo:nil
                                                          repeats:YES];
            break;
        case 2:
            delay = 3600;
            [_delaytimer invalidate];
            _delaytimer = [NSTimer scheduledTimerWithTimeInterval:delay
                                                           target:self
                                                         selector:@selector(updateTimes:)
                                                         userInfo:nil
                                                          repeats:YES];
            break;
        default:
            break;
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


@end
