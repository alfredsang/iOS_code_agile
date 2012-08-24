//
//  CXDataService.m
//  CaiXin
//
//  Created by alfred sang on 12-7-11.
//  Copyright (c) 2012年 caixin. All rights reserved.
//

#import "CXDataService.h"

#define _DBFILE_NAME [NSString stringWithFormat:@"%@",@"cx_db.sqlite"]

#define _DBFILE_DIR [self getDocumentsDir]

@interface CXDataService()
-(void)_db_create;//所有表都在此方法里创建
@end

@implementation CXDataService


+ (CXDataService *)sharedInstance {
	static CXDataService *_sharedInstance;
	if(!_sharedInstance) {
		static dispatch_once_t oncePredicate;
		dispatch_once(&oncePredicate, ^{
			_sharedInstance = [[super allocWithZone:nil] init];
        });
    }
    return _sharedInstance;
}


+ (id)allocWithZone:(NSZone *)zone {
	return [self sharedInstance];
}


- (id)copyWithZone:(NSZone *)zone {
	return self;	
}

#if (!__has_feature(objc_arc))

- (id)retain {	
	return self;	
}

- (unsigned)retainCount {
	return UINT_MAX;  //denotes an object that cannot be released
}

- (oneway void)release {
	//do nothing
}

- (id)autorelease {
	return self;	
}

#endif


//+ (id)sharedInstance
//{
//    static dispatch_once_t once;
//    static id sharedInstance;
//    dispatch_once(&once, ^{
//        sharedInstance = [[self alloc] init];
//    });
//    return sharedInstance;
//}

//-(id)init{
//    if (self = [super init]) {
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *documentsDirectory = [paths objectAtIndex:0]; 
//        NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"cx_db.sqlite"];
//        db = [FMDatabase databaseWithPath:writableDBPath];
//        if (![db open]) {
//            [db open];
//        }
//        [db open];
//        [self _db_create];
//    }
//    return self;
//}


- (NSString *)getDocumentsDir {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

- (id)init {
    if (self = [super init]) {
        NSLog(@"INFO: Begin singleton DataBaseService initialization......");
        
        NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:_DBFILE_NAME];
        
        NSString *dir = [self getDocumentsDir];
        NSString *databasePath = [dir stringByAppendingPathComponent:_DBFILE_NAME];
        NSFileManager *tempFileManager = [NSFileManager defaultManager];
        BOOL isExisted = [tempFileManager fileExistsAtPath:databasePath];
        if (!isExisted) {
            NSLog(@"INFO_OC: 复制数据库文件 database.db from %@ to %@.", bundlePath, databasePath);
            NSError *error = nil;
            BOOL success = [[NSFileManager defaultManager] copyItemAtPath:bundlePath toPath:databasePath error:&error];
            if (!success) {
                NSLog(@"ERROR_OC: Failed to create writable database file with message '%@'.", [error localizedDescription]);
            }
        }
        
        db = [[FMDatabase databaseWithPath:databasePath] retain];
        //打开sql跟踪日志
        db.traceExecution = YES;
        db.logsErrors=YES;
        
        if (![db open]) {
            NSLog(@"INFO_OC: Failed to open database.");
            [db release];
            return self;
        }
        [self _db_create];
        NSLog(@"INFO_OC: End singleton DataBaseService initialization......");
    }
    return self;
}



-(void)dealloc{
    [db close]; 
    [db release];
    [queue release];
    [super dealloc];
}

-(void)_db_create{
//     [db executeUpdate:@"create table user(name text primary key, age int)"];
//    //
////    @property (nonatomic, retain) NSURL *scanUrl;   //扫描url
////    @property (nonatomic, retain) NSDate *scanDate;     //扫描时间
////    @property (nonatomic, retain) NSString *scanTitle;      //扫描文章标题
//
//      [db executeUpdate:@"create table tb_scanning(id INTEGER primary key autoincrement,scanUrl string,scanDate string , scanTitle string)"];
    //create table tb_scanning(scanUrl string ,scanDate string , scanTitle string primary key)
    
}

- (void)cx_update{
    FMResultSet *s = [db executeQuery:@"select * from user"];
    while ([s next]) {
        //retrieve values for each record
        int a = [s intForColumn:@"age"];
        NSLog(@"--%d",a);
    }
    
    //[db executeUpdate:@"INSERT INTO myTable VALUES (?)", @"this has \" lots of ' bizarre \" quotes '"];
    
    
}

#pragma mark - Scanning methods Implemtions

