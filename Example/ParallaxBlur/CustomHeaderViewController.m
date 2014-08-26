//
//  CustomHeaderViewController.m
//  ParallaxBlur
//
//  Created by Joseph Pintozzi on 8/26/14.
//  Copyright (c) 2014 pyro2927. All rights reserved.
//

#import "CustomHeaderViewController.h"

@interface CustomHeaderViewController (){
    UIImageView *imageView;
    UITextView *textView;
}

@end

@implementation CustomHeaderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setHeaderImage:[UIImage imageNamed:@"placeholder"]];
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, [self headerHeight] - 100, 90, 90)];
    [imageView setImage:[UIImage imageNamed:@"awesome.jpg"]];
    [self addHeaderOverlayView:imageView];
}

- (UIScrollView*)contentView{
    textView = [[UITextView alloc] initWithFrame:CGRectZero];
    textView.scrollEnabled = NO;
    textView.editable = NO;
    textView.text = @"Yeah, I like animals better than people sometimes... Especially dogs. Dogs are the best. Every time you come home, they act like they haven't seen you in a year. And the good thing about dogs... is they got different dogs for different people. Like pit bulls. The dog of dogs. Pit bull can be the right man's best friend... or the wrong man's worst enemy. You going to give me a dog for a pet, give me a pit bull. Give me... Raoul. Right, Omar? Give me Raoul.\n\nWell, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.\n\nWell, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.\n\nNow that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids.\n\n";
    textView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), 600);
    return textView;
}

@end
