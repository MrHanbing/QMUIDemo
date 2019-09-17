//
//  XBInsyranceSessionHeader.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/27.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "QMUITableViewHeaderFooterView.h"

NS_ASSUME_NONNULL_BEGIN

@interface XBInsuranceSessionHeader : UIView

+(instancetype)initWithXib;

@property(nonatomic, copy) NSString *title;

@property(nonatomic, assign) BOOL isBigHeader;

@end

NS_ASSUME_NONNULL_END