- (void)scanning_add:(DM_Scanning *)s{
    [self scanning_del_by_scanTitle:s.scanUrl];
    [db executeUpdate:@"INSERT INTO tb_scanning(scanUrl,scanDate,scanTitle) VALUES (?,?,?)", s.scanUrl,s.scanDate,s.scanTitle];
}


- (void)scanning_del_by_scanTitle:(NSString *)t{
    if (t == nil || [t isEqualToString: @""]) {
        return;
    }
    
    NSString *sql = [NSString stringWithFormat:@"delete from tb_scanning where scanUrl='%@'",t];
    NSLog(@"delete sql = %@",sql);
    [db executeUpdate:sql];
}

- (NSArray *)scanning_find_all{
    FMResultSet *_rs = [db executeQuery:@"select distinct scanUrl,scanDate,scanTitle from tb_scanning order by id desc"];
    NSMutableArray *ret_array =  [[NSMutableArray alloc] init];
 
    if (_rs) {
        while ([_rs next]) {
            
            //retrieve values for each record
            NSString *url = [_rs stringForColumn:@"scanUrl"];
            NSString *date = [_rs stringForColumn:@"scanDate"];
            NSString *title = [_rs stringForColumn:@"scanTitle"];
            
            DM_Scanning *scan = [[DM_Scanning alloc] init:url withTitle:title withDate:date];
            [ret_array addObject:scan];
            [scan release];
        }
        return [ret_array autorelease];
        
    }else {
//        NSLog(OC("ERROR_OC: Failed to loadCachedMeetingServersWithGroupType with coming message : %@, error code : %d"), [db lastErrorMessage], [db lastErrorCode]);
        [ret_array release];
        ret_array = nil;
        return nil;

    }

}



#pragma mark - shiti methods Implemtions
- (DM_Shiti *)shiti_find_by_id:(int)tid{
    FMResultSet *_rs = [db executeQueryWithFormat:@"select id,tid,zid,tName,tPicAddress,a1, a2, a3 , a4 , a5 , tanswer, tdesc from tb_shiti where id=%d",tid]; 
     
    if (_rs) {
        while ([_rs next]) {
            
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

            
            NSLog(@"--%@",[_rs stringForColumn:@"tName"]  );
            //            int * tid = [_rs intForColumn:@"id"];
            int mid = [_rs intForColumn:@"id"];
            NSString *tid = [_rs stringForColumn:@"tid"];
            NSString *zid = [_rs stringForColumn:@"zid"];
            NSString *tName = [_rs stringForColumn:@"tName"];
            NSString *tPicAddress = [_rs stringForColumn:@"tPicAddress"];
            NSString *a1 = [_rs stringForColumn:@"a1"];
            NSString *a2 = [_rs stringForColumn:@"a2"];
            NSString *a3 = [_rs stringForColumn:@"a3"];
            NSString *a4 = [_rs stringForColumn:@"a4"];
            NSString *a5 = [_rs stringForColumn:@"a5"];
            NSString *tanswer = [_rs stringForColumn:@"tanswer"];
            NSString *tdesc = [_rs stringForColumn:@"tdesc"];
            
            DM_Shiti *shiti = [[DM_Shiti alloc] initWithId:mid tid:tid zid:zid ptName:tName tPicAddress:tPicAddress a1:a1 a2:a2 a3:a3 a4:a4 a5:a5 tanswer:tanswer tdesc:tdesc];
            
            return shiti ;
        }
    }
    return nil;
}
//select count(0) from tb_shiti
- (int)shiti_count_number{
    FMResultSet *_rs = [db executeQuery:@"select count(0) as tid from tb_shiti"];
    int c = 0;
    if (_rs) {
        while ([_rs next]) {
            
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
            c = [_rs intForColumn:@"tid"];
        }
    }
    return c;
}

- (NSMutableArray *)shiti_find_all_random{
    FMResultSet *_rs = [db executeQuery:@"select id,tid,zid,tName,tPicAddress,a1, a2, a3 , a4 , a5 , tanswer, tdesc from tb_shiti order by random(id)"];
    NSMutableArray *ret_array =  [[NSMutableArray alloc] init];
    
    if (_rs) {
        while ([_rs next]) {
            
            NSLog(@"--%@",[_rs stringForColumn:@"tName"]  );
            //            int * tid = [_rs intForColumn:@"id"];
            int mid = [_rs intForColumn:@"id"];
            NSString *tid = [_rs stringForColumn:@"tid"];
            NSString *zid = [_rs stringForColumn:@"zid"];
            NSString *tName = [_rs stringForColumn:@"tName"];
            NSString *tPicAddress = [_rs stringForColumn:@"tPicAddress"];
            NSString *a1 = [_rs stringForColumn:@"a1"];
            NSString *a2 = [_rs stringForColumn:@"a2"];
            NSString *a3 = [_rs stringForColumn:@"a3"];
            NSString *a4 = [_rs stringForColumn:@"a4"];
            NSString *a5 = [_rs stringForColumn:@"a5"];
            NSString *tanswer = [_rs stringForColumn:@"tanswer"];
            NSString *tdesc = [_rs stringForColumn:@"tdesc"];
            
            DM_Shiti *shiti = [[DM_Shiti alloc] initWithId:mid tid:tid zid:zid ptName:tName tPicAddress:tPicAddress a1:a1 a2:a2 a3:a3 a4:a4 a5:a5 tanswer:tanswer tdesc:tdesc];
            
            [ret_array addObject:shiti];
            [shiti release];
        }
        return [ret_array autorelease];
        
    }else {
        [ret_array release];
        ret_array = nil;
        return nil;
    }
}


