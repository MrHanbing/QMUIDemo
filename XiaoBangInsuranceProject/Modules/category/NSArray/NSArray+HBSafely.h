//
//  NSArray+HBSafely.h
//  HBActionSheet
//
//  Created by 韩冰 on 2017/10/23.
//  Copyright © 2017年 韩冰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HBSafely)


/**
  飞空判断
 */
@property(nonatomic, readonly, getter = isEmpty) BOOL empty;

/**
     将数组转化为字符串
 */
@property (readonly) NSString *stringValue;



/**
 objectAtIndex 安全方法

 @param index  下标
 @return ID
 */
- (id)objectAtIndexSafely:(NSUInteger)index;

@end

@interface NSMutableArray (Safely)


/**
 addObject 安全方法 如果为nil 就添加占位NULL

 @param object ID
 */
- (void)addNullableObject:(id)object;

/**
 NSSet 转 NSMutableArray

 @param set NSSet
 @return NSMutableArray
 */
+ (NSMutableArray*)arrayWithSet:(NSSet*)set;

/**
 防值重值

 @param object id
 */
- (void)addObjectIfAbsent:(id)object;

/**
 removeObjectAtIndex 安全方法

 @param index 下标
 */
- (void)removeObjectAtIndexSafely:(NSUInteger)index;

/**
 self removeObjectAtIndex:0

 @return NSMutableArray
 */
- (NSMutableArray *)removeFirstObject;

/**
 数组元素倒置 【0，1，2】 = 【2，1，0】；

 @return NSMutableArray
 */
- (NSMutableArray *)reverse;

/**
 addObject 安全

 @param object ID
 */
- (void)addObjectSafely:(id)object;

/**
  添加一个空元素
 */
- (void)addNilObjectSafely;

/**
 insertObject:object atIndex:index] 安全

 @param object ID
 @param index 下标
 */
- (void)insertObjectSafely:(id)object atIndex:(NSUInteger)index;

/**
 removeObject 安全

 @param object ID
 */
- (void)removeObjectSafely:(id)object;

/**
 //如果对象为空自动添加为空格

 @param object nil
 */
- (void)addObjectNullSafely:(id)object;
@end
