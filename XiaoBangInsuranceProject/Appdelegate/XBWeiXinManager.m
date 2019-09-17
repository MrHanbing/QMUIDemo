//
//  XBWeiXinManager.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/4.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBWeiXinManager.h"
#import "XBWeiXinAPi.h"
#import "XBUserDataManger.h"
///82fcc5dd290cc0be7b8d18420897667c
@interface XBWeiXinManager ()<XBBaseRequestProtol>

@property(nonatomic, copy) dispatch_block_t weiXinLogInBlock;
@end

@implementation XBWeiXinManager

+ (XBWeiXinManager *)sharedManager {
    static dispatch_once_t onceToken;
    static XBWeiXinManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[XBWeiXinManager alloc] init];
    });
    return manager;
}

-(void)xb_authLogin:(UIViewController *)ctr successBlock:(dispatch_block_t)block; {
    if([WXApi isWXAppInstalled]){//判断用户是否已安装微信App
        SendAuthReq *req = [[SendAuthReq alloc] init];
        req.state = @"snsapi_userinfo_test";//用于保持请求和回调的状态，授权请求或原样带回
        req.scope = @"snsapi_userinfo";
        req.scope = @"snsapi_userinfo";
        [WXApi sendAuthReq:req viewController:ctr delegate:self];//发起微信授权请求
         self.weiXinLogInBlock = block;
    }else{
        [QMUITips showError:@"暂没有安装微信"];
    }
   
}

-(void)xb_miniProgram{
    
    if([WXApi isWXAppInstalled]){//判断用户是否已安装微信App
        WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
        launchMiniProgramReq.userName = @"gh_d0897c79f5cd";  //拉起的小程序的username
        launchMiniProgramReq.path = @"pages/guide/index";    //拉起小程序页面的可带参路径，不填默认拉起小程序首页，对于小游戏，可以只传入 query 部分，来实现传参效果，如：传入 "?foo=bar"。
        launchMiniProgramReq.miniProgramType = WXMiniProgramTypeRelease;
        [WXApi sendReq:launchMiniProgramReq];
    }else{
        [QMUITips showError:@"暂没有安装微信"];
    }
  
}
/*! @brief 收到一个来自微信的请求，第三方应用程序处理完后调用sendResp向微信发送结果
 *
 * 收到一个来自微信的请求，异步处理完成后必须调用sendResp发送处理结果给微信。
 * 可能收到的请求有GetMessageFromWXReq、ShowMessageFromWXReq等。
 * @param req 具体请求内容，是自动释放的
 */
- (void)onReq:(BaseReq*)req{
    NSLog(@"onReq");
}

//- (BOOL)handleOpenURL:(NSURL *)url{
//
//    //处理回调
//    if([url.host isEqualToString:@"platformId=wechat"] || [url.host isEqualToString:@"oauth"]){//微信WeChat分享回调
//
//        return [WXApi handleOpenURL:url delegate:self];
//    }else{
//
//        return NO;
//    }
//}

- (void)onResp:(BaseResp*)resp{
    if([resp isKindOfClass:[SendAuthResp class]]){//判断是否为授权登录类
        
        SendAuthResp *req = (SendAuthResp *)resp;
        if([req.state isEqualToString:@"snsapi_userinfo_test"]){//微信授权成功
            
            if(req.errCode == 0){
                [self wechatCallBack:req];
            }
        }
        
    }else  if ([resp isKindOfClass:[WXLaunchMiniProgramResp class]])
    {
        WXLaunchMiniProgramResp *rep = (WXLaunchMiniProgramResp *)rep;
        NSString *string = rep.extMsg;
    }
}
-(void)wechatCallBack:(SendAuthResp *)rep{
    XBWeiXinAPi *api = [[XBWeiXinAPi alloc]init];
    api.parameter = @{
                      @"appId":@"wx472b557fd8ffb815",
                      @"code":rep.code
                      };
    
    api.xb_Requestdelegate = self;
    [api xb_startRequest];
}

-(void)xb_request:(id)request  successResponse:(id)responseData{
    NSString * token =  [responseData objectForKey:@"token"];
    [[XBUserDataManger defultManger]saveToken:token];
    if (self.weiXinLogInBlock) {
        self.weiXinLogInBlock();
    }
}

-(void)xb_request:(id)request  requestFailed:(NSString *)message{
    
}
@end
