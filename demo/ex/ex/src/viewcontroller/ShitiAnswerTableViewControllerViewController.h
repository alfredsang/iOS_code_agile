//
//  ShitiAnswerTableViewControllerViewController.h
//  ex
//
//  Created by alfred sang on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DM_Shiti.h"

@interface ShitiAnswerTableViewControllerViewController : UITableViewController{
    DM_Shiti *_shiti;
    NSMutableArray *items;
}

- (id)initView:(DM_Shiti *)shiti;

@end
