//
//  XBBaseWebViewController.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/5.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBBaseViewController.h"
#import <WebKit/WebKit.h>
#import "XBWebView.h"
NS_ASSUME_NONNULL_BEGIN

@interface XBBaseWebViewController : XBBaseViewController
- (instancetype)initWithURLString:(NSString *)urlString;
- (void)xb_webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler;

@property (nonatomic, strong) XBWebView *webView;
@property (nonatomic, strong)NSURLRequest *request;
-(void)xb_setNavTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
