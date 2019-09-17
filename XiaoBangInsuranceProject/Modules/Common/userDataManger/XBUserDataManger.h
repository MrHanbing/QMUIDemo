//
//  XBUserDataManger.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/16.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYKit/YYKeychain.h>
NS_ASSUME_NONNULL_BEGIN


@interface XBUserDataManger : NSObject

@property(nonatomic, copy) dispatch_block_t logInBlock;
+ (instancetype)defultManger;


///存储账号
- (BOOL)saveAccount:(NSString *)phoneNum;

///存储Token
- (BOOL)saveToken:(NSString *)token;

///判断是否登录
- (BOOL)isLogIn;

///获取Token
- (NSString *)accessToken;

//获取手机号
- (NSString *)accessPhone;

//删除token
- (BOOL)deleteToken;

///save USerInfo
- (void)saveUserInfo:(NSDictionary *)userInfo;

-(NSString *)accessUserName;

-(BOOL)isAppStoreReview;

-(void)saveAppStoreReview:(BOOL)isAppReview;
@end

NS_ASSUME_NONNULL_END
