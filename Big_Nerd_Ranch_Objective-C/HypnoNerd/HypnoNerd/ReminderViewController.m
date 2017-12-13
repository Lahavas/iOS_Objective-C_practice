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
    
    NSLog(@"ReminderViewController loaded its view.");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.datePicker setMinimumDate:[NSDate dateWithTimeIntervalSinceNow:60]];
}

#pragma mark - Actions

- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UNUserNotificationCenter *userNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
 
    UNMutableNotificationContent *notificationContent = [[UNMutableNotificationContent alloc] init];
    [notificationContent setBody:@"Hypnotize me!"];
    
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                                       fromDate:date];
    
    UNCalendarNotificationTrigger *calendarNotificationTrigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:dateComponents
                                                                                                                         repeats:NO];
    
    UNNotificationRequest *notificationRequest = [UNNotificationRequest requestWithIdentifier:@"HypnosisAlarm"
                                                                                      content:notificationContent
                                                                                      trigger:calendarNotificationTrigger];
    
    [userNotificationCenter addNotificationRequest:notificationRequest
                             withCompletionHandler:nil];
}

@end
