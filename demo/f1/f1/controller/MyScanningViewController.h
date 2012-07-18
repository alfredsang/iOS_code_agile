//
//  MyScanningViewController.h
//  CaiXin
//
//  Created by iPhuan on 11-11-21.
//  Copyright (c) 2011年 iTotemStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITTDataRequest.h"
#import "DM_Scanning.h"


@interface MyScanningViewController : UIViewController <UITableViewDelegate>
{
    NSIndexPath *saveIndexPath;
    NSMutableArray *scanningArray;
}

@property (nonatomic, retain) NSIndexPath *saveIndexPath;
@property (nonatomic, retain) NSMutableArray *scanningArray;
@property (nonatomic, retain) IBOutlet UIButton *editButton;
@property (nonatomic, retain) IBOutlet UILabel *noScanningLabel;
@property (nonatomic, retain) IBOutlet UITableView *collectionTableView;

- (IBAction)back:(id)sender;
- (IBAction)backToRootView:(id)sender;
- (IBAction)edit:(id)sender;

@end
