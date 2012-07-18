//
//  FirstViewController.m
//  f1
//
//  Created by alfred sang on 12-7-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    l = [[UILabel alloc] init];
    l.frame = CGRectMake(0, 0, 200, 30);
    l.text = @"hellowold-手动添加的";
    
    [self.view addSubview:l];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dealloc{
    [l release];
    [super dealloc];
}

-(IBAction)hello:(id)sender{
    UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"信息提示" message:@"ios简单吗？" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    
    [a show];

}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {

        l.textColor = [UIColor redColor];
        l.text = [NSString stringWithFormat:@"cancel pressed %@",@"sss"];
    }else if(buttonIndex==1){
        l.textColor = [UIColor greenColor];
        l.text = [NSString stringWithFormat:@"ok pressed %@",@"sss"];
    }

}
@end
