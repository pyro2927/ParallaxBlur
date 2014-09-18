//
//  ParallaxTableViewController.m
//  Pods
//
//  Created by Joseph Pintozzi on 8/22/14.
//
//

#import "JPBParallaxTableViewController.h"

@interface JPBParallaxTableViewController (){
    UITableView *_tableView;
}

@end

@implementation JPBParallaxTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIScrollView *)contentView{
    return [self tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    cell.textLabel.text = @"Override me";
    cell.detailTextLabel.text = @"Please...";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

@end
