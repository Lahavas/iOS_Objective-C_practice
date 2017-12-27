//
//  ItemDetailViewController.h
//  Homepwner
//
//  Created by USER on 2017. 12. 21..
//  Copyright © 2017년 USER. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@interface ItemDetailViewController : UIViewController

#pragma mark - Public Properties

@property (strong, nonatomic) Item *item;

@end
