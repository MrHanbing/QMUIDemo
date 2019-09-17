//
//  XBCommunityTagModel.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/29.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XBCommunityTagModel : NSObject
@property(nonatomic, assign) NSInteger createdAt;
@property(nonatomic, assign) NSInteger updatedAt;
@property(nonatomic, assign) NSInteger ID;
@property(nonatomic, assign) NSInteger tagId;
@property(nonatomic, copy) NSString *tagName;
@property(nonatomic, copy) NSString *describes;
@end

