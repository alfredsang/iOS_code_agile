//
//  ShitiViewController.m
//  ex
//
//  Created by alfred sang on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ShitiViewController.h"

@interface ShitiViewController ()

@end

@implementation ShitiViewController

@synthesize ui_tid;
@synthesize ui_tName;
@synthesize ui_tPicAddr;
@synthesize ui_a1;
@synthesize ui_a2;
@synthesize ui_a3;
@synthesize ui_a4;
@synthesize ui_a5;
@synthesize ui_tanswer;
@synthesize ui_tdesc;
@synthesize ui_chapter;


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
}

- (void)viewDidLoad
{
    _currentTid = 1;
    [self getShiti];
    
    //    [CXDataService sharedInstance]
    
 
    UISwipeGestureRecognizer *recognizer;    
    recognizer = [[UISwipeGestureRecognizer alloc] init];    
    [recognizer addTarget:self action:@selector(handleSwipeFromLeft:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [[self view] addGestureRecognizer:recognizer];    
    [recognizer release];
    
 
    recognizer = [[UISwipeGestureRecognizer alloc] init];    
    [recognizer addTarget:self action:@selector(handleSwipeFromRight:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:recognizer];    
    [recognizer release];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)handleSwipeFromRight:(UISwipeGestureRecognizer *)recognize{
    if (_currentTid > 0) {
        _currentTid--;
        
        [self getShiti];
    }
}
//
- (void)handleSwipeFromLeft:(UISwipeGestureRecognizer *)recognize{

    _currentTid++;
    
    [self getShiti];
}


- (void)getShiti{
    _shiti = [[CXDataService sharedInstance]  shiti_find_by_id:_currentTid];
    [self setShiti:_shiti];
    NSLog(@"%@",_shiti.tName);
}

- (void)setShiti:(DM_Shiti *)shiti{
    [self.ui_a1 setTitle:shiti.a1 forState:UIControlStateNormal];
    [self.ui_a2 setTitle:shiti.a2 forState:UIControlStateNormal];
    [self.ui_a3 setTitle:shiti.a3 forState:UIControlStateNormal];
    [self.ui_a4 setTitle:shiti.a4 forState:UIControlStateNormal];
    [self.ui_a5 setTitle:shiti.a5 forState:UIControlStateNormal];
    self.ui_chapter.text = shiti.chapter;
    self.ui_tName.text = shiti.tName;
    self.ui_tdesc.text = shiti.tdesc;
    self.ui_tid.text = [NSString stringWithFormat:@"%d",_currentTid];

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

@end
