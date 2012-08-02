//
//  DM_Shiti.h
//  ex
//
//  Created by alfred sang on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DM_Shiti : NSObject
@property(nonatomic,assign,readwrite) int * tid;
@property(nonatomic,retain,readwrite) NSString *tName;
@property(nonatomic,retain,readwrite) NSString *tPicAddr;
@property(nonatomic,retain,readwrite) NSString *a1;
@property(nonatomic,retain,readwrite) NSString *a2;
@property(nonatomic,retain,readwrite) NSString *a3;
@property(nonatomic,retain,readwrite) NSString *a4;
@property(nonatomic,retain,readwrite) NSString *a5;
@property(nonatomic,assign,readwrite) int tanswer;
@property(nonatomic,retain,readwrite) NSString *tdesc;
@property(nonatomic,retain,readwrite) NSString *chapter;


- (id)initWith: (NSString *)ptName tPicAddr:(NSString *)ptPicAddr  
              a1:(NSString *) pa1   
              a2:(NSString *)pa2   
              a3:(NSString *)pa3   
              a4:(NSString *)pa4 
              a5:(NSString *)pa5   
         tanswer:(int)ptanswer 
           tdesc:(NSString *)ptdesc   
         chapter:(NSString *)pchapter;

@end
