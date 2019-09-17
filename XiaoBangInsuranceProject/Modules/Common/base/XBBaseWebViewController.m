//
//  XBBaseWebViewController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/5.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBBaseWebViewController.h"
#import "XBUserDataManger.h"
#import "XBWebView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "WKWebView+XBLocalStorage.h"
#import "XBWebView_MessageHandler.h"
#import "XBWebView_UIDelegate.h"
#import <BlocksKit/UIAlertView+BlocksKit.h>

@interface XBBaseWebViewController ()<WKNavigationDelegate>


@property (nonatomic, strong)XBWebView_UIDelegate *uiDelegate;
@property (nonatomic, strong)XBWebView_MessageHandler *mesageHandler;
@property (nonatomic, copy)UIBarButtonItem *leftBack;
@property (nonatomic, strong)WKNavigation *backNavigation;
@property(nonatomic, assign) BOOL isError;
@property(nonatomic, assign) BOOL isRefresh;
@property (nonatomic, strong)UIView *bgView;
@end

@implementation XBBaseWebViewController
- (instancetype)initWithURLString:(NSString *)urlString {
    return [self initWithURL:[NSURL URLWithString:urlString]];
}

- (instancetype)initWithURL:(NSURL *)URL {
    return [self initWithURLRequest:[NSURLRequest requestWithURL:URL]];
}

- (instancetype)initWithURLRequest:(NSURLRequest *)request {
    
    if (self = [self init]) {
        _request = request;
        [self initData];
    }
    return self;
}
-(void)initData{
      [self.webView xb_webViewRegiterMessageHandler:self.mesageHandler];
}


- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.isError = NO;
    self.isRefresh = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    @weakify(self);
    [RACObserve(self, webView.estimatedProgress)subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        if (self.isRefresh) {
            return;
        }
        NSLog(@"self, webView.estimatedProgress  %lf",[x floatValue]);
        NSLog(@"self, webView.estimatedProgress  %lf",[x floatValue]);
        if ([x floatValue] == 1 && self.isError == NO ) {
            if (self.isEmptyViewShowing) {
                [self hideEmptyView];
            }
        }else{
            if (!self.isEmptyViewShowing) {
               [self showEmptyViewWithImage:self.loadingImage text:@"加载中..." detailText:nil buttonTitle:nil buttonAction:nil];
            }
        }
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xb_reload) name:@"XB_LOGIN_ACTION_NOTIFICATION" object:nil];
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xb_LogOut) name:@"XB_LOGOUT_ACTION_NOTIFICATION" object:nil];
    
    self.mesageHandler.messageHandlerBlock = ^(NSString * _Nonnull title) {
          @strongify(self);
        [self xb_setNavTitle:title];
    };
    self.mesageHandler.jsBridgeLogoutBlock = ^{
              @strongify(self);
             [self alertAction];
    };
}

-(void)alertAction{
    @weakify(self)
    [UIAlertView bk_showAlertViewWithTitle:@"提示" message:@"确认退出登录吗？" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确认"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        @strongify(self);
        if (buttonIndex == 1) {
            
            [self.webView evaluateJavaScript:@"jsbridgeLogout()" completionHandler:^(id _Nullable item, NSError * _Nullable error) {
                                if (error) {
                                    [QMUITips showError:@"退出失败"];
                                    return ;
                                }
                                 [[XBUserDataManger defultManger]deleteToken];
            }];
        }
    }];
}

///子类重写
-(void)xb_setNavTitle:(NSString *)title{
    
}

