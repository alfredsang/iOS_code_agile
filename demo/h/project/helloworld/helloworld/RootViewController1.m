//
//  RootViewController1.m
//  helloworld
//
//  Created by minglq on 12-8-6.
//  Copyright (c) 2012年 no320. All rights reserved.
//

#import "RootViewController1.h"

@interface RootViewController1 ()

@end

@implementation RootViewController1

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
	// Do any additional setup after loading the view.
    UILabel *ui_label_helloworl = [[UILabel alloc] initWithFrame:CGRectMake(67, 75, 82, 21)];
    ui_label_helloworl.text = @"hello world";
    [self.view addSubview:ui_label_helloworl];
    [ui_label_helloworl release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
