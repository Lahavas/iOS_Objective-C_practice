//
//  BNRItem.h
//  RandomItems
//
//  Created by Jaeho on 2017. 12. 10..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject {
    NSString *_itemName;
    NSString *_serialNumber;
    NSInteger _valueInDollars;
    NSDate *_dateCreated;
}

- (NSString *)itemName;
- (void)setItemName:(NSString *)itemName;

- (NSString *)serialNumber;
- (void)setSerialNumber:(NSString *)serialNumber;

- (NSInteger)valueInDollars;
- (void)setValueInDollars:(NSInteger)valueInDollars;

- (NSDate *)dateCreated;

@end
