//
//  RootViewController.h
//  ex
//
//  Created by alfred sang on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShitiViewController.h"
#import "ExamViewController.h"

@interface RootViewController : UIViewController


-(IBAction)showShitiView:(id)sender;


-(IBAction)a;

-(IBAction)testNow:(id)sender;


#pragma mark - btn
-(IBAction)showShitiView_seq:(id)sender;
-(IBAction)showShitiView_random:(id)sender;
-(IBAction)showShitiView_chapter:(id)sender;
-(IBAction)showShitiView_exam:(id)sender;


@end
