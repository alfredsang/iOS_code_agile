//
//  BottomBarView.m
//  ex
//
//  Created by minglq on 12-8-13.
//
//

#import "BottomBarView.h"

@implementation BottomBarView

@synthesize backBtn,favorBtn,settingBtn,showAnwserBtn,zhuanBtn,bgView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        bgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 298, 40)];
        [bgView setImage:[UIImage imageNamed:@"articleView_bottom_bg1"]];
        [self addSubview:bgView];
        [bgView release];
        
        backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(9, 0, 62, 40);
        [backBtn setBackgroundImage:[UIImage imageNamed:@"back_page"] forState:UIControlStateHighlighted];
        [backBtn setHighlighted:YES];
        [self addSubview:backBtn];
        
        
        
        favorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        favorBtn.frame = CGRectMake(78, 0, 42, 40);
        [favorBtn setBackgroundImage:[UIImage imageNamed:@"artilce_icon_collect.png"] forState:UIControlStateHighlighted];
        [favorBtn setHighlighted:YES];
        [self addSubview:favorBtn];
        
        
        
        backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(9, 0, 62, 40);
        [backBtn setBackgroundImage:[UIImage imageNamed:@"artilce_icon_collect.png"] forState:UIControlStateHighlighted];
        [backBtn setHighlighted:YES];
        [self addSubview:backBtn];
        
        
        
        
        backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(9, 0, 62, 40);
        [backBtn setBackgroundImage:[UIImage imageNamed:@"back_page"] forState:UIControlStateHighlighted];
        [backBtn setHighlighted:YES];
        [self addSubview:backBtn];
        
        
        backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(9, 0, 62, 40);
        [backBtn setBackgroundImage:[UIImage imageNamed:@"back_page"] forState:UIControlStateHighlighted];
        [backBtn setHighlighted:YES];
        [self addSubview:backBtn];
        
        
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
