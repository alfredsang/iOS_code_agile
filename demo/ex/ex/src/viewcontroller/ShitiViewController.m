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
@synthesize ui_bgPic;
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

@synthesize typeID;

- (id)initWithPattern:(MyPatternModel)myPattern{
    if (self == [super init]) {
        _myPattern = myPattern;
        [self processWithPattern];
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _isAnswered = FALSE;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 150, 300, 245) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_tableView];
    [_tableView setScrollEnabled:NO];
    
    items = [[NSMutableArray alloc] init];

    
    
    ui_btn_tNumber.backgroundColor = [UIColor orangeColor];
    
    
    hintView = [[NoteInfoView  alloc] initWithFrame:CGRectMake(0, -120, 320, 120)];
    [self.view addSubview:hintView];
    
    _currentTid = 1;
    [self getShiti];
    
    _dsKeyArray = [NSMutableArray array];
    //    [CXDataService sharedInstance]
    [self addGestureRecognizer];
    
    [self tNumberAnimation:1 andNumber:_currentTid];
    
//    ShitiAnswerTableViewControllerViewController *s = [[ShitiAnswerTableViewControllerViewController alloc] initView:nil];
//    s.view.frame = CGRectMake(10, 180, 300, 195);
//    
     
    

//    [self.view addSubview:s.view];
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
  
   
    
    if (!_isAnswered) {
        for (int i = 0; i<[items count]; i++) {
            NSIndexPath *myIndexP = [NSIndexPath indexPathForRow:i inSection:0];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:myIndexP];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        int mid = [_shiti.tanswer intValue] ;
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (mid == (indexPath.row+1) ) {
          
          
    //        [cell setBackgroundColor:[UIColor greenColor]];
            [cell.imageView setImage:[UIImage imageNamed:@"icon_selected"]];
            [cell setHighlighted:YES animated:YES];
        }else {
    //        [cell setBackgroundColor:[UIColor grayColor]];
            [cell.imageView setImage:[UIImage imageNamed:@"photo_icon_cancle"]];
        }
    }
    
    if (isMultiSelect == 0) {
        _isAnswered = YES;
    }
     
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
    _isAnswered = NO;
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
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
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
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
    
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
    
    UITapGestureRecognizer *tg = [[UITapGestureRecognizer alloc] init];
    [tg addTarget:self action:@selector(tap:)];
    tg.numberOfTapsRequired=1;
    tg.numberOfTouchesRequired =1;
    [[self ui_tName] addGestureRecognizer:tg];
    [tg release];
    
}
-(void)tap:(UITapGestureRecognizer *)g{
    c++;
    if (c%2 ==0) {
        [UIView animateWithDuration:1 delay:0.2 options:UIViewAnimationCurveEaseInOut animations:^{
            CGRect f = [self.view viewWithTag:10001].frame;
            f.origin.y-=40;
            [self.view viewWithTag:10001].frame = f;
            
            f = [self.view viewWithTag:10002].frame;
            f.origin.y-=40;
            [self.view viewWithTag:10002].frame = f;
            
           
            f = [self.view viewWithTag:10003].frame;
            f.origin.y-=40;
            [self.view viewWithTag:10003].frame = f;
            
            f = [self.view viewWithTag:10004].frame;
            f.origin.y-=40;
            [self.view viewWithTag:10004].frame = f;
            
            f = [self.view viewWithTag:10005].frame;
            f.origin.y-=40;
            [self.view viewWithTag:10005].frame = f;
            
        } completion:^(BOOL finished) {
             
        }];
        
    }else{
        
        CGRect f = [self.view viewWithTag:10001].frame;
        f.origin.y+=40;
        [self.view viewWithTag:10001].frame = f;
        
        f = [self.view viewWithTag:10002].frame;
        f.origin.y+=40;
        [self.view viewWithTag:10002].frame = f;
        
        
        f = [self.view viewWithTag:10003].frame;
        f.origin.y+=40;
        [self.view viewWithTag:10003].frame = f;
        
        f = [self.view viewWithTag:10004].frame;
        f.origin.y+=40;
        [self.view viewWithTag:10004].frame = f;
        
        f = [self.view viewWithTag:10005].frame;
        f.origin.y+=40;
        [self.view viewWithTag:10005].frame = f;
    }
    
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

    [[self.ui_btn_tNumber layer] addAnimation:animation forKey:@"animation_btn"];
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
   CGRect g =  self.ui_bgPic.frame;
    g.origin.y = -120;
    g.size.height=480.0f+120.0f;
    self.ui_bgPic.frame = g;
    
    CGRect f = hintView.frame;
    f.size.width = 314;
    hintView.frame = f;
    
}


- (void)dismissNoteView{
    [UIView animateWithDuration:1 delay:0.2 options:UIViewAnimationOptionAutoreverse animations:^{
        CGRect g =  self.ui_bgPic.frame;
        g.origin.y = 0;
        g.size.height=480.0f;
        self.ui_bgPic.frame = g;
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

- (void)p_seq{
    _currentTid = 1;
    //_dsId = _currentTid;
}

- (void)p_random{
    _dsKeyArray = [[RandomUtils getRandomCollection:0 to:1000 count:1000] retain];
    NSLog(@"when in p_random functoin,_dsKeyArray = %@C",_dsKeyArray);
    //_dsId = [[_dsKeyArray objectAtIndex:_currentTid] intValue];
}

- (void)p_chater{
    
}

/**
 *随机一百道题 
 *时间45分钟
 *90分+通过
 *一个题目一分
 */
- (void)p_exam{
    _dsKeyArray = [[RandomUtils getRandomCollection:0 to:1000 count:100] retain];
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
        [items addObject:[self getStringWithABCD:_shiti.a2 withIndex:2]];    }
    
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
@end
