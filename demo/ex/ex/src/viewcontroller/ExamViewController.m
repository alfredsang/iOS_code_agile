//
//  ExamViewController.m
//  ex
//
//  Created by alfred sang on 12-8-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ExamViewController.h"

@interface ExamViewController ()

@end

@implementation ExamViewController
@synthesize ui_ttime;
@synthesize ui_btn_tNumber;
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
@synthesize ui_jindu;

@synthesize typeID;

- (id)init{
    if (self == [super init]) {
        _myPattern = PatternModel_Exam;
    }
    return self;
}

-(void)dealloc{
    [ui_btn_tNumber release];
    [ui_tName release];
    [ui_tPicAddr release];
    [ui_a1 release];
    [ui_a2 release];
    [ui_a3 release];
    [ui_a4 release];
    [ui_a5 release];
    [ui_tanswer release];
    [ui_tdesc release];
    [ui_ttid release];
    [ui_tzid release];
    
    [hintView release];
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 150, 300, 245) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_tableView];
    [_tableView setScrollEnabled:NO];
    
    items = [[NSMutableArray alloc] init];
    
    
    
    
    
     [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    
    
    ui_btn_tNumber.backgroundColor = [UIColor orangeColor];
    
    
    hintView = [[CompletenessView  alloc] initWithFrame:CGRectMake(0, -120, 320, 120)];
    [self.view addSubview:hintView];
    
    _currentTid = 1;
    [self getShiti];
    
    _dsKeyArray = [NSMutableArray array];
    //    [CXDataService sharedInstance]
    [self addGestureRecognizer];
    
    [self tNumberAnimation:1 andNumber:_currentTid];
    
}


- (NSString *)getStringWithABCD:(NSString *)str withIndex:(int)i{
    NSString *title;
    
    switch (i) {
        case 1:
            title = [NSString stringWithFormat:@"  A : %@",str];
            break;
            
        case 2:
            title = [NSString stringWithFormat:@"  B : %@",str];
            break;
            
        case 3:
            title = [NSString stringWithFormat:@"  C : %@",str];
            break;
            
        case 4:
            title = [NSString stringWithFormat:@"  D : %@",str];
            break;
            
        case 5:
            title = [NSString stringWithFormat:@"  E : %@",str];
            break;
            
        default:
            break;
    }
    return title;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (int i = 0; i<[items count]; i++) {
        NSIndexPath *myIndexP = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:myIndexP];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
//    int mid = [_shiti.tanswer intValue] ;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    if (mid == (indexPath.row+1) ) {
//        
//        //        [cell setBackgroundColor:[UIColor greenColor]];
//        [cell.imageView setImage:[UIImage imageNamed:@"icon_selected"]];
//        [cell setHighlighted:YES animated:YES];
//    }else {
//        //        [cell setBackgroundColor:[UIColor grayColor]];
//        [cell.imageView setImage:[UIImage imageNamed:@"photo_icon_cancle"]];
//    }
//    
    //直接跳转到下一题
     [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(right) object:nil];
    [self performSelector:@selector(right:) withObject:nil afterDelay:2];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}


