//
//  NSDictionary+HBSafely.m
//  HBActionSheet
//
//  Created by 韩冰 on 2017/10/25.
//  Copyright © 2017年 韩冰. All rights reserved.
//

#import "NSDictionary+HBSafely.h"

@implementation NSDictionary (HBSafely)
- (BOOL)isNull:(id)value
{
    if(([NSNull null] == (NSNull *)value) || ([value isKindOfClass:[NSString class]] && [value length] == 0))
    {
        return YES;
    }
    
    return NO;
}

- (id)objectForKeySafely:(id)aKey
{
    if ([self isNull:[self objectForKey:aKey]])
    {
        return nil;
    }
    return [self objectForKey:aKey];
}

- (id)valueForKeySafely:(NSString *)key
{
    if ([self isNull:[self valueForKey:key]])
    {
        return nil;
    }
    return [self valueForKey:key];
}

- (id)valueForKeyPathSafely:(NSString *)keyPath
{
    if ([self isNull:[self valueForKeyPath:keyPath]])
    {
        return nil;
    }
    return [self valueForKeyPath:keyPath];
}

@end
@implementation NSMutableDictionary (Safely)

- (void)setObjectSafely:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject && aKey)
    {
        [self setObject:anObject forKey:aKey];
    }
    else
    {
        
    }
}

- (void)setValueSafely:(id)value forKey:(NSString *)key
{
    if (key)
    {
        [self setValue:value forKey:key];
    }
    else
    {
        
    }
}

@end
