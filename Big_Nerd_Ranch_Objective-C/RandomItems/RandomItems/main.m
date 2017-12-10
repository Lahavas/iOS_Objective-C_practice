//
//  main.m
//  RandomItems
//
//  Created by Jaeho on 2017. 12. 10..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
//        [items addObject:@"One"];
//        [items addObject:@"Two"];
//        [items addObject:@"Three"];
//
//        [items insertObject:@"Zero" atIndex:0];
//
//        for (NSString *item in items) {
//            NSLog(@"%@", item);
//        }
//
//        BNRItem *item = [[BNRItem alloc] initWithItemName:@"Red Sofa"
//                                           valueInDollars:100
//                                             serialNumber:@"A1B2C"];
//        BNRItem *itemWithName = [[BNRItem alloc] initWithItemName:@"Blue Sofa"];
//        BNRItem *itemWithNoName = [[BNRItem alloc] init];
//
//        NSLog(@"%@", item);
//        NSLog(@"%@", itemWithName);
//        NSLog(@"%@", itemWithNoName);
        
//        for (int i = 0; i < 10; i++) {
//            BNRItem *item = [BNRItem randomItem];
//            [items addObject:item];
//        }
        
        BNRItem *backpack = [[BNRItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        [backpack setContainedItem:calculator];
        
        backpack = nil;
        calculator = nil;
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil...");
        items = nil;
    }
    return 0;
}
