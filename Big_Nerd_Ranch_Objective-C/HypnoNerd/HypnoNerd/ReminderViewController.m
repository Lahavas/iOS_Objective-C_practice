//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by USER on 2017. 12. 13..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController ()

#pragma mark - Private Properties

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

#pragma mark -

@implementation ReminderViewController

#pragma mark - Initialization

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        [self.tabBarItem setTitle:@"Reminder"];
        
        UIImage *itemImage = [UIImage imageNamed:@"Time"];
        
        self.tabBarItem.image = itemImage;
    }
    
    return self;
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Actions

- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
}

@end
