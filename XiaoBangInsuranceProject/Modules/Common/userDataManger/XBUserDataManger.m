//
//  XBUserDataManger.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/16.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBUserDataManger.h"
#import <SSKeychain/SSKeychain.h>
///bundleIdentifier
#define SERVICE_NAME     [[NSBundle mainBundle] bundleIdentifier]
//
#define PASSWORD        @"PASSWORD"
#define ACCESS_TOKEN    @"XB_INSURANCE_ACCESS_TOKEN"
#define ACCOUNT_NAME    @"XB_INSURANCE_ACCOUNT_NAME"

@implementation XBUserDataManger

+ (instancetype)defultManger{
    static dispatch_once_t  onceToken;
    static XBUserDataManger *api;
    dispatch_once(&onceToken, ^{
        api = [[XBUserDataManger alloc]init];
    });
    return api;
}

//1.存储账号
- (BOOL)saveAccount:(NSString *)phoneNum{
    NSError *error = nil;
    NSAssert(phoneNum != nil, @"phoneNum不能为空");
    [SSKeychain setPassword:phoneNum forService:SERVICE_NAME account:ACCOUNT_NAME error:&error];
    if (!error) {
        return YES;
    }
    NSLog(@"存储用户手机号:%@",error);
    return NO;
}

//2.存储密码
- (BOOL)savePassWord:(NSString *)passWord{
    NSError *error = nil;
    NSAssert(passWord != nil, @"密码不能为空");
    
    [SSKeychain setPassword:passWord forService:SERVICE_NAME account:PASSWORD error:&error];
    if (!error) {
        return YES;
    }
    NSLog(@"存储用户手机号:%@",error);
    return NO;
}

//3.存储Token
- (BOOL)saveToken:(NSString *)token{
    NSError *error = nil;
    NSAssert(token != nil, @"token不能为空");
    BOOL isSuccess = [SSKeychain setPassword:token forService:ACCESS_TOKEN account:SERVICE_NAME error:&error];
    NSLog(@"存储token:%@",error);
    if (isSuccess) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"XB_LOGIN_ACTION_NOTIFICATION" object:nil];
    }
    return NO;
}

//11.是否登录
- (BOOL)isLogIn{
    NSError *error = nil;
    NSString *logIn = [SSKeychain passwordForService:ACCESS_TOKEN account:SERVICE_NAME error:&error];
    if (!error) {
        return logIn.length;
    }
    NSLog(@"获取钥匙串token:%@",error);
    return NO;
}

- (NSString *)accessToken{
    NSError *error = nil;
    NSString *token = [SSKeychain passwordForService:ACCESS_TOKEN account:SERVICE_NAME error:&error];
    if (!error) {
        return token;
    }
    NSLog(@"获取tokenError:%@",error);
    return @"";
}

- (NSString *)accessPhone{
    NSError *error = nil;
    NSString *phone = [SSKeychain passwordForService:SERVICE_NAME account:ACCOUNT_NAME error:&error];
    if (!error) {
        return phone;
    }
//    NSMutableDictionary *dic = []
    NSLog(@"获取tokenError:%@",error);
    return @"";
}

- (BOOL)deleteToken{
  [[NSNotificationCenter defaultCenter]postNotificationName:@"XB_LOGOUT_ACTION_NOTIFICATION" object:nil];
    [self removeUserInfo];
    return [SSKeychain deletePasswordForService:ACCESS_TOKEN account:SERVICE_NAME];
}

///save USerInfo
- (void)saveUserInfo:(NSDictionary *)userInfo;{
    [[NSUserDefaults standardUserDefaults] setObject:userInfo forKey:@"user_info"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
-(NSString *)accessUserName{
   NSDictionary *dic =  [[NSUserDefaults standardUserDefaults]objectForKey:@"user_info"];
    NSString *userName =[dic objectForKeySafely:@"nickname"];
    if (userName.length > 0) {
        return userName;
    }
    return @"";
}

-(void)removeUserInfo{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"user_info"];
      [[NSUserDefaults standardUserDefaults]synchronize];
}

-(BOOL)isAppStoreReview{
   BOOL isApp =  [[[NSUserDefaults standardUserDefaults]objectForKey:@"PassAppReView"] boolValue];
    return isApp;
}

-(void)saveAppStoreReview:(BOOL)isAppReview{
    [[NSUserDefaults standardUserDefaults] setObject:@(isAppReview) forKey:@"PassAppReView"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
@end
