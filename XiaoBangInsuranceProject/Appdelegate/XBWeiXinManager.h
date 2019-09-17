//
//  XBWeiXinManager.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/4.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <WechatOpenSDK/WXApi.h>

@interface XBWeiXinManager : NSObject<WXApiDelegate>
+ (XBWeiXinManager *)sharedManager;
-(void)xb_authLogin:(UIViewController *)ctr successBlock:(dispatch_block_t)block;
-(void)xb_miniProgram;
@end
