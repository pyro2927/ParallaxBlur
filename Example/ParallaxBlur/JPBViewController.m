//
//  JPBViewController.m
//  ParallaxBlur
//
//  Created by pyro2927 on 08/22/2014.
//  Copyright (c) 2014 pyro2927. All rights reserved.
//

#import "JPBViewController.h"

@interface JPBViewController ()

@end

@implementation JPBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setHeaderImage:[UIImage imageNamed:@"meatballs.jpeg"]];
    [self setTitleText:@"The Best Title in the World"];
    [self setSubtitleText:@"ikea meatballs are the bomb"];
    [self setLabelBackgroundGradientColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.7f]];
    
    CGFloat headerHeight = [self headerHeight];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5, headerHeight - 55, 44, 44)];
    [button setTitle:@"Tap" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(alert:) forControlEvents:UIControlEventTouchUpInside];
    [self addHeaderOverlayView:button];
}

- (void)alert:(UIButton*)sender{
    [[[UIAlertView alloc] initWithTitle:@"Alert" message:@"You can even add buttons to the header!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@":)", nil] show];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30; //helps for testing scrolling on iPad
}

- (CGFloat)horizontalOffset{
    return 50.0f;
}

@end
