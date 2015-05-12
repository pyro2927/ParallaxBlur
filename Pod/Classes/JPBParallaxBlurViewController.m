//
//  ParallaxBlurViewController.m
//  Pods
//
//  Created by Joseph Pintozzi on 8/22/14.
//
//

#import "JPBParallaxBlurViewController.h"
#import "FXBlurView.h"

@interface JPBParallaxBlurViewController ()<UIScrollViewDelegate> {
    UIScrollView *_mainScrollView;
    UIScrollView *_backgroundScrollView;
    UIView *_floatingHeaderView;
    UIImageView *_headerImageView;
    UIImageView *_blurredImageView;
    UIImage *_originalImageView;
    UIView *_scrollViewContainer;
    UIScrollView *_contentView;
    
    NSMutableArray *_headerOverlayViews;
}
@end

@implementation JPBParallaxBlurViewController

static CGFloat INVIS_DELTA = 50.0f;
static CGFloat BLUR_DISTANCE = 200.0f;
static CGFloat HEADER_HEIGHT = 60.0f;
static CGFloat IMAGE_HEIGHT = 320.0f;

-(void)viewDidLoad{
    [super viewDidLoad];
    
    _headerOverlayViews = [NSMutableArray array];
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _mainScrollView.delegate = self;
    _mainScrollView.bounces = YES;
    _mainScrollView.alwaysBounceVertical = YES;
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
    _mainScrollView.showsVerticalScrollIndicator = YES;
    _mainScrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _mainScrollView.autoresizesSubviews = YES;
    self.view = _mainScrollView;
    
    _backgroundScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), IMAGE_HEIGHT)];
    _backgroundScrollView.scrollEnabled = NO;
    _backgroundScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _backgroundScrollView.autoresizesSubviews = YES;
    _backgroundScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_backgroundScrollView.frame), CGRectGetHeight(_backgroundScrollView.frame))];
    _headerImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [_headerImageView setContentMode:UIViewContentModeScaleAspectFill];
    _headerImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_headerImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerImageTapped:)]];
    [_headerImageView setUserInteractionEnabled:YES];
    [_backgroundScrollView addSubview:_headerImageView];
    
    _blurredImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_backgroundScrollView.frame), CGRectGetHeight(_backgroundScrollView.frame))];
    [_blurredImageView setContentMode:UIViewContentModeScaleAspectFill];
    _blurredImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_blurredImageView setAlpha:0.0f];
    [_blurredImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerImageTapped:)]];
    [_blurredImageView setUserInteractionEnabled:YES];
    
    _floatingHeaderView = [[UIView alloc] initWithFrame:_backgroundScrollView.frame];
    [_floatingHeaderView setBackgroundColor:[UIColor clearColor]];
    [_floatingHeaderView setUserInteractionEnabled:NO];
    
    [_backgroundScrollView addSubview:_blurredImageView];
    
    _scrollViewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_backgroundScrollView.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - [self offsetHeight] )];
    _scrollViewContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    _contentView = [self contentView];
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [_scrollViewContainer addSubview:_contentView];
    
    [_mainScrollView addSubview:_backgroundScrollView];
    [_mainScrollView addSubview:_floatingHeaderView];
    [_mainScrollView addSubview:_scrollViewContainer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_contentView setFrame:CGRectMake(0, 0, CGRectGetWidth(_scrollViewContainer.frame), CGRectGetHeight(self.view.frame) - [self offsetHeight] )];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setNeedsScrollViewAppearanceUpdate];
}

- (void)setNeedsScrollViewAppearanceUpdate
{
    _mainScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), _contentView.contentSize.height + CGRectGetHeight(_backgroundScrollView.frame));
}

- (CGFloat)navBarHeight{
    if (self.navigationController && !self.navigationController.navigationBarHidden && self.navigationController.navigationBar.translucent) {
        return CGRectGetHeight(self.navigationController.navigationBar.frame) + 20; //include 20 for the status bar
    }
    return 0.0f;
}

