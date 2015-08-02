//
//  JPBFloatingTextViewController.h
//  Pods
//
//  Created by Joseph Pintozzi on 8/22/14.
//
//

#import "JPBParallaxTableViewController.h"

@interface JPBFloatingTextViewController : JPBParallaxTableViewController

- (void)setTitleText:(NSString*)text;
- (void)setSubtitleText:(NSString*)text;
- (void)selLabelBackground:(UIColor*)color;
- (void)setLabelBackgroundGradientColor:(UIColor*)bottomColor;
- (void)setTitleFont:(UIFont*)font;
- (void)setSubtitleFont:(UIFont*)font;
- (void)setTitleTextColor:(UIColor*)color;
- (void)setSubtitleTextColor:(UIColor*)color;
- (CGFloat)horizontalOffset;

@end
