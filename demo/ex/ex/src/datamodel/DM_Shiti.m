//
//  DM_Shiti.m
//  ex
//
//  Created by alfred sang on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DM_Shiti.h"

@implementation DM_Shiti

@synthesize myid;
@synthesize zid;
@synthesize tid;
@synthesize tName;
@synthesize tPicAddress;
@synthesize a1;
@synthesize a2;
@synthesize a3;
@synthesize a4;
@synthesize a5;
@synthesize tanswer;
@synthesize tdesc;



- (id)initWithId:(int)pmyid
             tid:(NSString *)ptid 
             zid:(NSString *)pzid 
          ptName:(NSString *)ptName 
     tPicAddress:(NSString *)ptPicAddr  
              a1:(NSString *)pa1   
              a2:(NSString *)pa2   
              a3:(NSString *)pa3   
              a4:(NSString *)pa4 
              a5:(NSString *)pa5   
         tanswer:(NSString *)ptanswer 
           tdesc:(NSString *)ptdesc
{
    if (self = [super init]) {
        
        self.myid = pmyid;
        self.tid = ptid;
        self.zid = pzid;
        self.tName = ptName;
        self.tPicAddress = ptPicAddr;
        self.a1 = pa1;
        self.a2 = pa2;
        self.a3 = pa3;
        self.a4 = pa4;
        self.a5 = pa5;
//        self.tanswer = [NSString stringWithFormat:@"%c",[ptanswer characterAtIndex:[ptanswer length]]];
        
        self.tanswer = [ptanswer stringByReplacingOccurrencesOfString:@"n" withString:@""];
        NSLog(@"%@",self.tanswer);
        self.tdesc = ptdesc;
    }
    return self;
}


-(void)dealloc{ 
    [super dealloc];
}

@end
