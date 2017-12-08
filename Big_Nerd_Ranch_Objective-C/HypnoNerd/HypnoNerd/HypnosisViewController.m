//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by USER on 2017. 12. 8..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "HypnosisViewController.h"

#import "HypnosisView.h"

@interface HypnosisViewController ()

@end

@implementation HypnosisViewController

#pragma mark - View Life Cycle

- (void)loadView {
    HypnosisView *backgroundView = [[HypnosisView alloc] initWithFrame:CGRectZero];
    
    self.view = backgroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

@end
