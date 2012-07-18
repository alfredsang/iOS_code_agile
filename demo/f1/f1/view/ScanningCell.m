//
//  ScanningCell.m
//  CaiXin
//
//  Created by Rainbow Zhang on 11/4/11.
//  Copyright (c) 2011 iTotemStudio. All rights reserved.
//

#import "ScanningCell.h"

@implementation ScanningCell

@synthesize scanning;
@synthesize urlLabel;
@synthesize timeLabel;
@synthesize backgroundImageView;
@synthesize accessoryTypeImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
    {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if (selected)
    {
        self.backgroundImageView.image = [UIImage imageNamed:@"bar_tapped.png"];
        self.accessoryTypeImageView.image = [UIImage imageNamed:@"arrow_tapped.png"];
    }
    else
    {
        self.backgroundImageView.image = nil;
        self.accessoryTypeImageView.image = [UIImage imageNamed:@"arrow.png"];
        
    }
}


#pragma mark EditMode


- (void)scanningNewsEnterEditMode
{
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:ANIMATION_DURATION];
    
    self.urlLabel.frame = CGRectMake(41, 6, 273, 20);
    self.timeLabel.frame = CGRectMake(41, 25, 276, 20);
    self.accessoryTypeImageView.frame = CGRectMake(330, 15, 14, 20);
    
    [UIView commitAnimations];
}

- (void)scanningNewsExitEditMode
{
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:ANIMATION_DURATION];
    
    self.urlLabel.frame = CGRectMake(11, 6, 281, 20);
    self.timeLabel.frame = CGRectMake(11, 25, 281, 20);
    self.accessoryTypeImageView.frame = CGRectMake(300, 15, 14, 20);
    
    [UIView commitAnimations];
}


#pragma mark DataSet

- (void)setScanningListForCell:(DM_Scanning *)aScanning
{
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(scanningNewsEnterEditMode) 
                                                 name:@"ScanningNewsEnterEditMode" 
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(scanningNewsExitEditMode) 
                                                 name:@"ScanningNewsExitEditMode" 
                                               object:nil];
    
    self.scanning = aScanning;
    self.urlLabel.text = aScanning.scanTitle;
//    NSDateFormatter *dm = [[[NSDateFormatter alloc] init] autorelease];
//	[dm setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSTimeInterval timeInterval = [aScanning.scanDate timeIntervalSince1970];
    
    NSString *s = [aScanning.scanDate stringByReplacingOccurrencesOfString:@"+0000" withString:@""];
	self.timeLabel.text = s;
    
    self.urlLabel.frame = CGRectMake(11, 6, 281, 20);
    self.timeLabel.frame = CGRectMake(11, 25, 281, 20);
}

- (void)dealloc 
{
    [scanning release];
    [urlLabel release];
    [timeLabel release];
    [backgroundImageView release];
    [accessoryTypeImageView release];
    [super dealloc];
}

@end
