//
//  XBWebView_MessageHandler.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/20.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^MessageHandlerBlock)(NSString *title);
//typeof  void (^MessageHandlerBlock)(NSString *title);

@interface XBWebView_MessageHandler : NSObject  <WKScriptMessageHandler>

@property(nonatomic, weak)UIViewController *ctr;
@property(nonatomic, copy)dispatch_block_t  jsBridgeLogoutBlock;
@property(nonatomic, copy)MessageHandlerBlock messageHandlerBlock;

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;
@end

NS_ASSUME_NONNULL_END
