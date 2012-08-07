//
//  ShitiViewController.h
//  ex
//
//  Created by alfred sang on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SummaryViewController.h"
#import "DM_Shiti.h"

 

@interface ShitiViewController : UIViewController{
    int _currentTid;
    DM_Shiti *_shiti;
    MyPatternModel _myPattern;
}


@property(nonatomic,assign,readwrite) IBOutlet UILabel *ui_tid;
@property(nonatomic,retain,readwrite) IBOutlet UILabel *ui_tName;
@property(nonatomic,retain,readwrite) IBOutlet UIImageView *ui_tPicAddr;
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_a1;
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_a2;
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_a3;
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_a4;
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_a5;
@property(nonatomic,assign,readwrite) IBOutlet UILabel *ui_tanswer;
@property(nonatomic,retain,readwrite) IBOutlet UILabel *ui_tdesc;
@property(nonatomic,retain,readwrite) IBOutlet UILabel *ui_tzid;
@property(nonatomic,retain,readwrite) IBOutlet UILabel *ui_ttid;


- (id)initWithPattern:(MyPatternModel)myPattern;

- (void)handleSwipeFromLeft:(UISwipeGestureRecognizer *)recognize;

-(void)jumpTo:(NSNumber *)tPageNumber;

-(IBAction)left:(id)sender;
-(IBAction)right:(id)sender;

-(IBAction)whenClickAnswerBtn:(UIButton *)sender;
/**
 * 查看答案
 */
-(IBAction)viewAnswerBtn:(UIButton *)sender;
 

@end