#pragma mark - Table view data source


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
    return @"答案";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    static NSString *CellIdentifier = @"BirdSightingCell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //    cell.frame = CGRectMake(0, 0, 320, 40);
    //    // Configure the cell...
    //    
    //    UIView *a = [UIView new];
    //    a.frame = CGRectMake(0, 0, 320, 40);
    //    [cell addSubview:a];
    ////    [[cell textLabel] setText:@"sss"];
    //    
    //    return cell;
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    //    [cell.accessoryView addSubview:[]]
    
    [cell.textLabel setFont:[UIFont systemFontOfSize:12]];
    cell.textLabel.textColor  = [UIColor orangeColor];
    cell.textLabel.numberOfLines = 3;
    
    [cell.imageView setImage:nil];
    NSLog(@"row = %d",indexPath.row);
    
    if (items) {
        cell.textLabel.text = [items  objectAtIndex:indexPath.row];
        [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
    
}


#pragma mark - swipe事件
/**
 * 增加左右swipe事件
 */
- (void)addGestureRecognizer{
    UISwipeGestureRecognizer *recognizer;    
//    recognizer = [[UISwipeGestureRecognizer alloc] init];    
//    [recognizer addTarget:self action:@selector(handleSwipeFromLeft:)];
//    [recognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
//    [[self view] addGestureRecognizer:recognizer];    
//    [recognizer release];
//    
//    recognizer = [[UISwipeGestureRecognizer alloc] init];    
//    [recognizer addTarget:self action:@selector(handleSwipeFromRight:)];
//    [recognizer setDirection:UISwipeGestureRecognizerDirectionRight];
//    [[self view] addGestureRecognizer:recognizer];    
//    [recognizer release];
    
    recognizer = [[UISwipeGestureRecognizer alloc] init];    
    [recognizer addTarget:self action:@selector(handleSwipeFromUp:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionUp];
    [[self view] addGestureRecognizer:recognizer];    
    [recognizer release];
    
    recognizer = [[UISwipeGestureRecognizer alloc] init];    
    [recognizer addTarget:self action:@selector(handleSwipeFromDown:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionDown];
    [[self view] addGestureRecognizer:recognizer];    
    [recognizer release];
    
}

/**
 * 增加上swipe事件
 */
- (void)handleSwipeFromUp:(UISwipeGestureRecognizer *)recognize{
    [self dismissNoteView];
}
/**
 * 增加下swipe事件
 */
- (void)handleSwipeFromDown:(UISwipeGestureRecognizer *)recognize{
    [self showNoteView];
}
/**
 * 增加左swipe事件
 */
- (void)handleSwipeFromRight:(UISwipeGestureRecognizer *)recognize{
    [self left:nil];
}
/**
 * 增加右swipe事件
 */
- (void)handleSwipeFromLeft:(UISwipeGestureRecognizer *)recognize{
    [self right:nil];
}

-(IBAction)left:(id)sender{
    if (_currentTid > 0) {
        _currentTid--;
        
        [self getShiti];
    }
    
    [self tNumberAnimation:1 andNumber:_currentTid];
}

-(IBAction)right:(id)sender{
    _currentTid++;
    
    [self getShiti];
    
    [self tNumberAnimation:0 andNumber:_currentTid];
    
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


-(IBAction)back:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)whenClickAnswerBtn:(UIButton *)sender{
    int mid = [_shiti.tanswer intValue];
    
//    for (int i=1; i<=5; i++) {
//        if (sender.tag == mid) {
//            [sender setBackgroundColor:[UIColor greenColor]];
//            sender.titleLabel.font = [UIFont systemFontOfSize:20];
//            sender.titleLabel.textColor = [UIColor blueColor];
//            [sender setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
//        }else {
//            [sender setBackgroundColor:[UIColor grayColor]];
//            [sender setEnabled:NO];
//            [sender setOpaque:YES];
//            [sender setAlpha:0.5f];
//        }
//    }
    
    //设置选中    
    [sender setBackgroundColor:[UIColor blueColor]];
    [sender setEnabled:NO];
    [sender setOpaque:YES];
    [sender setAlpha:0.5f];
    //存储
    
    //直接跳转到下一题
    [self performSelector:@selector(right:) withObject:nil afterDelay:1];
}

-(IBAction)viewAnswerBtn:(UIButton *)btn{
    int mid = [_shiti.tanswer intValue];
    
    for (int i=1; i<=5; i++) {
        UIButton* sender = (UIButton *)[self.view viewWithTag:i];
        
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
    NSString *tip = [NSString stringWithFormat:@"%@",_shiti.tdesc];
    
    if ( (tip == nil) | [tip isEqualToString:@""]) {
        return;
    }
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(dismissNoteView) object:nil];
    [hintView setNoteInfo:@"真题解读" content:tip iconName:@"weibo_location_selected"];
    
    [self showNoteView];    
}

-(void)tNumberAnimation:(int)dirction andNumber:(int)num{
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"oglFlip";
    
    if (dirction ==1) {
        animation.subtype = kCATransitionFromLeft;
    }else {
        animation.subtype = kCATransitionFromRight;
    }
    
    NSString *string = [NSString stringWithFormat:@"%d",num];
    
	CGFloat stringWidth = [string sizeWithFont:self.ui_btn_tNumber.titleLabel.font].width+14;
	
    
    //	self.ui_btn_tNumber.bounds = CGRectMake(0, 0, hudWidth, 100);
    
    CGRect f = self.ui_btn_tNumber.frame;
    f.size.width = stringWidth;
    f.size.height = stringWidth;
    self.ui_btn_tNumber.frame = f;
    
    
    CALayer * layer = [ui_btn_tNumber layer];  
    
    [layer setMasksToBounds:YES];  
    [layer setCornerRadius:(stringWidth)/2];  
//    [layer setBorderWidth:1];  
//    [layer setBorderColor: [[UIColor greenColor] CGColor]];  
    
    
    [self.ui_btn_tNumber setTitle:string  forState:UIControlStateNormal];
    
    
    double a = ceil(num % 50) ;
    [[self.ui_btn_tNumber layer] addAnimation:animation forKey:@"animation_btn"];
    
    [UIView animateWithDuration:1 delay:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect f = self.ui_jindu.frame;
        f.origin.x = 94 + a*2;
        self.ui_jindu.frame = f;
        [self.ui_jindu setTitle:[NSString stringWithFormat:@"%d",num] forState:UIControlStateNormal];
    } completion:^(BOOL finished) {
         
    }];
}
#pragma mark - about NoteView 
- (void)showNoteView{
    [UIView animateWithDuration:1 delay:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect f = self.view.frame;
        f.origin.y = 120;
        self.view.frame = f;
    } completion:^(BOOL finished) {
        [self performSelector:@selector(dismissNoteView) withObject:nil afterDelay:10];
    }];
}


- (void)dismissNoteView{
    [UIView animateWithDuration:1 delay:0.2 options:UIViewAnimationOptionAutoreverse animations:^{
        
    } completion:^(BOOL finished) {
        CGRect f = self.view.frame;
        f.origin.y = 0;
        self.view.frame = f;
    }];
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

 
/**
 *随机一百道题 
 *时间45分钟
 *90分+通过
 *一个题目一分
 */
#pragma mark - shiti methods implemetions

- (void)getShiti{
    
    if (_currentTid==100) {
        [SVProgressHUD showInView:self.view];
        [SVProgressHUD dismissWithSuccess:@"所有题目已经答完" afterDelay:2];
        return;
    }
    switch (_myPattern) {
        case PatternModel_Exam:
            _dsKeyArray = [[RandomUtils getRandomCollection:0 to:1000 count:101] retain];
            _dsId = [[_dsKeyArray objectAtIndex:_currentTid] intValue];
            break;
        default:
            break;
    }
    _shiti = [[[CXDataService sharedInstance]  shiti_find_by_id:_dsId] retain];
    
    NSString *tip = [NSString stringWithFormat:@"%@",_shiti.tdesc];
    if ( (tip == nil) | [tip isEqualToString:@""]) {
        
    }else {
        
        [hintView setNoteInfo:@"真题解读" content:tip iconName:@"weibo_location_selected"];
        
        
        
    }
    
    
    
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
    
    //    [self.ui_tName ]
    if (shiti.tPicAddress == nil || [shiti.tPicAddress  isEqualToString:@"" ]) {
        self.ui_tPicAddr.hidden = YES;
        self.ui_tName.frame = CGRectMake(10, TI_Y, 300,TI_HEIGHT); 
    }else {
        self.ui_tName.frame = CGRectMake(10, TI_Y, 200, TI_HEIGHT); 
        self.ui_tPicAddr.hidden = NO;
        [self.ui_tPicAddr setImage:[UIImage imageNamed:shiti.tPicAddress]];
    }
    
    [items release];
    
    items = [[NSMutableArray alloc] init];
    
    
    if (_shiti.a1.length>0) {
        [items addObject:[self getStringWithABCD:_shiti.a1 withIndex:1]];
    }
    
    if (_shiti.a2.length>0) {
        [items addObject:[self getStringWithABCD:_shiti.a2 withIndex:2]];   
    }
    
    if (_shiti.a3.length>0) {
        [items addObject:[self getStringWithABCD:_shiti.a3 withIndex:3]];
    }
    if (_shiti.a4.length>0) {
        [items addObject:[self getStringWithABCD:_shiti.a4 withIndex:4]];
    }
    if (_shiti.a5.length>0) {
        [items addObject:[self getStringWithABCD:_shiti.a5 withIndex:5]];
    }
    
    
    
    [_tableView reloadData];
    
}

#pragma mark - noteinfodelegate

-(void)whenNoteInfoViewDismiss{
    [UIView animateWithDuration:1 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = -120;
        self.view.frame = f;
    }];
}


- (void)timerFireMethod:(NSTimer*)theTimer
{
    //NSDateFormatter *dateformatter = [[[NSDateFormatter alloc]init] autorelease];//定义NSDateFormatter用来显示格式
    //[dateformatter setDateFormat:@"yyyy MM dd hh mm ss"];//设定格式
    NSCalendar *cal = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    NSDateComponents *shibo = [[NSDateComponents alloc] init];//初始化目标时间（好像是世博会的日期）
    [shibo setYear:2010];
    [shibo setMonth:5];
    [shibo setDay:1];
    [shibo setHour:8];
    [shibo setMinute:0];
    [shibo setSecond:0];
    
    NSDate *todate = [cal dateFromComponents:shibo];//把目标时间装载入date
    [shibo release];
    // NSString *ssss = [dateformatter stringFromDate:dd];
    // NSLog([NSString stringWithFormat:@"shibo shi:%@",ssss]);
    
    NSDate *today = [NSDate date];//得到当前时间
    // NSString *sss = [dateformatter stringFromDate:today];
    // NSLog([NSString stringWithFormat:@"xianzai shi:%@",sss]);
    //用来得到具体的时差
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *d = [cal components:unitFlags fromDate:today toDate:todate options:0];
    ui_ttime.text = [NSString stringWithFormat:@"%d年%d月%d日%d时%d分%d秒",[d year],[d month], [d day], [d hour], [d minute], [d second]];
}
@end
