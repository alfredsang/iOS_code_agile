//
//  InfoView.m
//  ex
//
//  Created by alfred sang on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "InfoView.h"

@implementation InfoView

@synthesize showTitleString;
@synthesize showContentString;
@synthesize iconName;
@synthesize imageName;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _hintView  = [[TBHintView alloc] initWithFrame:frame];
        
        _hintView.textColor = [UIColor whiteColor];
        _hintView.backgroundColor = [UIColor colorWithRed:89.0/255.0 green:119.0/255.0 blue:39.0/255.0 alpha:0.9];
        _hintView.spanWidthWeight = 1;//0.95f;
        _hintView.presentationAnimation = kHintViewPresentationFade;
        _hintView.delegate = self;
        _hintView.dataSource = self;
        
        
    }
    return self;
}

-(void)show{
    [_hintView removeFromSuperview];
    _hintView.delegate = self;
    _hintView.dataSource = self;
    [self addSubview:_hintView];

    [_hintView show];
}


-(void) show:(NSTimeInterval)time{
    [_hintView removeFromSuperview];
    _hintView.delegate = self;
    _hintView.dataSource = self;
    [self addSubview:_hintView];
    [_hintView show:time];
}


-(void) dismiss{
    [_hintView dismiss];
    _hintView.delegate = nil;
    _hintView.dataSource = nil;
};


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - TBHintViewDataSource
-(NSInteger)numberOfPagesInHintView:(TBHintView *)hintView
{
    return 1;
}
 
//-(NSString*) textForPage:(NSUInteger)page hintView:(TBHintView*)hintView;
-(UIImage*) imageForPage:(NSUInteger)page hintView:(TBHintView*)hintView{
    return [UIImage imageNamed:[showContentString length]>0?showContentString:@""];
}

-(NSString*) titleForPage:(NSUInteger)page hintView:(TBHintView*)hintView{
    return [showTitleString length]>0?showTitleString:@"";
}
-(UIImage*) titleIconForPage:(NSUInteger)page hintView:(TBHintView*)hintView{
    return [UIImage imageNamed:[iconName length]>0?iconName:@""];
}

-(NSString*) textForPage:(NSUInteger)page hintView:(TBHintView*)hintView{
    return [showContentString length]>0?showContentString:@"";
}


#pragma mark - TBHintViewDelegate
-(void) dismissedHintView:(TBHintView*)hintView{
    
}
//-(CGFloat) heightForHintView:(TBHintView*)hintView{
//    return 100.0f;
//}

-(void)dealloc{
    [showTitleString release];
    [showContentString release];
    [imageName release];
    [iconName release];
    [super dealloc];
}

#pragma mark - UIResponder 
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_hintView removeFromSuperview];
//    [self removeFromSuperview];
    [_hintView dismiss];
}

@end
