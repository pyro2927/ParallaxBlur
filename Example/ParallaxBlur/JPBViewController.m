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
    
    UITextView *label = [[UITextView alloc] initWithFrame:CGRectMake(10, [self headerHeight] - 40, 180, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont systemFontOfSize:20]];
    [label setText:@"Sample Text"];
    [label setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    [self addHeaderOverlayView:label];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

@end
