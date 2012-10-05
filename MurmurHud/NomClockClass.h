//
//  NomClockClass.h
//  NomClock
//
//  Created by Kyle J. McElyea on 10/4/12.
//  Copyright (c) 2012 OmNomRobot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NomClockClass : NSObject {
    


    
}

@property(nonatomic,assign)NSString *secondpadding;
@property(nonatomic,assign)NSString *minutepadding;
@property(nonatomic,assign)NSString *hourpadding;


@property(nonatomic,assign)NSString *TZsecondpadding;
@property(nonatomic,assign)NSString *TZminutepadding;
@property(nonatomic,assign)NSString *TZhourpadding;

@property(nonatomic,assign)NSString *theTime;
@property(nonatomic,strong)NSString *getTime;

@property(nonatomic,assign)NSString *theLocalTime;
@property(nonatomic,strong)NSString *getLocalTime;

@property(nonatomic,assign)NSString *theTimeFor;
@property(nonatomic,strong)NSString *getTimeFor;


@property(nonatomic,assign)NSString *currentHourReturn;

+ (NomClockClass *)instance;


-(NSString *)getTimeFor:(NSString *)theTimeZone;

-(NSString *)TZhourpadding:(NSString *)theTimeZone;
-(NSString *)TZminutepadding:(NSString *)theTimeZone;
-(NSString *)TZsecondpadding:(NSString *)theTimeZone;

@end
