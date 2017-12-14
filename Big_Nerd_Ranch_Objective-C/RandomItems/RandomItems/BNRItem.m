//
//  BNRItem.m
//  RandomItems
//
//  Created by Jaeho on 2017. 12. 10..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

- (NSString *)description {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                   self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    
    return descriptionString;
}

#pragma mark - Object Life Cycle

- (void)dealloc {
    NSLog(@"Destroyed: %@", self);
}

#pragma mark - Class Methods

+ (instancetype)randomItem {
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomAdjectiveList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    int randomValueInDollors = arc4random() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValueInDollors
                                         serialNumber:randomSerialNumber];
    
    return newItem;
}

#pragma mark - Initializer

- (instancetype)init {
    return [self initWithItemName:@"Item"];
}

- (instancetype)initWithItemName:(NSString *)itemName {
    return [self initWithItemName:itemName
                   valueInDollars:0
                     serialNumber:@""];
}

- (instancetype)initWithItemName:(NSString *)itemName
                  valueInDollars:(int)valueInDollars
                    serialNumber:(NSString *)serialNumber {
    self = [super init];
    
    if (self) {
        _itemName = itemName;
        _valueInDollars = valueInDollars;
        _serialNumber = serialNumber;
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

#pragma mark - Accessor Methods

- (void)setContainedItem:(BNRItem *)containedItem {
    _containedItem = containedItem;
    self.containedItem.container = self;
}

//- (NSString *)itemName {
//    return _itemName;
//}
//
//- (void)setItemName:(NSString *)itemName {
//    _itemName = itemName;
//}
//
//- (NSString *)serialNumber {
//    return _serialNumber;
//}
//
//- (void)setSerialNumber:(NSString *)serialNumber {
//    _serialNumber = serialNumber;
//}
//
//- (int)valueInDollars {
//    return _valueInDollars;
//}
//
//- (void)setValueInDollars:(int)valueInDollars {
//    _valueInDollars = valueInDollars;
//}
//
//- (NSDate *)dateCreated {
//    return _dateCreated;
//}
//
//- (BNRItem *)containedItem {
//    return _containedItem;
//}
//
//- (void)setContainedItem:(BNRItem *)containedItem {
//    _containedItem = containedItem;
//    
//    [containedItem setContainer:self];
//}
//
//- (BNRItem *)container {
//    return _container;
//}
//
//- (void)setContainer:(BNRItem *)container {
//    _container = container;
//}

@end
