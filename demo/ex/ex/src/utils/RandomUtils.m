//
//  RandomUtils.m
//  ex
//
//  Created by alfred sang on 12-8-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RandomUtils.h"

@implementation RandomUtils


-(int)getRandomNumber:(int)from to:(int)to count:(int)count{

}


-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to-from + 1)));
}


@end
