//
//  ParallaxTableViewController.h
//  Pods
//
//  Created by Joseph Pintozzi on 8/22/14.
//
//

#import "JPBParallaxBlurViewController.h"

@interface JPBParallaxTableViewController : JPBParallaxBlurViewController<UITableViewDelegate, UITableViewDataSource>

@property (readonly) UITableView *tableView;

@end
