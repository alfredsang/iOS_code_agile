//
//  DM_Shoucang.h
//  ex
//
//  Created by minglq on 12-8-24.
//
//

#import <Foundation/Foundation.h>

@interface DM_Shoucang : NSObject
/**
 * 题号
 */
@property(nonatomic,assign,readwrite) int tnumber;
/**
 * 题号-编号
 */
@property(nonatomic,assign,readwrite) int tId;
/**
 * 题目内容
 */
@property(nonatomic,retain,readwrite) NSString *tname;
/**
 * 创建时间
 */
@property(nonatomic,retain,readwrite) NSString *ct;


- (id)initWithId:(int)ptnumber
             tid:(int)ptid
           tname:(NSString *)ptname
              ct:(NSString *)pct;

@end
