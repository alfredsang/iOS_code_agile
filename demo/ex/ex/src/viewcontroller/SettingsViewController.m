//
//  SettingsViewController.m
//  ex
//
//  Created by alfred sang on 12-8-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize segmentButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        if (![[NSUserDefaults standardUserDefaults] integerForKey:USER_DEFAULT_ANSWER_MULTI_SHOW]) {
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:USER_DEFAULT_ANSWER_MULTI_SHOW];
        } 
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    NSLog(@"%d",[[NSUserDefaults standardUserDefaults] integerForKey:USER_DEFAULT_ANSWER_MULTI_SHOW]);
    [segmentButton setSelectedSegmentIndex:[[NSUserDefaults standardUserDefaults] integerForKey:USER_DEFAULT_ANSWER_MULTI_SHOW]];
   
    
//    if ([[NSUserDefaults standardUserDefaults] integerForKey:USER_DEFAULT_ANSWER_MULTI_SHOW] == 0){
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - 
/**
 * 答案选项是否支持多次显示
 */
-(IBAction)answerWithMultiShow:(id)sender{
    
    UISegmentedControl *switchButton = (UISegmentedControl*)sender;  
    NSLog(@"switchButton.selectedSegmentIndex=%d",switchButton.selectedSegmentIndex);
    if (switchButton.selectedSegmentIndex == 1) {
         [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:USER_DEFAULT_ANSWER_MULTI_SHOW];
        
        NSLog(@"11111111");
    }else {
         [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:USER_DEFAULT_ANSWER_MULTI_SHOW];
        NSLog(@"000000");
    }

}


/**
 * 动画方式设置
 */
-(IBAction)animationTagSetting:(UIButton *)sender{
    
    NSLog(@"sender.btn.tag= %d",sender.tag);
    [[NSUserDefaults standardUserDefaults] setInteger:sender.tag forKey:USER_DEFAULT_FLIP_ANIMATION_TAG];

}


-(IBAction)dismiss:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

@end
