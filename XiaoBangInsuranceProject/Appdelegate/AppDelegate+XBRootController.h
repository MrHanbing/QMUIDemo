//
//  AppDelegate+XBRootController.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/18.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN



@interface AppDelegate (XBRootController)

-(void)xb_appdelegateConfigurationRootController;

-(void)xb_cutAppdelegateRootController;

- (void)xb_cutNativeOrWeb:(BOOL)isWeb;


@end

NS_ASSUME_NONNULL_END
