//
//  ScanningCell.h
//  CaiXin
//
//  Created by Rainbow Zhang on 11/4/11.
//  Copyright (c) 2011 iTotemStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DM_Scanning.h"


#define ANIMATION_DURATION  0.3
 

@interface ScanningCell : UITableViewCell
{
    DM_Scanning *scanning;
}

@property (retain, nonatomic) DM_Scanning *scanning;
@property (retain, nonatomic) IBOutlet UILabel *urlLabel;
@property (retain, nonatomic) IBOutlet UILabel *timeLabel;
@property (retain, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (retain, nonatomic) IBOutlet UIImageView *accessoryTypeImageView;

- (void)scanningNewsEnterEditMode;
- (void)scanningNewsExitEditMode;
- (void)setScanningListForCell:(DM_Scanning *)aScanning;


@end
