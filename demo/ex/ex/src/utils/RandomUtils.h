//
//  RandomUtils.h
//  ex
//
//  Created by alfred sang on 12-8-8.
//  Copyright (c) 2012年 no320.com. All rights reserved.
//
// test:
//    [RandomUtils getRandomCollection:0 to:1000 count:100];
//

#import <Foundation/Foundation.h>

@interface RandomUtils : NSObject

/**
 * 从0---1000中，取出100个不一样的随机数
 */
+ (NSArray *)getRandomCollection:(int)from to:(int)to count:(int)count;

/**
 * 从0---1000中，取出1个随机数
 */
+ (int)getRandomNumber:(int)from to:(int)to;

@end
