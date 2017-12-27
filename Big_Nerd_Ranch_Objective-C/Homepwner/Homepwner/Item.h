//
//  Item.h
//  Homepwner
//
//  Created by USER on 2017. 12. 21..
//  Copyright © 2017년 USER. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

#pragma mark - Public Properties

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) NSInteger valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

@property (nonatomic, copy) NSString *itemKey;

#pragma mark - Class Methods

+ (instancetype)randomItem;

#pragma mark - Initializer

- (instancetype)initWithItemName:(NSString *)itemName;

- (instancetype)initWithItemName:(NSString *)itemName
                  valueInDollars:(NSInteger)valueInDollars
                    serialNumber:(NSString *)serialNumber;

@end
