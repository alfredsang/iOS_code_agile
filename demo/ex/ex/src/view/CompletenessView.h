//
//  CompletenessView.h
//  ex
//
//  Created by alfred sang on 12-8-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 答题完成进度说明
 *
 *
 */
@interface CompletenessView : UIView


@property(nonatomic,retain,readwrite) NSString *showTitleString;
@property(nonatomic,retain,readwrite) NSString *showContentString;
@property(nonatomic,retain,readwrite) NSString *iconName;

@property(nonatomic,retain,readwrite) UIImageView *iconView;
@property(nonatomic,retain,readwrite) UILabel *titleLable;
@property(nonatomic,retain,readwrite) UILabel *contentLable;
@property(nonatomic,retain,readwrite) UIButton *hideViewBtn;


- (void)setNoteInfo:(NSString *)title content:(NSString *)content iconName:(NSString *)iconNameStr;

@end
