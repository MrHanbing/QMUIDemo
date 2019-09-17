//
//  XBTabBarViewController.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/8.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <QMUIKit/QMUIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBTabBarViewController : QMUITabBarViewController

-(void)xb_createTabBarCtrConfigerChildsCtr:(NSArray *)childs withTitles:(NSArray *)titles withDefultIcon:(NSArray *)defultIcons withSelectIcons:(NSArray *)selectIcons;

@end

NS_ASSUME_NONNULL_END
