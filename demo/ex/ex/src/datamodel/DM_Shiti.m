//
//  DM_Shiti.m
//  ex
//
//  Created by alfred sang on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DM_Shiti.h"

@implementation DM_Shiti

@synthesize tid;
@synthesize tName;
@synthesize tPicAddr;
@synthesize a1;
@synthesize a2;
@synthesize a3;
@synthesize a4;
@synthesize a5;
@synthesize tanswer;
@synthesize tdesc;
@synthesize chapter;

- (id)initWith: (NSString *)ptName tPicAddr:(NSString *)ptPicAddr  
              a1:(NSString *) pa1   
              a2:(NSString *)pa2   
              a3:(NSString *)pa3   
              a4:(NSString *)pa4 
              a5:(NSString *)pa5   
         tanswer:(int)ptanswer 
           tdesc:(NSString *)ptdesc   
         chapter:(NSString *)pchapter {
    if (self = [super init]) {
        

        self.tName = ptName;
        self.tPicAddr = ptPicAddr;
        self.a1 = pa1;
        self.a2 = pa2;
        self.a3 = pa3;
        self.a4 = pa4;
        self.a5 = pa5;
        self.tanswer = ptanswer;
        self.tdesc = ptdesc;
        self.chapter = pchapter;
    }
    return self;
}


-(void)dealloc{ 
    [super dealloc];
}

@end
