//
//  RootViewControllerViewController.m
//  helloworld
//
//  Created by alfred sang on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewControllerViewController.h"

@interface RootViewControllerViewController ()

@end

@implementation RootViewControllerViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    infoLabel = [UILabel new];
    infoLabel.frame = CGRectMake(0, 20, 300, 30);
    infoLabel.text = @"hello world!";
    
    [self.view addSubview:infoLabel];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
