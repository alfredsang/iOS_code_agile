//
//  DM_Scanning.h
//  CaiXin
//
//  Created by alfred sang on 12-7-12.
//  Copyright (c) 2012年 iTotemStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DM_Scanning : NSObject

@property(nonatomic,retain,readwrite) NSString *scanUrl;
@property(nonatomic,retain,readwrite) NSString *scanDate;
@property(nonatomic,retain,readwrite) NSString *scanTitle;

-(id)init:(NSString *)url withTitle:(NSString *)title withDate:(NSString *)date;

@end
