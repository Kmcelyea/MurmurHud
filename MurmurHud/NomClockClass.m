//
//  NomClockClass.m
//  NomClock
//
//  Created by Kyle J. McElyea on 10/4/12.
//  Copyright (c) 2012 OmNomRobot. All rights reserved.
//

#import "NomClockClass.h"

@implementation NomClockClass

+ (NomClockClass *)instance {
    static NomClockClass *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[NomClockClass alloc] init ];
    });
    
    return _instance;
}

-(NSString *)getTimeFor:(NSString*)theTimezone{
    
    _theTimeFor = [NSString stringWithFormat:@"%@:%@:%@ %@",[self TZhourpadding:theTimezone],[self TZminutepadding:theTimezone],[self TZsecondpadding:theTimezone],[self TZAbbreviation:theTimezone]];
    
    return _theTimeFor;
}

-(NSString *)getTime{
    
    _theTime = [NSString stringWithFormat:@"%@:%@:%@ %@", [self hourpadding],[self minutepadding],[self secondpadding], [self LocalTZAbbreviation]];
    
    return _theTime;
}

-(NSString *)getLocalTime{
    if ([self currentHour]==24){
        _theLocalTime = [NSString stringWithFormat:@"%@ AM", [self hourpadding]];
    }
    if ([self currentHour]>=12){
        _theLocalTime = [NSString stringWithFormat:@"%@ PM", [self hourpadding]];
    }
    if ([self currentHour]<12){
        _theLocalTime = [NSString stringWithFormat:@"%@ AM", [self hourpadding]];
    }
    return _theLocalTime;
}


-(NSString * )currentHourReturn {
    
    NSString * currentHour = [NSString stringWithFormat:@"%ld",[self currentHour]];
    
    return currentHour;
}

-(NSInteger)currentHour {
    
    NSDate *now = [NSDate date];
    
    NSTimeZone *timezone = [NSTimeZone timeZoneWithAbbreviation:[self LocalTZAbbreviation]];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:timezone];
    
    NSDateComponents * components = [calendar components:NSHourCalendarUnit fromDate:now];
    
    return [components hour];
    
}

-(NSInteger)currentMinute {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSMinuteCalendarUnit fromDate:now];
    
    return [components minute];
    
}

-(NSInteger)currentSecond {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSSecondCalendarUnit fromDate:now];
    
    return [components second];
    
}

-(NSString *)LocalTZAbbreviation {
    NSTimeZone * localTZ = [NSTimeZone localTimeZone];
    
    return [localTZ abbreviation];
    
    
}


-(NSInteger)currentTZHour:(NSString *)theTimezone {
    NSDate *now = [NSDate date];
    
    NSTimeZone *timezone = [NSTimeZone timeZoneWithAbbreviation:theTimezone];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:timezone];
    
    NSDateComponents * components = [calendar components:NSHourCalendarUnit fromDate:now];
    
    return [components hour];
    
}

-(NSInteger)currentTZMin:(NSString *)theTimezone {
    NSDate *now = [NSDate date];
    
    NSTimeZone *timezone = [NSTimeZone timeZoneWithAbbreviation:theTimezone];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:timezone];
    
    NSDateComponents * components = [calendar components:NSMinuteCalendarUnit fromDate:now];
    
    return [components minute];
    
}

-(NSInteger)currentTZSec:(NSString *)theTimezone {
    NSDate *now = [NSDate date];
    
    NSTimeZone *timezone = [NSTimeZone timeZoneWithAbbreviation:theTimezone];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:timezone];
    
    NSDateComponents * components = [calendar components:NSSecondCalendarUnit fromDate:now];
    
    return [components second];
    
}

-(NSString *)TZAbbreviation:(NSString *)abbreviation {
    
    NSTimeZone *timezone = [NSTimeZone timeZoneWithAbbreviation:abbreviation];
    return  [timezone abbreviation];
    
}

-(NSTimeZone *)TZWithAbbrivation:(NSString *)abbreviation {
    
    NSTimeZone *timezone = [NSTimeZone timeZoneWithAbbreviation:abbreviation];
    return  timezone;
    
}

-(NSString *)hourpadding {
    if ([self currentHour]<=10) {
        _hourpadding = [NSString stringWithFormat:@"0%ld",[self currentHour]];
    }
    if ([self currentHour]>=10) {
        _hourpadding = [NSString stringWithFormat:@"%ld", [self currentHour]];
    }
    return _hourpadding;
    
}

-(NSString *)minutepadding {
    if ([self currentMinute]<=10) {
        _minutepadding = [NSString stringWithFormat:@"0%ld",[self currentMinute]];
    }
    if ([self currentMinute]>=10) {
        _minutepadding = [NSString stringWithFormat:@"%ld", [self currentMinute]];
    }
    return _minutepadding;
}

-(NSString *)secondpadding {
    if ([self currentSecond]<=10) {
        _secondpadding = [NSString stringWithFormat:@"0%ld",[self currentSecond]];
    }
    if ([self currentSecond]>=10) {
        _secondpadding = [NSString stringWithFormat:@"%ld", [self currentSecond]];
    }
    return _secondpadding;

}


-(NSString *)TZhourpadding:(NSString *)theTimeZone {
    if ([self currentTZHour:theTimeZone]<=10) {
        _hourpadding = [NSString stringWithFormat:@"0%ld",[self currentTZHour:theTimeZone]];
    }
    if ([self currentTZHour:theTimeZone]>=10) {
        _hourpadding = [NSString stringWithFormat:@"%ld", [self currentTZHour:theTimeZone]];
    }
    return _hourpadding;
    
}

-(NSString *)TZminutepadding:(NSString *)theTimeZone {
    if ([self currentTZMin:theTimeZone]<=10) {
        _minutepadding = [NSString stringWithFormat:@"0%ld",[self currentTZMin:theTimeZone]];
    }
    if ([self currentMinute]>=10) {
        _minutepadding = [NSString stringWithFormat:@"%ld", [self currentTZMin:theTimeZone]];
    }
    return _minutepadding;
}

-(NSString *)TZsecondpadding:(NSString *)theTimeZone {
    if ([self currentTZSec:theTimeZone]<=10) {
        _secondpadding = [NSString stringWithFormat:@"0%ld",[self currentTZSec:theTimeZone]];
    }
    if ([self currentTZSec:theTimeZone]>=10) {
        _secondpadding = [NSString stringWithFormat:@"%ld", [self currentTZSec:theTimeZone]];
    }
    return _secondpadding;
    
}

@end
