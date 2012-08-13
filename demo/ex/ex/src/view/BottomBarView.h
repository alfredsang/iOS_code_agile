//
//  BottomBarView.h
//  ex
//
//  Created by minglq on 12-8-13.
//
//

#import <UIKit/UIKit.h>

@interface BottomBarView : UIView

@property(nonatomic,retain,readonly) IBOutlet UIImageView *bgView;
@property(nonatomic,retain,readonly) IBOutlet UIButton *backBtn;
@property(nonatomic,retain,readonly) IBOutlet UIButton *showAnwserBtn;
@property(nonatomic,retain,readonly) IBOutlet UIButton *favorBtn;
@property(nonatomic,retain,readonly) IBOutlet UIButton *zhuanBtn;
@property(nonatomic,retain,readonly) IBOutlet UIButton *settingBtn;

@end
