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

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self.tabBarItem setTitle:@"Hypnotize"];
        
        UIImage *itemImage = [UIImage imageNamed:@"Hypno"];
        [self.tabBarItem setImage:itemImage];
    }
    
    return self;
}

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
