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
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%ld, recorded on %@",
                                   self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    
    return descriptionString;
}

#pragma mark - Initializer

-(instancetype)init {
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
    }
    
    return self;
}

#pragma mark - Accessor Methods

- (NSString *)itemName {
    return _itemName;
}

- (void)setItemName:(NSString *)itemName {
    _itemName = itemName;
}

- (NSString *)serialNumber {
    return _serialNumber;
}

- (void)setSerialNumber:(NSString *)serialNumber {
    _serialNumber = serialNumber;
}

- (NSInteger)valueInDollars {
    return _valueInDollars;
}

- (void)setValueInDollars:(NSInteger)valueInDollars {
    _valueInDollars = valueInDollars;
}

- (NSDate *)dateCreated {
    return _dateCreated;
}

@end
