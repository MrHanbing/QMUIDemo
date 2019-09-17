//
//  XBWebView_MessageHandler.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/20.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBWebView_MessageHandler.h"
#import <WebKit/WebKit.h>
#import <QMUIKit/QMUIKit.h>
#import "XBUserDataManger.h"
#import "AppDelegate+XBRootController.h"
#import "XBLogInViewController.h"
#import "XBNavigationController.h"
#import "XBNewWebViewController.h"
#import <MJExtension/MJExtension.h>
#import "XBWeiXinManager.h"
#import <BlocksKit/UIAlertView+BlocksKit.h>
@interface XBWebView_MessageHandler() <WKScriptMessageHandler>

@end



@implementation XBWebView_MessageHandler


#pragma mark - WKScriptMessageHandler

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {

    if ([message.name caseInsensitiveCompare:@"logout"] == NSOrderedSame) {
        NSLog(@"%@",message.body);
        NSDictionary *dic = [message.body mj_JSONObject];
        NSString *title = [dic objectForKeySafely:@"type"];
        if ([title containsString:@"signout"]||[title containsString:@"退出"]) {
            [self alertLogOut];
        }else{
            [QMUITips showInfo:title];
            [[XBUserDataManger defultManger]deleteToken];
        }
    }else if ([message.name  caseInsensitiveCompare:@"login"] == NSOrderedSame){
        
 
        [[XBUserDataManger defultManger]deleteToken];
        XBLogInViewController *logIn = [[XBLogInViewController alloc]init];
        XBNavigationController *nav = [[XBNavigationController alloc]initWithRootViewController:logIn];
        [self.ctr presentViewController:nav animated:YES completion:nil];
//               [QMUITips showInfo:@"login"];
    }else if ([message.name  caseInsensitiveCompare:@"title"] == NSOrderedSame){
        
        NSDictionary *dic = [message.body mj_JSONObject];
        NSString *title = [dic objectForKeySafely:@"value"];

        if (title.length <=  0) {
            title = @"小帮保险";
        }
        if (self.messageHandlerBlock) {
            self.messageHandlerBlock(title);
        }
    }else if ([message.name  caseInsensitiveCompare:@"customerService"]== NSOrderedSame){
        [[XBWeiXinManager sharedManager]xb_miniProgram];
    }
}
-(void)alertLogOut{
    
    if (self.jsBridgeLogoutBlock) {
        self.jsBridgeLogoutBlock();
    }

}


@end
