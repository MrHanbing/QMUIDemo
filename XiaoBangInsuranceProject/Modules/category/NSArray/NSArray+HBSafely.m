//
//  NSArray+HBSafely.m
//  HBActionSheet
//
//  Created by 韩冰 on 2017/10/23.
//  Copyright © 2017年 韩冰. All rights reserved.
//

#import "NSArray+HBSafely.h"

@implementation NSArray (HBSafely)
- (BOOL)isEmpty
{
    return [self count] == 0 ? YES : NO;
}


- (NSString *)stringValue
{
    return [self componentsJoinedByString:@" "];
}

- (id)objectAtIndexSafely:(NSUInteger)index
{
    if( index >= [self count] )
        return nil;
    
    return [self objectAtIndex:index];
}

@end

@implementation NSMutableArray (Safely)

- (void)addNullableObject:(id)object
{
    if (object == nil)
    {
        [self addObject:[NSNull null]];
    }
    else
    {
        [self addObject:object];
    }
}

+ (NSMutableArray*) arrayWithSet:(NSSet*)set
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[set count]];
    [set enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        [array addObject:obj];
    }];
    return array;
}

- (void)addObjectIfAbsent:(id)object
{
    if (object == nil)
    {
        return;
    }
    
    if ([self containsObject:object])
    {
        return;
    }
    
    [self addObject:object];
}

- (void)removeObjectAtIndexSafely:(NSUInteger)index
{
    if( index >= [self count] )
        return;
    
    [self removeObjectAtIndex:index];
}

- (NSMutableArray *)removeFirstObject
{
    [self removeObjectAtIndex:0];
    return self;
}

- (NSMutableArray *)reverse
{
    for (int i=0; i<(floor([self count]/2.0)); i++)
        [self exchangeObjectAtIndex:i withObjectAtIndex:([self count]-(i+1))];
    return self;
}

- (void)addObjectSafely:(id)object
{
    if (object)
    {
        [self addObject:object];
    }
    else
    {
        
    }
}

- (void)addNilObjectSafely
{
    [self addObject:[NSNull null]];
}

- (void)insertObjectSafely:(id)object atIndex:(NSUInteger)index
{
    if (index > [self count])
    {
        return;
    }
    if (object)
    {
        [self insertObject:object atIndex:index];
    }
    else
    {
        
    }
}

- (void)removeObjectSafely:(id)object
{
    if (object)
    {
        [self removeObject:object];
    }
    else
    {
        
    }
}

- (void)addObjectNullSafely:(id)object
{
    if (object)
    {
        [self addObject:object];
    }
    else
    {
        [self addObject:@" "];
    }
}



@end
