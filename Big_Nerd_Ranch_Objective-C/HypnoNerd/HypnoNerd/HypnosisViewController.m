//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by USER on 2017. 12. 8..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "HypnosisViewController.h"

#import "HypnosisView.h"

@interface HypnosisViewController () <UITextFieldDelegate>

@end

@implementation HypnosisViewController

#pragma mark - Initialization

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        [self.tabBarItem setTitle:@"Hypnotize"];
        
        UIImage *itemImage = [UIImage imageNamed:@"Hypno"];
        [self.tabBarItem setImage:itemImage];
    }
    
    return self;
}

#pragma mark - View Life Cycle

- (void)loadView {
    CGRect frame = UIScreen.mainScreen.bounds;
    HypnosisView *backgroundView = [[HypnosisView alloc] initWithFrame:frame];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];

    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [textField setPlaceholder:@"Hypnotize me"];
    [textField setReturnKeyType:UIReturnKeyDone];

    [textField setDelegate:self];

    [backgroundView addSubview:textField];
    
    self.view = backgroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded its view.");
    NSLog(@"%@", self.view);
}

#pragma mark - Private Methods

- (void)drawHypnoticMessage:(NSString *)message {
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        [messageLabel setBackgroundColor:UIColor.clearColor];
        [messageLabel setTextColor:UIColor.whiteColor];
        [messageLabel setText:message];
        
        [messageLabel sizeToFit];
        
        int width = (int)(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(messageLabel.bounds));
        int x = arc4random() % width;
        
        int height = (int)(CGRectGetHeight(self.view.bounds) - CGRectGetHeight(messageLabel.bounds));
        int y = arc4random() % height;
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        [messageLabel setFrame:frame];
        
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *centerXMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                                                           type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        [centerXMotionEffect setMinimumRelativeValue:@(-25)];
        [centerXMotionEffect setMaximumRelativeValue:@(25)];
        
        UIInterpolatingMotionEffect *centerYMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                                                           type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        [centerYMotionEffect setMinimumRelativeValue:@(-25)];
        [centerYMotionEffect setMaximumRelativeValue:@(25)];
        
        [messageLabel setMotionEffects:@[centerXMotionEffect,
                                         centerYMotionEffect]];
    }
}

#pragma mark - Text Field Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self drawHypnoticMessage:textField.text];
    
    [textField setText:@""];
    [textField resignFirstResponder];
    
    return YES;
}

@end
