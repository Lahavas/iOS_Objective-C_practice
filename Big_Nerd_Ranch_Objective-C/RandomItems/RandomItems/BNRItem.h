//
//  BNRItem.h
//  RandomItems
//
//  Created by Jaeho on 2017. 12. 10..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

//#pragma mark - Instance variables
//
//{
//    NSString *_itemName;
//    NSString *_serialNumber;
//    int _valueInDollars;
//    NSDate *_dateCreated;
//
//    BNRItem *_containedItem;
//    __weak BNRItem *_container;
//}

#pragma mark - Properties

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;


#pragma mark - Class Methods

+ (instancetype)randomItem;

#pragma mark - Initializer

- (instancetype)initWithItemName:(NSString *)itemName;

- (instancetype)initWithItemName:(NSString *)itemName
                  valueInDollars:(int)valueInDollars
                    serialNumber:(NSString *)serialNumber;

//#pragma mark - Accessor Methods
//
//- (NSString *)itemName;
//- (void)setItemName:(NSString *)itemName;
//
//- (NSString *)serialNumber;
//- (void)setSerialNumber:(NSString *)serialNumber;
//
//- (int)valueInDollars;
//- (void)setValueInDollars:(int)valueInDollars;
//
//- (NSDate *)dateCreated;
//
//- (BNRItem *)containedItem;
//- (void)setContainedItem:(BNRItem *)containedItem;
//
//- (BNRItem *)container;
//- (void)setContainer:(BNRItem *)container;

@end
