//
//  DM_Shiti.h
//  ex
//
//  Created by alfred sang on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DM_Shiti : NSObject


//- id          自增id
//- tid         章节-带点
//- zid         章节-数值
//- tName       试题内容
//- tPicAddress 图片地址
//- a1          试题选项
//- a2          试题选项
//- a3          试题选项
//- a4          试题选项
//- tanswer     答案
//- tdesc       答案解释或提示

@property(nonatomic,assign,readwrite) int myid;
@property(nonatomic,retain,readwrite) NSString *tid;
@property(nonatomic,retain,readwrite) NSString *zid;
@property(nonatomic,retain,readwrite) NSString *tName;
@property(nonatomic,retain,readwrite) NSString *tPicAddress;
@property(nonatomic,retain,readwrite) NSString *a1;
@property(nonatomic,retain,readwrite) NSString *a2;
@property(nonatomic,retain,readwrite) NSString *a3;
@property(nonatomic,retain,readwrite) NSString *a4;
@property(nonatomic,retain,readwrite) NSString *a5;
@property(nonatomic,retain,readwrite) NSString *tanswer;
@property(nonatomic,retain,readwrite) NSString *tdesc;


- (id)initWithId:(int)pmyid
             tid:(NSString *)ptid 
           zid:(NSString *)pzid 
        ptName:(NSString *)ptName 
   tPicAddress:(NSString *)ptPicAddr  
            a1:(NSString *) pa1   
            a2:(NSString *)pa2   
            a3:(NSString *)pa3   
            a4:(NSString *)pa4 
            a5:(NSString *)pa5   
       tanswer:(NSString *)ptanswer 
         tdesc:(NSString *)ptdesc;

 

@end
