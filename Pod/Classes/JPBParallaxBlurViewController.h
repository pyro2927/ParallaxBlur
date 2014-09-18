//
//  ParallaxBlurViewController.h
//  Pods
//
//  Created by Joseph Pintozzi on 8/22/14.
//
//

#import <UIKit/UIKit.h>

@interface JPBParallaxBlurViewController : UIViewController

- (void)setHeaderImage:(UIImage*)headerImage;
- (void)addHeaderOverlayView:(UIView*)overlay;
- (CGFloat)headerHeight;
- (UIScrollView*)mainScrollView;

@end
