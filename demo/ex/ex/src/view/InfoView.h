//
//  InfoView.h
//  ex
//
//  Created by alfred sang on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBHintView.h"


@interface InfoView : UIView <TBHintViewDataSource,TBHintViewDelegate>{
    TBHintView *_hintView;
}

@property(nonatomic,retain,readwrite) NSString *showTitleString;
@property(nonatomic,retain,readwrite) NSString *showContentString;
@property(nonatomic,retain,readwrite) NSString *imageName;
@property(nonatomic,retain,readwrite) NSString *iconName;


-(void) show;
-(void) show:(NSTimeInterval)duration;

-(void) dismiss;




@end
