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
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/QuartzCore.h>
#import "ShitiAnswerTableViewControllerViewController.h"
#import "SettingsViewController.h"
#import "NoteInfoView.h"
#import "BottomBarView.h"


@interface ShitiViewController : UIViewController <NoteInfoViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    /**
     * 当前id
     */
    int _currentTid;
    DM_Shiti *_shiti;
    MyPatternModel _myPattern;
    /**
     * 当前数据源的id
     */
    int _dsId;
    
    NSMutableArray *_dsKeyArray;
    
    NoteInfoView* hintView;
    
    UITableView *_tableView;
    NSMutableArray *items;
    BOOL _isAnswered;
    
    BottomBarView *_bottomBarView;
    
    int c;
}

@property(nonatomic,retain,readwrite) IBOutlet UIImageView *ui_bgPic;
/** 
 * 题号
 */
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_btn_tNumber;
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

@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_left;
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_right;

@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_config;

@property(nonatomic,assign,readwrite)  int typeID;


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
 

-(IBAction)showSettingsView:(id)sender;

@end
