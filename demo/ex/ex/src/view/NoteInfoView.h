//
//  NoteInfoView.h
//  ex
//
//  Created by minglq on 12-8-10.
//
//

#import <UIKit/UIKit.h>

@protocol NoteInfoViewDelegate <NSObject>
@optional
-(void)whenNoteInfoViewDismiss;

@end


@interface NoteInfoView : UIView

@property(nonatomic,retain,readwrite) NSString *showTitleString;
@property(nonatomic,retain,readwrite) NSString *showContentString;
@property(nonatomic,retain,readwrite) NSString *iconName;

@property(nonatomic,retain,readwrite) UIImageView *iconView;
@property(nonatomic,retain,readwrite) UILabel *titleLable;
@property(nonatomic,retain,readwrite) UILabel *contentLable;
@property(nonatomic,retain,readwrite) UIButton *hideViewBtn;

@property(nonatomic,assign,readwrite) id<NoteInfoViewDelegate> vDelegate;

- (void)setNoteInfo:(NSString *)title content:(NSString *)content iconName:(NSString *)iconNameStr;

@end
