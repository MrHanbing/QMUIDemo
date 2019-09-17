//
//  WKWebView+XBLocalStorage.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/20.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "WKWebView+XBLocalStorage.h"

@implementation WKWebView (XBLocalStorage)

- (void)writeLocalStorage:(NSString *)token completion:(dispatch_block_t)completion{
    NSString * js = [NSString stringWithFormat:@"window.localStorage.setItem('%@','%@')",@"x-request-token",token];
    WKUserScript * userScript = [[WKUserScript alloc]initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES];
    [self.configuration.userContentController addUserScript:userScript];
    completion();
}
- (void)xb_webViewRegiterMessageHandler:(id<WKScriptMessageHandler>)delegate{
    [self.configuration.userContentController addScriptMessageHandler:delegate name:@"login"];
    [self.configuration.userContentController addScriptMessageHandler:delegate name:@"logout"];
    [self.configuration.userContentController addScriptMessageHandler:delegate name:@"title"];
        [self.configuration.userContentController addScriptMessageHandler:delegate name:@"customerService"];
}

- (void)xb_webViewWriteCookie:(NSArray<NSHTTPCookie *> *)cookies completion:(dispatch_block_t)completion{
    if (cookies.count == 0) {
        completion();
        return;
    }
    if (@available(iOS 11.0, *)) {
        WKHTTPCookieStore *cookieStore = self.configuration.websiteDataStore.httpCookieStore;
        //添加新的cookie
        [cookies enumerateObjectsUsingBlock:^(NSHTTPCookie * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [cookieStore setCookie:obj completionHandler:^{
                if (idx == cookies.count - 1) {
                    completion();
                }
            }];
        }];
    }else{
        [cookies enumerateObjectsUsingBlock:^(NSHTTPCookie * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:obj];
        }];
        [self reload];
        completion();
    }
}



@end
