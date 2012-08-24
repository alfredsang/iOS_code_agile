//
//  CXDataService.h
//  CaiXin
//
//  Created by alfred sang on 12-7-11.
//  Copyright (c) 2012年 iTotemStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

#import "DM_Scanning.h"
#import "DM_Shiti.h"
#import "DM_Shoucang.h"

@interface CXDataService : NSObject{
    FMDatabase *db;
    FMDatabaseQueue *queue;
}

+ (id)sharedInstance;

// - (void)cx_update;
// DM_Scanning
- (NSArray *)scanning_find_all;
- (void)scanning_del_by_scanTitle:(NSString *)scanurl;
- (void)scanning_add:(DM_Scanning *)s;


#pragma mark - shiti

- (DM_Shiti *)shiti_find_by_id:(int)tid;

/**
 * 获取所有试题数目
 */
- (int)shiti_count_number;

/**
 * 随机查处所有试题
 */
- (NSMutableArray *)shiti_find_all_random;

/**
 * 随机查处所有试题对应的key=id
 */
- (NSMutableArray *)shiti_find_all_key_random;

#pragma mark - shoucang

/**
 * tNumber = 题号
 * tName   = 试题说明
 */
- (void)shoucang_add:(int)tNumber andTid:(int)tid andTName:(NSString *)tName;

/**
 * 查处所有收藏
 */
- (NSMutableArray *)shoucang_find_all;

@end
