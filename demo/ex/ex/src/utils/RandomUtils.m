//
//  RandomUtils.m
//  ex
//
//  Created by alfred sang on 12-8-8.
//  Copyright (c) 2012年 no320.com. All rights reserved.
//

#import "RandomUtils.h"

@implementation RandomUtils

+ (NSArray *)getRandomCollection:(int)from to:(int)to count:(int)count{
    NSMutableDictionary *c = [NSMutableDictionary dictionary] ;
    
    BOOL flag = YES;
    while (flag) {
        if ([c count]<count) {
            int i = [RandomUtils getRandomNumber:from to:to];
            NSString *str = [NSString stringWithFormat:@"%d",i];
            [c setObject:str forKey:str];
        }else{
            flag = NO;
        }
    }

    NSLog(@"--total--\n%d",[c count]);
    return [[c keyEnumerator] allObjects];
}

+ (int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to-from + 1)));
}


@end
