//
//  SettingsViewController.h
//  ex
//
//  Created by alfred sang on 12-8-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController


@property(nonatomic,retain,readwrite) IBOutlet UISegmentedControl *segmentButton;

/**
 * 答案选项是否支持多次显示
 */
-(IBAction)answerWithMultiShow:(id)sender;


/**
 * 动画方式设置
 */
-(IBAction)animationTagSetting:(id)sender;


-(IBAction)dismiss:(id)sender;
@end
