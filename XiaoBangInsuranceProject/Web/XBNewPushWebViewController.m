//
//  XBNewPushWebViewController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/4.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBNewPushWebViewController.h"
#import <WebKit/WebKit.h>
#import "XBUserDataManger.h"
#import "XBWebView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "XBWebViewPushViewController.h"
#import "WKWebView+XBLocalStorage.h"
#import "XBWebView_MessageHandler.h"
#import "XBWebView_UIDelegate.h"

@interface XBNewPushWebViewController ()
@property (nonatomic, copy)UIBarButtonItem *leftBack;
@end

@implementation XBNewPushWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.webView xb_loadRequest:self.request];
    self.navigationItem.leftBarButtonItem = self.leftBack;
}

- (void)xb_webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    decisionHandler(WKNavigationActionPolicyAllow);
}
#pragma mark- KVO
- (void)dealloc {
    
    NSLog(@"%s", __func__);
}
-(void)xb_setNavTitle:(NSString *)title{
    self.title = title;
}

/// 是否需要拦截系统返回按钮的事件，只有当这里返回YES的时候，才会询问方法：`canPopViewController`
- (BOOL)shouldHoldBackButtonEvent{
    return YES;
}

/// 是否可以`popViewController`，可以在这个返回里面做一些业务的判断，比如点击返回按钮的时候，如果输入框里面的文本没有满足条件的则可以弹alert并且返回NO
- (BOOL)canPopViewController{
    if (self.webView.canGoBack) {
        [self.webView goBack];
        return NO;
    }else{
        return YES;
    }
}

- (BOOL)preferredNavigationBarHidden{
    
    return NO;
}
- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable{
    return YES;
}
- (BOOL)forceEnableInteractivePopGestureRecognizer{
    
    return  !self.webView.canGoBack;
}



- (UIBarButtonItem *)leftBack {
    
    if (!_leftBack) {
        _leftBack =  [UIBarButtonItem qmui_itemWithImage:UIImageMake(@"nav_back") target:self action:@selector(back)];
        _leftBack.width = 44;
        _leftBack.qmui_badgeBackgroundColor  = [UIColor orangeColor];
    }
    return _leftBack;
}

-(void)back{
    if (self.webView.canGoBack) {
        WKBackForwardListItem *item1 = [self.webView.backForwardList itemAtIndex:-1];
        [self.webView goToBackForwardListItem:item1];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}




@end
