//
//  ImageStore.h
//  Homepwner
//
//  Created by USER on 2017. 12. 22..
//  Copyright © 2017년 USER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageStore : NSObject

#pragma mark - Singleton Methods

+ (instancetype)sharedStore;

#pragma mark - Public Methods

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
