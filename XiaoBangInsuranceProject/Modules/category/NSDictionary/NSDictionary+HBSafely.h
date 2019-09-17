//
//  NSDictionary+HBSafely.h
//  HBActionSheet
//
//  Created by 韩冰 on 2017/10/25.
//  Copyright © 2017年 韩冰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HBSafely)

/**
 判断value是否为空

 @param value 参数
 @return BOOL
 */
- (BOOL)isNull:(id)value;

/**
 objectForKey 安全方法

 @param aKey key
 @return Object
 */
- (id)objectForKeySafely:(id)aKey;

/**
 valueForKey 安全方法

 @param key key
 @return value
 */
- (id)valueForKeySafely:(NSString *)key;

/**
 valueForKeyPath 安全方法

 @param keyPath path
 @return id
 */
- (id)valueForKeyPathSafely:(NSString *)keyPath;

@end

@interface NSMutableDictionary (Safely)

/**
 防空值

 @param anObject value
 @param aKey key
 */
- (void)setObjectSafely:(id)anObject forKey:(id<NSCopying>)aKey;


/**
 防空值

 @param value value
 @param key key
 */
- (void)setValueSafely:(id)value forKey:(NSString *)key;

@end
