//
//  XBLoginNetWork.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/18.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBLoginNetWork.h"
#import "XBGetCodeApi.h"
#import "XBLogInApi.h"
#import "XBUserDataManger.h"
#import "AppDelegate+XBRootController.h"
#import "XBUserInfoApi.h"
#import "XBUserInfoModel.h"

@interface XBLoginNetWork ()<XBBaseRequestProtol>

@property (nonatomic, strong)XBGetCodeApi *getCodeApi;
@property (nonatomic, strong)XBLogInApi *logInApi;
@property (nonatomic, strong)XBUserInfoApi *userInfoApi;
@property (nonatomic,strong)NSDictionary *tokenDic;

@end

@implementation XBLoginNetWork


- (instancetype)init{
   self =  [super init];
    if (self) {
        
    }
    return self;
}

-(void)_getCodeAction{
    [self.getCodeApi xb_startRequest];
}

- (void)xbLogInNetWork_getPhoneCode:(NSString *)phone{
    
    self.getCodeApi.parameter = @{
                                  @"phone":phone
                                  };
    [self.getCodeApi xb_startRequest];
}

- (void)xbLogInNetWork_logIn:(NSString *)phone phoneCode:(NSString *)code{
    self.logInApi.parameter = @{
                                @"phone":phone,
                                @"code":code
                                };
    [self.logInApi xb_startRequest];
}




-(XBGetCodeApi *)getCodeApi{
    if (!_getCodeApi) {
        _getCodeApi = [[XBGetCodeApi alloc]init];
        _getCodeApi.xb_Requestdelegate= self;
    }
    return _getCodeApi;
}

-(XBLogInApi *)logInApi{
    if (!_logInApi) {
        _logInApi = [[XBLogInApi alloc]init];
        _logInApi.xb_Requestdelegate= self;
    }
    return _logInApi;
}
-(void)xb_request:(id)request requestFailed:(NSString *)message{
    NSLog(@"");
};

-(void)xb_request:(id)request successResponse:(id)responseData{
    if (request == self.logInApi) {
        NSDictionary *dic = responseData;
        self.userInfoApi.parameter = @{
                                       @"token":[dic objectForKeySafely:@"token"]
                                       };
    [self.userInfoApi xb_startRequest];
        self.tokenDic = dic;
    }else if (request == self.getCodeApi){
        if (self.successGetCodeBlock) {
            self.successGetCodeBlock();
        }
    }else if (request == self.userInfoApi){
        [[XBUserDataManger defultManger]saveAccount:[self.logInApi.parameter objectForKey:@"phone"]];
        [[XBUserDataManger defultManger]saveToken:[self.tokenDic objectForKeySafely:@"token"]];
     NSDictionary *dic = responseData;
        XBUserInfoModel *model = [XBUserInfoModel mj_objectWithKeyValues:[dic objectForKeySafely:@"user_info"]];
        [[XBUserDataManger defultManger]saveUserInfo:model.mj_keyValues];
        if (self.successLogInBlock) {
            self.successLogInBlock();
        }
    }
}

-(XBUserInfoApi *)userInfoApi{
    if (!_userInfoApi) {
        _userInfoApi = [[XBUserInfoApi alloc]init];
        _userInfoApi.xb_Requestdelegate = self;
    }
    return _userInfoApi;
}
@end
