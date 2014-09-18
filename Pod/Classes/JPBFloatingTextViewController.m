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
    UIView *_labelBackground;
}

@end

@implementation JPBFloatingTextViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _labelBackground = [[UIView alloc] initWithFrame:CGRectMake(0, [self headerHeight] - 60, self.view.frame.size.width, 60)];
    [self addHeaderOverlayView:_labelBackground];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake([self horizontalOffset], [self headerHeight] - 50, self.view.frame.size.width - 15 - [self horizontalOffset], 25)];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setTextColor:[UIColor whiteColor]];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [_titleLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [self addHeaderOverlayView:_titleLabel];
    
    _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake([self horizontalOffset], [self headerHeight] - 25, self.view.frame.size.width - 15 - [self horizontalOffset], 15)];
    [_subtitleLabel setBackgroundColor:[UIColor clearColor]];
    [_subtitleLabel setTextColor:[UIColor whiteColor]];
    [_subtitleLabel setFont:[UIFont systemFontOfSize:12]];
    [_subtitleLabel setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [self addHeaderOverlayView:_subtitleLabel];
}

- (CGFloat)horizontalOffset{
    return 15.0f;
}

- (void)setTitleText:(NSString*)text{
    [_titleLabel setText:text];
}

- (void)setSubtitleText:(NSString*)text{
    [_subtitleLabel setText:text];
}

- (void)selLabelBackground:(UIColor*)color{
    _labelBackground.backgroundColor = color;
}

- (void)setLabelBackgroundGradientColor:(UIColor*)bottomColor{
    //build gradient with top clear
    UIColor *topColor = [UIColor clearColor];
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(_labelBackground.frame), CGRectGetHeight(_labelBackground.frame));
    
    [_labelBackground.layer insertSublayer:gradientLayer atIndex:0];
}

@end
