//
//  XBNewWebViewController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/19.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBNewWebViewController.h"
#import <WebKit/WebKit.h>
#import "XBUserDataManger.h"
#import "XBWebView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "XBNewPushWebViewController.h"
#import "WKWebView+XBLocalStorage.h"
#import "XBWebView_MessageHandler.h"
#import "XBWebView_UIDelegate.h"
@interface XBNewWebViewController ()


@end

@implementation XBNewWebViewController

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
    if (url1 && ![url1.path  isEqualToString: url.path]) {
        XBNewPushWebViewController *ctr =  [[XBNewPushWebViewController alloc]initWithURLString:navigationAction.request.URL.absoluteString];
       
        if (self.tabBarController.selectedIndex == 2) {
            @weakify(self);
            [self.navigationController qmui_pushViewController:ctr animated:YES completion:^{
                @strongify(self);
                [self.webView Xb_reload];
            }];
        }else{
             [self.navigationController pushViewController:ctr animated:YES];
        }
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
    
    return YES;
}
- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable{
    return YES;
}
- (BOOL)forceEnableInteractivePopGestureRecognizer{
    return NO;
}
@end
