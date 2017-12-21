//
//  ItemDetailViewController.m
//  Homepwner
//
//  Created by USER on 2017. 12. 21..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Item.h"

@interface ItemDetailViewController ()

#pragma mark - Private IBOutlet Properties

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@end

@implementation ItemDetailViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Item *item = self.item;
    
    [self.nameField setText:item.itemName];
    [self.serialNumberField setText:item.serialNumber];
    [self.valueField setText:[NSString stringWithFormat:@"%ld", item.valueInDollars]];
    
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    [self.dateLabel setText:[dateFormatter stringFromDate:item.dateCreated]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    Item *item = self.item;
    [item setItemName:self.nameField.text];
    [item setSerialNumber:self.serialNumberField.text];
    [item setValueInDollars:[self.valueField.text integerValue]];
}

#pragma mark - Accessor Methods

- (void)setItem:(Item *)item {
    _item = item;
    [self.navigationItem setTitle:_item.itemName];
}

@end
