//
//  XBCommon_H5Address.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/20.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifdef DEBUG
//Debug状态下的测试API
#define API_BASE_URL_STRING     @"https:insurance-qa.xiaobangbaoxian.com"

#else
//Release状态下的线上API
#define API_BASE_URL_STRING     @"https:insurance.xiaobangbaoxian.com"

#endif


#define XBURL_H5Make(str) [NSString stringWithFormat:@"%@/%@",API_BASE_URL_STRING,str]


NS_ASSUME_NONNULL_BEGIN

///首页
extern NSString *const XB_Tab_Home_H5Address;
///课堂
extern NSString *const XB_Tab_ClassRoom_H5Address;
///保障
extern NSString *const XB_Tab_Insurance_H5Address;

///我的
extern NSString *const XB_Tab_Mine_H5Address;
///咨询
extern NSString *const XB_Consult_H5Address;

NS_ASSUME_NONNULL_END
