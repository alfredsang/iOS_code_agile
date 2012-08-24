//
//  AnswerHistoryCache.h
//  ex
//
//  Created by minglq on 12-8-14.
//
//
//2012-08-24 21:16:37.309 ex[2119:c07] ----3所对应的value是 2-4
//2012-08-24 21:16:37.309 ex[2119:c07] ----1所对应的value是 2-3
//2012-08-24 21:16:37.309 ex[2119:c07] ----4所对应的value是 2-2
//2012-08-24 21:16:37.310 ex[2119:c07] ----2所对应的value是 1-4
//2012-08-24 21:16:37.310 ex[2119:c07] ----5所对应的value是 3-3
//----(TI_HAO)所对应的value是 (ZHENGQUE_DAAN) - (DANGQIAN_DAAN)
#import <Foundation/Foundation.h>

/**
 * 利用dic
 */
@interface AnswerHistoryCache : NSObject{
    NSMutableDictionary *_cache;
}
 
@property(nonatomic,assign,readwrite) int max;
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