-(void)xb_LogOut{
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:NO];
    }
    [self.tabBarController setSelectedIndex:0];
    [self xb_reload];
}
-(void)xb_reload{
   @ weakify(self);
    [self.webView evaluateJavaScript:@"document.body.innerHTML='';" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        @strongify(self);
        [self.webView xb_loadRequest:[self.request copy]];
    }];
  

}
#pragma mark - WKNavigationActionDele
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:navigationAction.request.URL.absoluteString];
    
    if ([[NSPredicate predicateWithFormat:@"SELF BEGINSWITH[cd] 'https://itunes.apple.com/'"] evaluateWithObject:components.URL.absoluteString]) {
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }else if ([[NSPredicate predicateWithFormat:@"SELF BEGINSWITH[cd] 'mailto:' OR SELF BEGINSWITH[cd] 'tel:' OR SELF BEGINSWITH[cd] 'telprompt:'"] evaluateWithObject:components.URL.absoluteString]) {
        if ([[UIApplication sharedApplication] canOpenURL:components.URL]) {
            if (@available(iOS 10.0, *)) {
                [UIApplication.sharedApplication openURL:components.URL options:@{} completionHandler:NULL];
            } else {
                [[UIApplication sharedApplication] openURL:components.URL];
            }
        }
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    } else{
        
        [self xb_webView:webView decidePolicyForNavigationAction:navigationAction decisionHandler:decisionHandler];
    }
}

- (void)xb_webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
}
//接收到相应数据后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    if (self.isEmptyViewShowing) {
        [self hideEmptyView];
    }
    if ([navigationResponse.response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *httpUrlResponse =(NSHTTPURLResponse *) navigationResponse.response;
        if (httpUrlResponse.statusCode != 200) {
            self.isError = YES;
            if (self.isEmptyViewShowing == YES) {
                [self hideEmptyView];
            }
            @weakify(self);
            [self.webView evaluateJavaScript:@"document.body.innerHTML='';" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
                @strongify(self);
                [self showEmptyViewWithImage:UIImageMake(@"empty_image") text:[NSHTTPURLResponse localizedStringForStatusCode:httpUrlResponse.statusCode] detailText:@"请点击重新加载试试~" buttonTitle:@"重新加载" buttonAction:@selector(xb_reload)];
            }];
            decisionHandler(WKNavigationResponsePolicyCancel);
            return;
        }else{
            if (self.isEmptyViewShowing) {
                [self hideEmptyView];
            }
        }
    }
    decisionHandler(WKNavigationResponsePolicyAllow);
}
//页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
}
// 主机地址被重定向时调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    self.isError = YES;
    if (self.isEmptyViewShowing == YES) {
        [self hideEmptyView];
    }
    @weakify(self);
    [self.webView evaluateJavaScript:@"document.body.innerHTML='';" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        @strongify(self);
      [self showEmptyViewWithImage:UIImageMake(@"empty_image") text:@"加载失败" detailText:@"请点击重新加载试试~" buttonTitle:@"重新加载" buttonAction:@selector(xb_reload)];
    }];

}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
}
// 页面加载完毕时调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    
    self.isRefresh = YES;
}
//跳转失败时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    
}

- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
    
    [webView reload];
}


#pragma mark - Get && Set

- (XBWebView *)webView{
    if (!_webView) {
        _webView = [[XBWebView alloc]init];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (@available(iOS 11.0, *)) {
                make.top.equalTo (self.view.mas_safeAreaLayoutGuideTop);
            } else {
                make.top.equalTo (self.view.mas_top);
            }
            if (@available(iOS 11.0, *)) {
                make.left.equalTo (self.view.mas_safeAreaLayoutGuideLeft);
            } else {
                make.left.equalTo (self.view.mas_left);
            }
            if (@available(iOS 11.0, *)) {
                make.right.equalTo (self.view.mas_safeAreaLayoutGuideRight);
            } else {
                make.right.equalTo (self.view.mas_right);
            }
            if (@available(iOS 11.0, *)) {
                make.bottom.equalTo (self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.equalTo (self.view.mas_bottom);
            }
        }];
      
        _webView.navigationDelegate = self;
        _webView.UIDelegate =self.uiDelegate;
//
    }
    return _webView;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}


-(XBWebView_MessageHandler *)mesageHandler{
    if (!_mesageHandler) {
        _mesageHandler = [[XBWebView_MessageHandler alloc]init];
        _mesageHandler.ctr = self;
    }
    return _mesageHandler;
}

- (XBWebView_UIDelegate *)uiDelegate{
    if (!_uiDelegate) {
        _uiDelegate = [[XBWebView_UIDelegate alloc]init];
        _uiDelegate.ctr = self;
    }
    return _uiDelegate;
}
@end
