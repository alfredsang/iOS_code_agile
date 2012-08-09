//
//  NoteInfoView.m
//  ex
//
//  Created by minglq on 12-8-10.
//
//

#import "NoteInfoView.h"

@implementation NoteInfoView

@synthesize showTitleString;
@synthesize showContentString;
@synthesize iconName;

@synthesize iconView,contentLable,hideViewBtn,titleLable;

@synthesize vDelegate;
//h=120
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor orangeColor];
        
        iconView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
        [iconView setImage:[UIImage imageNamed:@"weibo_location_selected"]];

        titleLable = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, 280, 30)];
        titleLable.numberOfLines = 1;
        titleLable.text = @"default title";
        titleLable.opaque = YES;
        titleLable.font = [UIFont boldSystemFontOfSize:17];
//        titleLable.textColor = [UIColor whiteColor];
        titleLable.backgroundColor = [UIColor clearColor];
        titleLable.alpha = 0.5;
        
        contentLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 300, 80)];
        contentLable.numberOfLines = 5;
        contentLable.text = @"default content";
        contentLable.font = [UIFont systemFontOfSize:14];
        contentLable.opaque = YES;
        contentLable.backgroundColor = [UIColor clearColor];
        contentLable.alpha = 0.5;
        
        [self addSubview:iconView];
        [self addSubview:contentLable];
        [self addSubview:titleLable];
        [self addSubview:hideViewBtn];
        
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

#pragma mark - UIResponder
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.hidden = YES;
    
    if ([vDelegate respondsToSelector:@selector(whenNoteInfoViewDismiss)]) {
        [vDelegate whenNoteInfoViewDismiss];
    }
}


- (void)dealloc{
    
    [super dealloc];
}

#pragma mark - private 

- (void)setNoteInfo:(NSString *)title content:(NSString *)content iconName:(NSString *)iconNameStr{
    self.titleLable.text = title;
    self.contentLable.text = content;
    [self.iconView setImage:[UIImage imageNamed:iconNameStr]];
    self.hidden = NO;
}
@end
