//
//  SummaryViewController.m
//  ex
//
//  Created by alfred sang on 12-8-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SummaryViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController
@synthesize delegate;

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
    UISwipeGestureRecognizer *recognizer;    
    recognizer = [[UISwipeGestureRecognizer alloc] init];    
    [recognizer addTarget:self action:@selector(handleSwipeFromLeft:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [[self view] addGestureRecognizer:recognizer];    
    [recognizer release];
    
 
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

#pragma mark - shiti

- (void)handleSwipeFromLeft:(UISwipeGestureRecognizer *)recognizer{
    [self viewShiti:nil];
    // 底下是刪除手势的方法
    [self.view removeGestureRecognizer:recognizer];
}


-(IBAction)viewShiti:(id)sender{
    [self.view removeFromSuperview];
    if ([delegate respondsToSelector:@selector(jumpTo:)]) {
        [delegate performSelector:@selector(jumpTo:) withObject:[NSNumber numberWithInt:1]];
    }
}

@end
