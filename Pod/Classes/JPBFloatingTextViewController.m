//
//  JPBFloatingTextViewController.m
//  Pods
//
//  Created by Joseph Pintozzi on 8/22/14.
//
//

#import "JPBFloatingTextViewController.h"

@interface JPBFloatingTextViewController () {
    UILabel *_titleLabel;
    UILabel *_subtitleLabel;
}

@end

@implementation JPBFloatingTextViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, [self headerHeight] - 50, self.view.frame.size.width - 30, 25)];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setTextColor:[UIColor whiteColor]];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [_titleLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [self addHeaderOverlayView:_titleLabel];
    
    _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, [self headerHeight] - 25, self.view.frame.size.width - 30, 15)];
    [_subtitleLabel setBackgroundColor:[UIColor clearColor]];
    [_subtitleLabel setTextColor:[UIColor whiteColor]];
    [_subtitleLabel setFont:[UIFont systemFontOfSize:12]];
    [_subtitleLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [self addHeaderOverlayView:_subtitleLabel];
}

- (void)setTitleText:(NSString*)text{
    [_titleLabel setText:text];
}

- (void)setSubtitleText:(NSString*)text{
    [_subtitleLabel setText:text];
}

@end
