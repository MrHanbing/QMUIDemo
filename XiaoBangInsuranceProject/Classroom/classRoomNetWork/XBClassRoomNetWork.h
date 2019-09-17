//
//  XBClassRoomNetWork.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/28.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBClassRoomNetWork : NSObject
@property(nonatomic, copy) dispatch_block_t requestBlock;

@property(nonatomic, copy) NSArray *tagList;

@property(nonatomic, strong) NSMutableArray *articleListApiList;

//
//-(NSArray *)getArticleList:(NSInteger)index;

-(void)chainRequest;

//- (void)xb_requestArticleList:(NSInteger)tag;

@end

NS_ASSUME_NONNULL_END
