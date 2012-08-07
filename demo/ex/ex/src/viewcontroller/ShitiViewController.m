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
@synthesize ui_ttid;
@synthesize ui_tzid;


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
}

- (void)viewDidLoad
{
    _currentTid = 237;
    [self getShiti];
    
    //    [CXDataService sharedInstance]
    [self addGestureRecognizer];
 
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)addGestureRecognizer{
    
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
    _shiti = [[[CXDataService sharedInstance]  shiti_find_by_id:_currentTid] retain];
    [self setShiti:_shiti];   
    NSLog(@"%@",_shiti.tName);
    NSLog(@"%@",_shiti.tanswer);
}
#define TI_Y      50
#define TI_HEIGHT 106
- (void)setShiti:(DM_Shiti *)shiti{
    if (_currentTid == 0) {
        SummaryViewController *s = [SummaryViewController new];
        [self.view addSubview:s.view];        
        //[s release];
        return;
    }
    [self resetAllAnswerBtn];
    [self hideOrShow:shiti.a1 withBtn:self.ui_a1];
    [self hideOrShow:shiti.a2 withBtn:self.ui_a2];
    [self hideOrShow:shiti.a3 withBtn:self.ui_a3];
    [self hideOrShow:shiti.a4 withBtn:self.ui_a4];
    [self hideOrShow:shiti.a5 withBtn:self.ui_a5];
     
//
//    self.ui_chapter.text = shiti.chapter;
    self.ui_tName.text = shiti.tName;
    self.ui_tdesc.text = shiti.tdesc;
    self.ui_ttid.text = shiti.tid;
    self.ui_tid.text = [NSString stringWithFormat:@"%d",_currentTid];
    
//    [self.ui_tName ]
    if (shiti.tPicAddress == nil || [shiti.tPicAddress  isEqualToString:@"" ]) {
        self.ui_tPicAddr.hidden = YES;
        self.ui_tName.frame = CGRectMake(10, TI_Y, 300,TI_HEIGHT); 
    }else {
        self.ui_tName.frame = CGRectMake(10, TI_Y, 200, TI_HEIGHT); 
        self.ui_tPicAddr.hidden = NO;
        [self.ui_tPicAddr setImage:[UIImage imageNamed:shiti.tPicAddress]];
    }
    

}

- (void)resetAllAnswerBtn{
    [self resetWithBtn:self.ui_a1];
    [self resetWithBtn:self.ui_a2];
    [self resetWithBtn:self.ui_a3];
    [self resetWithBtn:self.ui_a4];
    [self resetWithBtn:self.ui_a5];
}
- (void)resetWithBtn:(UIButton *)sender{
    [sender setBackgroundColor:[UIColor whiteColor]];
    [sender setEnabled:YES];
    [sender setOpaque:YES];
    [sender setAlpha:1.0f];
    [sender setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [sender.titleLabel setFont:[UIFont systemFontOfSize:15]];
}

- (void)hideOrShow:(NSString *)str withBtn:(UIButton *)btn{
    if (str == nil || [str isEqualToString:@""]) {
        btn.hidden = YES;
        return;
    }
    btn.hidden = NO;
    NSString *title;
    
    switch (btn.tag) {
        case 1:
            title = [NSString stringWithFormat:@"  A:%@",str];
            break;

        case 2:
            title = [NSString stringWithFormat:@"  B:%@",str];
            break;

        case 3:
            title = [NSString stringWithFormat:@"  C:%@",str];
            break;

        case 4:
            title = [NSString stringWithFormat:@"  D:%@",str];
            break;

        case 5:
            title = [NSString stringWithFormat:@"  E:%@",str];
            break;

        default:
            break;
    }
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateSelected];
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

-(IBAction)left:(id)sender{
    if (_currentTid > 0) {
        _currentTid--;
        
        [self getShiti];
    }
}

-(IBAction)right:(id)sender{
    _currentTid++;
    
    [self getShiti];

}


-(IBAction)back:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)whenClickAnswerBtn:(UIButton *)sender{
    int mid = [_shiti.tanswer intValue];
    
    for (int i=1; i<=5; i++) {
         if (sender.tag == mid) {
            [sender setBackgroundColor:[UIColor greenColor]];
            sender.titleLabel.font = [UIFont systemFontOfSize:20];
            sender.titleLabel.textColor = [UIColor blueColor];
            [sender setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        }else {
            [sender setBackgroundColor:[UIColor grayColor]];
            [sender setEnabled:NO];
            [sender setOpaque:YES];
            [sender setAlpha:0.5f];
        }
    }
}

-(IBAction)viewAnswerBtn:(UIButton *)btn{
    
    int mid = [_shiti.tanswer intValue];

    for (int i=1; i<=5; i++) {
        UIButton * sender = [self.view viewWithTag:i];
        if (sender.tag == mid) {
            [sender setBackgroundColor:[UIColor greenColor]];
            sender.titleLabel.font = [UIFont systemFontOfSize:20];
            sender.titleLabel.textColor = [UIColor blueColor];
            [sender setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        }else {
            [sender setBackgroundColor:[UIColor grayColor]];
            [sender setEnabled:NO];
            [sender setOpaque:YES];
            [sender setAlpha:0.5f];
        }
    }
    
}

#pragma mark - public methods implemetions

-(void)jumpTo:(NSNumber *)tPageNumber{
    [self addGestureRecognizer];
    _currentTid = [tPageNumber intValue];
    [self getShiti];
}

@end