- (NSMutableArray *)shiti_find_all_key_random{
    
    FMResultSet *_rs = [db executeQuery:@"select id,tid,zid,tName,tPicAddress,a1, a2, a3 , a4 , a5 , tanswer, tdesc from tb_shiti order by random(id)"];
    NSMutableArray *ret_array =  [[NSMutableArray alloc] init];
    
    if (_rs) {
        while ([_rs next]) {
            
            NSLog(@"--%@",[_rs stringForColumn:@"tName"]  );
            //            int * tid = [_rs intForColumn:@"id"];
            int mid = [_rs intForColumn:@"id"];
            NSString *tid = [_rs stringForColumn:@"tid"];
            NSString *zid = [_rs stringForColumn:@"zid"];
            NSString *tName = [_rs stringForColumn:@"tName"];
            NSString *tPicAddress = [_rs stringForColumn:@"tPicAddress"];
            NSString *a1 = [_rs stringForColumn:@"a1"];
            NSString *a2 = [_rs stringForColumn:@"a2"];
            NSString *a3 = [_rs stringForColumn:@"a3"];
            NSString *a4 = [_rs stringForColumn:@"a4"];
            NSString *a5 = [_rs stringForColumn:@"a5"];
            NSString *tanswer = [_rs stringForColumn:@"tanswer"];
            NSString *tdesc = [_rs stringForColumn:@"tdesc"];
            
            DM_Shiti *shiti = [[DM_Shiti alloc] initWithId:mid tid:tid zid:zid ptName:tName tPicAddress:tPicAddress a1:a1 a2:a2 a3:a3 a4:a4 a5:a5 tanswer:tanswer tdesc:tdesc];
            
            [ret_array addObject:shiti];
            [shiti release];
        }
        return [ret_array autorelease];
        
    }else {
        [ret_array release];
        ret_array = nil;
        return nil;
    }

//    FMResultSet *_rs = [db executeQuery:@"select * from tb_shiti order by random(id)"];
//    NSMutableArray *ret_array =  [[NSMutableArray alloc] init];
//    
//    if (_rs) {
//        while ([_rs next]) {
//            int mid = [_rs intForColumn:@"id"];
//            [ret_array addObject:[NSNumber numberWithInt:mid]];
//        }
//        return [ret_array autorelease];
//        
//    }else {
//        [ret_array release];
//        ret_array = nil;
//        return nil;
//    }
}


#pragma mark - 收藏 methods Implemtions
- (void)shoucang_add:(int)tNumber andTid:(int)tid andTName:(NSString *)tName{
    NSLog(@"INFO 收藏 %d:%@",tNumber,tName);
    [db executeUpdate:@"INSERT INTO tb_shoucang(tid,tnum,tname) VALUES (?,?,?)", tid,tNumber,tName];
}

/**
 * 查处所有收藏
 */
- (NSMutableArray *)shoucang_find_all{
    FMResultSet *_rs = [db executeQuery:@"select distinct tnum,tname,date(create_time) as ct from tb_shoucang"];
    NSMutableArray *ret_array =  [[NSMutableArray alloc] init];
    
    if (_rs) {
        while ([_rs next]) {
            NSLog(@"--%@",[_rs stringForColumn:@"tName"]  );
            int tnumber = [_rs intForColumn:@"tnum"];
            NSString *tname = [_rs stringForColumn:@"tname"];
            NSString *ct = [_rs stringForColumn:@"ct"];
    
            DM_Shoucang *shoucang = [[DM_Shoucang alloc] initWithId:tnumber tname:tname ct:ct];
            [ret_array addObject:shoucang];
            [shoucang release];
        }
        return [ret_array autorelease];
        
    }else {
        [ret_array release];
        ret_array = nil;
        return nil;
    }

}

@end
