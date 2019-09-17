//
//  WKWebView+XBLocalStorage.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/20.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (XBLocalStorage)

/**
 
 注册LocalStrorange
 
 */
- (void)writeLocalStorage:(NSString *)token completion:(dispatch_block_t)completion;


/**
 
 注册Message Handler
 */
- (void)xb_webViewRegiterMessageHandler:(id<WKScriptMessageHandler>)delegate;


/**
 
 注册Cookies
 */

- (void)xb_webViewWriteCookie:(NSArray<NSHTTPCookie *> *)cookies completion:(dispatch_block_t)completion;
@end

NS_ASSUME_NONNULL_END
