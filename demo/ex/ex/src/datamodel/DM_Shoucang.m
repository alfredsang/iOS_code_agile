//
//  DM_Shoucang.m
//  ex
//
//  Created by minglq on 12-8-24.
//
//

#import "DM_Shoucang.h"

@implementation DM_Shoucang
@synthesize tname;
@synthesize tnumber;
@synthesize ct;
@synthesize tId;


- (id)initWithId:(int)ptnumber
             tid:(int)ptid
             tname:(NSString *)ptname
         ct:(NSString *)pct
{
    if (self = [super init]) {
        self.tId = ptid;
        self.tnumber = ptnumber;
        self.tname = ptname;
        self.ct = pct;

    }
    return self;
}


-(void)dealloc{
    [super dealloc];
}


@end
