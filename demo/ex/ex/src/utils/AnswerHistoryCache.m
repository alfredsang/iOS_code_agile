//
//  AnswerHistoryCache.m
//  ex
//
//  Created by minglq on 12-8-14.
//
//

#import "AnswerHistoryCache.h"

#define Answer_History_Cache_Key @"Answer_History_Cache_Key"

@implementation AnswerHistoryCache

- (id)init{
    if (self = [super init]) {
            
        if ([[NSUserDefaults standardUserDefaults] objectForKey:Answer_History_Cache_Key]) {
            [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:Answer_History_Cache_Key];
        }
        
        int key = [[NSUserDefaults standardUserDefaults] integerForKey:Answer_History_Cache_Key];
        _cache = [NSMutableDictionary dictionary];
    }
    return self;
}

/**
 * 增加题号和答案
 */
- (void)add:(NSString *)tNumber andAnswer:(NSString *)anwser{
    [_cache setObject:anwser forKey:tNumber];
}

/**
 * 清空
 */
- (void)clean{

}

/**
 * 归档
 */
- (void)archive{

}

- (NSDictionary *)getCache{
    return _cache;
}

@end
