//
//  ItemDetailViewController.m
//  Homepwner
//
//  Created by USER on 2017. 12. 21..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Item.h"

@interface ItemDetailViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

#pragma mark - Private IBOutlet Properties

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

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

#pragma mark - IBAction

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePickerController setDelegate:self];
    
    [self presentViewController:imagePickerController
                       animated:YES
                     completion:nil];
}

#pragma mark - Image Picker Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    [self.imageView setImage:image];
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end