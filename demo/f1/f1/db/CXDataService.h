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


@end
