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

@synthesize typeID;

- (id)initWithPattern:(MyPatternModel)myPattern{
    if (self == [super init]) {
        _myPattern = myPattern;
        [self processWithPattern];
    }
    return self;
}

- (void)processWithPattern{
    switch (_myPattern) {
        case PatternModel_Seq:
            [self p_seq];
            break;
        case PatternModel_Random:
            [self p_random];
            break;
        case PatternModel_Chapter:
            [self p_chater];
            break;
        case PatternModel_Exam:
            [self p_exam];
            break;
        default:
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
}

- (void)viewDidLoad
{
    _currentTid = 1;
    [self getShiti];
    
    _dsKeyArray = [NSMutableArray array];
    //    [CXDataService sharedInstance]
    [self addGestureRecognizer];
 
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - swipe事件
/**
 * 增加左右swipe事件
 */
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
/**
 * 增加左swipe事件
 */
- (void)handleSwipeFromRight:(UISwipeGestureRecognizer *)recognize{
    if (_currentTid > 0) {
        _currentTid--;
         [self kDurationAnimation:1 direction:0];
        [self getShiti];
    }
}
/**
 * 增加右swipe事件
 */
- (void)handleSwipeFromLeft:(UISwipeGestureRecognizer *)recognize{

    _currentTid++;
    
    [self getShiti];
     [self kDurationAnimation:1 direction:1];
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
    NSString *tip = [NSString stringWithFormat:@"Tip:%@",_shiti.tdesc];
    [SVProgressHUD showInView:self.view];
//    [SVProgressHUD ]
    [SVProgressHUD dismissWithSuccess:tip afterDelay:2.5];
    
}

#pragma mark - public methods implemetions

-(void)jumpTo:(NSNumber *)tPageNumber{
    [self addGestureRecognizer];
    _currentTid = [tPageNumber intValue];
    [self getShiti];
}

#pragma mark Core Animation
- (void)kDurationAnimation:(int)mytag direction:(int)dtag{
    return;
    NSInteger tag = mytag;
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    
    switch (tag) {
        case 101:
            animation.type = kCATransitionFade;
            break;
        case 102:
            animation.type = kCATransitionPush;
            break;
        case 103:
            animation.type = kCATransitionReveal;
            break;
        case 104:
            animation.type = kCATransitionMoveIn;
            break;
        case 201:
            animation.type = @"cube";
            break;
        case 202:
            animation.type = @"suckEffect";
            break;
        case 203:
            animation.type = @"oglFlip";
            break;
        case 204:
            animation.type = @"rippleEffect";
            break;
        case 205:
            animation.type = @"pageCurl";
            break;
        case 206:
            animation.type = @"pageUnCurl";
            break;
        case 207:
            animation.type = @"cameraIrisHollowOpen";
            break;
        case 208:
            animation.type = @"cameraIrisHollowClose";
            break;
        default:
            break;
    }
    
    switch (dtag) {
        case 0:
            animation.subtype = kCATransitionFromLeft;
            break;
        case 1:
            animation.subtype = kCATransitionFromRight;
            break;
 
        default:
            break;
    }
 
    [[self.view layer] addAnimation:animation forKey:@"animation"];
}

#pragma mark UIView动画
- (IBAction)buttonPressed2:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSInteger tag = button.tag;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:kDuration];
    switch (tag) {
        case 105:
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
            break;
        case 106:
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
            break;
        case 107:
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
            break;
        case 108:
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
            break;
        default:
            break;
    }
    
//    NSUInteger green = [[self.view subviews] indexOfObject:self.greenView];
//    NSUInteger blue = [[self.view subviews] indexOfObject:self.blueView];
//    [self.view exchangeSubviewAtIndex:green withSubviewAtIndex:blue];
//    
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用某个方法
    //[UIView setAnimationDidStopSelector:@selector(animationFinished:)];
    [UIView commitAnimations];
}


#pragma mark - pattern callback methods implemetions

- (void)p_seq{
    _currentTid = 1;
    //_dsId = _currentTid;
}

- (void)p_random{
    _dsKeyArray = [[RandomUtils getRandomCollection:0 to:1000 count:100] retain];
    NSLog(@"when in p_random functoin,_dsKeyArray = %@C",_dsKeyArray);
    //_dsId = [[_dsKeyArray objectAtIndex:_currentTid] intValue];
}

- (void)p_chater{
    
}

- (void)p_exam{
    
}

#pragma mark - shiti methods implemetions

- (void)getShiti{
    switch (_myPattern) {
        case PatternModel_Seq:
            _dsId = _currentTid;
            break;
        case PatternModel_Random:
            _dsKeyArray = [[RandomUtils getRandomCollection:0 to:1000 count:100] retain];
            _dsId = [[_dsKeyArray objectAtIndex:_currentTid] intValue];
            break;
        default:
            break;
    }
    _shiti = [[[CXDataService sharedInstance]  shiti_find_by_id:_dsId] retain];
    
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
@end
