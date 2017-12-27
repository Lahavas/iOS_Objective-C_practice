//
//  Item.m
//  Homepwner
//
//  Created by USER on 2017. 12. 21..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "Item.h"

@implementation Item

#pragma mark - Describing Objects

- (NSString *)description {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%ld, recorded on %@",
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
    NSInteger randomValueInDollors = arc4random() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    Item *newItem = [[self alloc] initWithItemName:randomName
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
                  valueInDollars:(NSInteger)valueInDollars
                    serialNumber:(NSString *)serialNumber {
    self = [super init];
    
    if (self) {
        _itemName = itemName;
        _valueInDollars = valueInDollars;
        _serialNumber = serialNumber;
        _dateCreated = [[NSDate alloc] init];
        
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        _itemKey = key;
    }
    
    return self;
}

@end
