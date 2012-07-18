//
//  WebViewController.m
//  helloworld
//
//  Created by alfred sang on 12-7-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

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
    CGRect ss =[[UIScreen mainScreen]  bounds];
    webview = [[UIWebView alloc] initWithFrame:ss];
    
    //1
    //[webview loadHTMLString:@"hello world" baseURL:nil];
    //2
    //[webview stringByEvaluatingJavaScriptFromString:@"document.write('hello js world')"];
    //2
    NSString *path = [[NSBundle mainBundle] pathForResource:@"hello" ofType:@"html"];
    NSURL *url = [NSURL URLWithString:path];
    [webview loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self.view addSubview:webview];
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
