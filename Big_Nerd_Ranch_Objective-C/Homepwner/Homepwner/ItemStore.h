//
//  ItemStore.h
//  Homepwner
//
//  Created by USER on 2017. 12. 21..
//  Copyright © 2017년 USER. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface ItemStore : NSObject

#pragma mark - Public Properties

@property (nonatomic, readonly) NSArray *allItems;

#pragma mark - Singleton Methods

+ (instancetype)sharedStore;

#pragma mark - Public Methods

- (Item *)createItem;
- (void)removeItem:(Item *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;

@end
