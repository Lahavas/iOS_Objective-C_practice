//
//  DrawViewController.m
//  TouchTracker
//
//  Created by USER on 2017. 12. 29..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "DrawViewController.h"
#import "DrawView.h"

@interface DrawViewController ()

@end

#pragma mark -

@implementation DrawViewController

#pragma mark - View Life Cycle

- (void)loadView {
    self.view = [[DrawView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
