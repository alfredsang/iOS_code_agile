//
//  RootViewController.m
//  ex
//
//  Created by alfred sang on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, 320, 480);
    
//    UIButton *kBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    kBtn.frame = CGRectMake(20, 100, 180, 44);
//    [kBtn setTitle:@"kangjia test" forState:UIControlStateNormal];
//    [kBtn addTarget:self action:@selector(kjClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:kBtn];
    
//    ShitiAnswerTableViewControllerViewController *s = [[ShitiAnswerTableViewControllerViewController alloc] initView:nil];
//    [self.view addSubview:s.view];
    // Do any additional setup after loading the view from its nib.
}

-(void)kjClick:(UIButton *)btn{
    NSLog(@"-----------");
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

-(IBAction)showShitiView:(id)sender{
    ShitiViewController *svc = [[ShitiViewController alloc] initWithPattern:1];
    svc.view.frame = CGRectMake(0, 0, 320, 480);
    [self.view addSubview:svc.view];
}


-(IBAction)a{


}

-(IBAction)testNow:(id)sender{
    ShitiViewController *setView = [[ShitiViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setView];  
    navController.title = @"要闻";
 
    navController.navigationBarHidden = YES;
 
    [self presentModalViewController:navController animated:YES];
    [navController release];
}


#pragma mark - btn
-(IBAction)showShitiView_seq:(id)sender{
    ShitiViewController *setView = [[ShitiViewController alloc] initWithPattern:PatternModel_Seq];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setView];
    navController.navigationBarHidden = YES;
    [self presentModalViewController:navController animated:YES];
    [navController release];
}

-(IBAction)showShitiView_random:(id)sender;{
    ShitiViewController *setView = [[ShitiViewController alloc] initWithPattern:PatternModel_Random];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setView];
    navController.navigationBarHidden = YES;
         [self presentModalViewController:navController animated:YES];
    [navController release];
}

-(IBAction)showShitiView_chapter:(id)sender{
    ShitiViewController *setView = [[ShitiViewController alloc] initWithPattern:PatternModel_Chapter];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setView];
    navController.navigationBarHidden = YES;
    [self presentModalViewController:navController animated:YES];
    [navController release];
}

-(IBAction)showShitiView_exam:(id)sender{
    ExamViewController *setView = [[ExamViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setView];
    navController.navigationBarHidden = YES;
    [self presentModalViewController:navController animated:YES];
    [navController release];
}

-(IBAction)showSettingsView:(id)sender{
    SettingsViewController *setView = [[SettingsViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setView];
    navController.navigationBarHidden = YES;
    [self presentModalViewController:navController animated:YES];
    [navController release];
}


@end
