//
//  XBWebView_UIDelegate.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/30.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface XBWebView_UIDelegate : NSObject<WKUIDelegate>
@property(nonatomic, weak)UIViewController *ctr;
@end

NS_ASSUME_NONNULL_END
