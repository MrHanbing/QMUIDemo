//
//  XBWebViewController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/1.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBWebViewController.h"
#import "XBWebView.h"
#import <WebKit/WebKit.h>
#import "XBUserDataManger.h"
#import "XBWebView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "WKWebView+XBLocalStorage.h"
#import "XBWebView_MessageHandler.h"
#import "XBWebView_UIDelegate.h"
#import <NSURL+QMUI.h>
#import "XBWebViewPushViewController.h"

@interface XBWebViewController ()< WKScriptMessageHandler,WKUIDelegate,WKNavigationDelegate>
//@property (nonatomic, strong) XBWebView *webView;
//@property (nonatomic, strong)NSURLRequest *request;
//@property (nonatomic, strong)XBWebView_UIDelegate *uiDelegate;
//@property (nonatomic, strong)XBWebView_MessageHandler *mesageHandler;
//@property (nonatomic, copy)UIBarButtonItem *leftBack;
@end

@implementation XBWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.webView xb_loadRequest:self.request];
    
}
- (void)xb_webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
        NSURLComponents *components = [[NSURLComponents alloc] initWithString:navigationAction.request.URL.absoluteString];
        NSURLComponents *componentsWeb = [[NSURLComponents alloc] initWithString:webView.URL.absoluteString];
        NSURL *url = [NSURL URLWithString:components.fragment];
        NSURL *url1 = [NSURL URLWithString:componentsWeb.fragment];
        if (url && url1 && ![url1.path  isEqualToString: url.path]) {
             XBWebViewPushViewController *ctr =  [[XBWebViewPushViewController alloc]initWithURLString:navigationAction.request.URL.absoluteString];
             ctr.title = @"小帮保险";
             [self.navigationController pushViewController:ctr animated:YES];
            @weakify(self);
            [self.navigationController qmui_pushViewController:ctr animated:YES completion:^{
                @strongify(self);
                [self.webView xb_loadRequest:self.request];
            }];
            decisionHandler(WKNavigationActionPolicyCancel);
    
            return;
        }else{
            if (navigationAction.sourceFrame == nil) {
                  decisionHandler(WKNavigationActionPolicyAllow);
                return;
            }else{
                  decisionHandler(WKNavigationActionPolicyCancel);
                return;
            }
    
        }
}

- (BOOL)preferredNavigationBarHidden{
    
    return NO;
}
- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable{
    return YES;
}
-(void)xb_setNavTitle:(NSString *)title{
    self.title = title;
}

@end