- (CGFloat)offsetHeight{
    return HEADER_HEIGHT + [self navBarHeight];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat delta = 0.0f;
    CGRect rect = CGRectMake(0, 0, CGRectGetWidth(_scrollViewContainer.frame), IMAGE_HEIGHT);
    
    CGFloat backgroundScrollViewLimit = _backgroundScrollView.frame.size.height - [self offsetHeight];
    
    
    // Here is where I do the "Zooming" image and the quick fade out the text and toolbar
    if (scrollView.contentOffset.y < 0.0f) {
        //calculate delta
        delta = fabs(MIN(0.0f, _mainScrollView.contentOffset.y + [self navBarHeight]));
        _backgroundScrollView.frame = CGRectMake(CGRectGetMinX(rect) - delta / 2.0f, CGRectGetMinY(rect) - delta, CGRectGetWidth(_scrollViewContainer.frame) + delta, CGRectGetHeight(rect) + delta);
        [_floatingHeaderView setAlpha:(INVIS_DELTA - delta) / INVIS_DELTA];
    } else {
        delta = _mainScrollView.contentOffset.y;
        
        //set alfas
        CGFloat newAlpha = 1 - ((BLUR_DISTANCE - delta)/ BLUR_DISTANCE);
        [_blurredImageView setAlpha:newAlpha];
        [_floatingHeaderView setAlpha:1];
        
        // Here I check whether or not the user has scrolled passed the limit where I want to stick the header, if they have then I move the frame with the scroll view
        // to give it the sticky header look
        if (delta > backgroundScrollViewLimit) {
            _backgroundScrollView.frame = (CGRect) {.origin = {0, delta - _backgroundScrollView.frame.size.height + [self offsetHeight]}, .size = {CGRectGetWidth(_scrollViewContainer.frame), IMAGE_HEIGHT}};
            _floatingHeaderView.frame = (CGRect) {.origin = {0, delta - _floatingHeaderView.frame.size.height + [self offsetHeight]}, .size = {CGRectGetWidth(_scrollViewContainer.frame), IMAGE_HEIGHT}};
            _scrollViewContainer.frame = (CGRect){.origin = {0, CGRectGetMinY(_backgroundScrollView.frame) + CGRectGetHeight(_backgroundScrollView.frame)}, .size = _scrollViewContainer.frame.size };
            _contentView.contentOffset = CGPointMake (0, delta - backgroundScrollViewLimit);
            CGFloat contentOffsetY = -backgroundScrollViewLimit * 0.5f;
            [_backgroundScrollView setContentOffset:(CGPoint){0,contentOffsetY} animated:NO];
        }
        else {
            _backgroundScrollView.frame = rect;
            _floatingHeaderView.frame = rect;
            _scrollViewContainer.frame = (CGRect){.origin = {0, CGRectGetMinY(rect) + CGRectGetHeight(rect)}, .size = _scrollViewContainer.frame.size };
            [_contentView setContentOffset:(CGPoint){0,0} animated:NO];
            [_backgroundScrollView setContentOffset:CGPointMake(0, -delta * 0.5f)animated:NO];
        }
    }
}

- (UIScrollView*)contentView{
    UIScrollView *contentView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    contentView.scrollEnabled = NO;
    return contentView;
}

- (void)setHeaderImage:(UIImage*)headerImage{
    _originalImageView = headerImage;
    [_headerImageView setImage:headerImage];
    [_blurredImageView setImage:[headerImage blurredImageWithRadius:40.0f iterations:4 tintColor:[UIColor clearColor]]];
}

- (void)addHeaderOverlayView:(UIView*)overlay{
    [_headerOverlayViews addObject:overlay];
    [_floatingHeaderView addSubview:overlay];
}

- (CGFloat)headerHeight{
    return CGRectGetHeight(_backgroundScrollView.frame);
}

- (UIScrollView*)mainScrollView{
    return _mainScrollView;
}

- (void)headerImageTapped:(UITapGestureRecognizer*)tapGesture
{
    if ([self.interactionsDelegate respondsToSelector:@selector(didTapHeaderImageView:)]) {
        [self.interactionsDelegate didTapHeaderImageView:_headerImageView];
    }
}

@end
