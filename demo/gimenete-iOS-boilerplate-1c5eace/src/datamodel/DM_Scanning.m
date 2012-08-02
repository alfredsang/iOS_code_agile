//
//  DM_Scanning.m
//  CaiXin
//
//  Created by alfred sang on 12-7-12.
//  Copyright (c) 2012年 iTotemStudio. All rights reserved.
//

#import "DM_Scanning.h"

@implementation DM_Scanning

@synthesize scanUrl;
@synthesize scanDate;
@synthesize scanTitle;

-(id)init:(NSString *)url withTitle:(NSString *)title withDate:(NSString *)date{
    if (self = [super init]) {
        if (date == nil) {
            date = [NSString stringWithFormat:@"%@",[NSDate date]];
        }
        self.scanUrl = url;
        self.scanDate = date;
        self.scanTitle = title;
    }
    return self;
}

-(void)dealloc{ 
    [super dealloc];
}

@end
