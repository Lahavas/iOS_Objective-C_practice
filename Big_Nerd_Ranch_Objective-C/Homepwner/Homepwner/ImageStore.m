//
//  ImageStore.m
//  Homepwner
//
//  Created by USER on 2017. 12. 22..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "ImageStore.h"

@interface ImageStore ()

#pragma mark - Private Properties

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@implementation ImageStore

#pragma mark - Singleton method

+ (instancetype)sharedStore {
    static ImageStore *sharedStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[ImageStore alloc] initPrivate];
    });
    return sharedStore;
}

#pragma mark - Initialization

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[ImageStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate {
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

#pragma mark - Key-Value Coding Methods

- (void)setImage:(UIImage *)image forKey:(NSString *)key {
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key {
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    
    [self.dictionary removeObjectForKey:key];
}

@end
