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
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30; //helps for testing scrolling on iPad
}

- (CGFloat)horizontalOffset{
    return 50.0f;
}

@end
