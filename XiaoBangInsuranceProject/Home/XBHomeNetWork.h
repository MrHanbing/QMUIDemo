//
//  XBHomeNetWork.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBHomeNetWork : NSObject

@property(nonatomic, copy) dispatch_block_t  requestSucessBlock;
@property(nonatomic, copy) NSArray *tagItems;
@property(nonatomic, copy) NSArray *articleList;
-(void)chainRequest;

@end

NS_ASSUME_NONNULL_END
