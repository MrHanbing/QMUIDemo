//
//  XBWebView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/20.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBWebView.h"
#import "WKWebView+SyncUserAgent.h"
#import "XBUserDataManger.h"
#import "WKWebView+XBLocalStorage.h"



@implementation XBWebView

-(instancetype)init{

    return  [self initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) configuration:[XBWebView _createWebViewConfiguration ]];
}
-(instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration{
    self = [super initWithFrame:frame configuration:configuration];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.allowsBackForwardNavigationGestures = YES;
        if (@available(ios 11.0,*)) {
            self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        NSString *ua = [NSString stringWithFormat:@"xbInsurance/%@ (iOS %@)",app_Version,phoneVersion];
        [self syncCustomUserAgentWithType:CustomUserAgentTypeReplace customUserAgent:ua];      
    }
    return self;
}
+(WKWebViewConfiguration *)_createWebViewConfiguration{
    NSString *css = @"body{-webkit-user-select:none;-webkit-user-drag:none;}";
    NSMutableString *javascript = [NSMutableString string];
    [javascript appendString:@"var style = document.createElement('style');"];
    [javascript appendString:@"style.type = 'text/css';"];
    [javascript appendFormat:@"var cssContent = document.createTextNode('%@');", css];
    [javascript appendString:@"style.appendChild(cssContent);"];
    [javascript appendString:@"document.body.appendChild(style);"];
     WKUserScript *noneSelectScript = [[WKUserScript alloc] initWithSource:javascript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]init];
    WKUserContentController *userController= [[WKUserContentController alloc]init];
    [userController addUserScript:noneSelectScript];
    configuration.userContentController = userController;
    return configuration;
}
-(void)Xb_reload{
     @weakify(self);
    [self writeLocalStorage:[XBUserDataManger defultManger].accessToken completion:^{
        @strongify(self);
        [self reload];
    }];
}

-(void)xb_loadRequest:(NSURLRequest *)request{
    if (request == nil) {
        return;
    }
    @weakify(self);
    [self writeLocalStorage:[XBUserDataManger defultManger].accessToken completion:^{
        @strongify(self);
        [self loadRequest:request];
    }];
}

@end
