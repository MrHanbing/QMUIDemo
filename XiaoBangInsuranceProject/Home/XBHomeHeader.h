//
//  XBHomeHeader.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/30.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class XBHomeHeader;
@protocol XBHomeHeaderDelegate <NSObject>
-(void)xb_homeHeader:(XBHomeHeader *)header selectSearchTarget:(id)target;
-(void)xb_homeHeader:(XBHomeHeader *)header selectServiceTarget:(id)target;
@end

@interface XBHomeHeader : UIView
@property(nonatomic, weak) id <XBHomeHeaderDelegate> delegate;
@property(nonatomic, copy) NSString *userName;
+(instancetype)initWithXib;

@end

NS_ASSUME_NONNULL_END
