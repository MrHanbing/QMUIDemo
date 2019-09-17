//
//  XBWebView.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/20.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBWebView : WKWebView

-(instancetype)init;

-(void)Xb_reload;

- (void)xb_loadRequest:(NSURLRequest *)request;

@end

NS_ASSUME_NONNULL_END
