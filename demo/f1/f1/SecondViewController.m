//
//  SecondViewController.m
//  f1
//
//  Created by alfred sang on 12-7-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "JSONKit.h"
#import "ASIHTTPRequest.h"
#import "SecondViewController.h"
#import "MyScanningViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
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

- (IBAction)showScanningTable:(id)sender{
    
    
    MyScanningViewController *setView = 
    [[MyScanningViewController alloc] init];
  
 
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setView];  
    navController.title = @"全部";
    navController.navigationBarHidden = YES;
 
    [self presentModalViewController:navController animated:YES];

}



- (IBAction)addScanningTable:(id)sender{
    
//    int ran_num=rand(); 
//    DM_Scanning *aa=[[DM_Scanning alloc] init:[NSString stringWithFormat:@"url=%d",ran_num] withTitle:[NSString stringWithFormat:@"url=%d",ran_num] withDate:@"sdf"];
//    
//    
////    [DB_SERVICE scanning_add:aa];
//    
//    [aa release];
    
    [self getScanInfoList];

}

- (void)getScanInfoList{
    NSString *url = [NSString stringWithFormat:@"%@%@", @"http://10.10.5.214:3000", @"/api/api_scan.json"];
    
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:url]];
        
    //[request setRequestMethod:@"GET"];
    //[request setDelegate:self];
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    
    [request setCompletionBlock:^(void) {
        int _statusCode = [request responseStatusCode];
        if (_statusCode != 200) {

            return;
        }
        NSData *responseData = [request responseData];

        NSDictionary *a = [[responseData objectFromJSONData] retain];
 
        NSArray *resultsDictionary  = [a objectForKey:@"b"];
     
        NSLog(@"%@",[resultsDictionary objectAtIndex:0]);
        
        @autoreleasepool {
            for (NSDictionary *movie in resultsDictionary)
            {
                NSString  *scanDate = [movie objectForKey:@"scanDate"];
                NSString  *scanTitle = [movie objectForKey:@"scanTitle"];
                NSString  *scanUrl = [movie objectForKey:@"scanUrl"];
                NSLog(@"scanTitle = %@",scanTitle);
                
                DM_Scanning *aa=[[DM_Scanning alloc] init:scanUrl  withTitle:scanTitle withDate:scanDate];
                [DB_SERVICE scanning_add:aa];
                [aa release];
            }
        }//end @autoreleasepool
        
    }];
    
    [request setFailedBlock:^(void) {
        NSError *error = [request error];
        //desc
        //statusCode
        if (error) {
                 
        }
    }];
    
    
    [request start];
    
}
@end
