//
//  XBMineHeader.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/22.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBAnimationView.h"
NS_ASSUME_NONNULL_BEGIN

@interface XBMineHeader : XBAnimationView
+(instancetype)initWithXib;

@property(nonatomic, copy) NSString *userName;
@end

NS_ASSUME_NONNULL_END
