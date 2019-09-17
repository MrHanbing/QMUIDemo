//
//  XBNetWorkConfig.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/8.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBNetWorkConfig : NSObject

+(void)xb_configNetWork;
+(void)xb_configNetWork:(NSString *)baseUrl;

@end

NS_ASSUME_NONNULL_END
