//
//  XBLogInViewController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/16.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBLogInViewController.h"
#import "XBLoginView.h"

#import "XBLoginNetWork.h"
#import <WXApi.h>
#import "XBWeiXinManager.h"
#import "XBNewPushWebViewController.h"

@interface XBLogInViewController ()<XBLoginViewDelegate>

@property (nonatomic, strong)XBLoginNetWork *netWork;
@property (nonatomic, strong)XBLoginView *logInView;

@end

@implementation XBLogInViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.scrollView.scrollEnabled = NO;
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
         make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
         make.right.equalTo(self.view.mas_right);
    }];
    [self.scrollView addSubview:self.logInView];
    [self.logInView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.mas_top);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_offset(SCREEN_HEIGHT - SafeAreaTopHeight);
        make.centerX.equalTo(self.scrollView.mas_centerX);
    }];
    @weakify(self);
    self.netWork.successGetCodeBlock = ^{
        @strongify(self);
        [self.logInView xb_startChangeTimerInCodeBtn];
        [QMUITips showSucceed:@"验证码获取成功"];
        [self.logInView nextRegisterResponse];
    };
    self.netWork.successLogInBlock = ^{
         @strongify(self);
         [self close];
        
    };
      self.logInView.delegate = self;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem qmui_itemWithImage:UIImageMake(@"nav_back") target:self action:@selector(close)];

}
-(void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)_getPhoneCode{
    if (self.logInView.phone.length < 11 ) {
        [QMUITips showInfo:@"请输入手机号"];
        return;
    }
    
    [self.netWork xbLogInNetWork_getPhoneCode:self.logInView.phone];
}


-(void)_logInAction{
    [self.netWork xbLogInNetWork_logIn:self.logInView.phone
                             phoneCode:self.logInView.code];
    
}

-(XBLoginNetWork *)netWork{
    if (!_netWork) {
        _netWork = [[XBLoginNetWork alloc]init];
    }
    return _netWork;
}
-(XBLoginView *)logInView{
    if (!_logInView) {
        _logInView = [XBLoginView initWithXib];
      
    }
    return _logInView;
}

-(void)xb_LoginView:(XBLoginView *)view selectWeiXinLogINAction:(UIButton *)target{
    @weakify(self);
    [[XBWeiXinManager sharedManager]xb_authLogin:self successBlock:^{
        @strongify(self);
        [self close];
    }];
}
-(void)xb_LoginView:(XBLoginView *)view selectLogINAction:(UIButton *)target{

   [self _logInAction];
}
-(void)xb_LoginView:(XBLoginView *)view selectGetCodeAction:(UIButton *)target{

    [self _getPhoneCode];
}
-(void)xb_LoginView:(XBLoginView *)view selectUserProtocolAction:(UIButton *)target
{
    XBNewPushWebViewController *web = [[XBNewPushWebViewController alloc]initWithURLString:@"https://static.xiaobangtouzi.com/insurance/service_terms.pdf"];
    web.title = @"用户协议";
    [self.navigationController pushViewController:web animated:YES];
    //        [[NSNotificationCenter defaultCenter]postNotificationName:@"XB_LOGOUT_ACTION_NOTIFICATION" object:nil];";
}

@end
