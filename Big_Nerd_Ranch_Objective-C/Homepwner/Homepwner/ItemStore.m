//
//  ItemStore.m
//  Homepwner
//
//  Created by USER on 2017. 12. 21..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "ItemStore.h"
#import "Item.h"
#import "ImageStore.h"

@interface ItemStore ()

#pragma mark - Private Properties

@property (strong, nonatomic) NSMutableArray *privateItems;

@end

@implementation ItemStore

#pragma mark - Singleton Method

+ (instancetype)sharedStore {
    static ItemStore *sharedStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    return sharedStore;
}

#pragma mark - Initialization

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[ItemStore sharedStore]"
                                 userInfo:nil];
    
    return nil;
}

- (instancetype)initPrivate {
    self = [super init];
    
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

#pragma mark - Accessor Methods

- (NSArray *)allItems {
    return [self.privateItems copy];
}

#pragma mark - Public Methods

- (Item *)createItem {
    Item *item = [Item randomItem];
    
    [self.privateItems addObject:item];
    
    return item;
}

- (void)removeItem:(Item *)item {
    NSString *key = item.itemKey;
    [[ImageStore sharedStore] deleteImageForKey:key];
    
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if (fromIndex == toIndex) {
        return;
    }
    
    Item *item = self.privateItems[fromIndex];
    
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    [self.privateItems insertObject:item
                            atIndex:toIndex];
}

@end
