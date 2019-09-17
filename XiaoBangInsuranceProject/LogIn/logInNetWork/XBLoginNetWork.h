//
//  XBLoginNetWork.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/18.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface XBLoginNetWork : NSObject


@property (nonatomic, copy)dispatch_block_t successGetCodeBlock;

@property (nonatomic, copy)dispatch_block_t successLogInBlock;

- (void)xbLogInNetWork_getPhoneCode:(NSString *)phone;


- (void)xbLogInNetWork_logIn:(NSString *)phone phoneCode:(NSString *)code;

@end

NS_ASSUME_NONNULL_END
