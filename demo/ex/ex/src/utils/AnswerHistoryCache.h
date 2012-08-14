//
//  AnswerHistoryCache.h
//  ex
//
//  Created by minglq on 12-8-14.
//
//

#import <Foundation/Foundation.h>

/**
 * 利用dic
 */
@interface AnswerHistoryCache : NSObject{
    NSMutableDictionary *_cache;
}


/**
 * 增加题号和答案
 */
- (void)add:(NSString *)tNumber andAnswer:(NSString *)anwser;

/**
 * 清空
 */
- (void)clean;

/**
 * 归档
 */
- (void)archive;

/**
 * 
 */
- (NSDictionary *)getCache;

@end
