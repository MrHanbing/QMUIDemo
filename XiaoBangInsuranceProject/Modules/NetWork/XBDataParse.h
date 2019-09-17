//
//  XBDataParse.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/9.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XBDataParseDeleagte <NSObject>

- (void)xb_dateParseSuccess:(id)responseDic;

- (void)xb_dataPareseFail:(NSString *)message;

@end


@interface XBDataParse : NSObject


@property (nonatomic, weak)id<XBDataParseDeleagte> delegate;

///检验ResponseJSONObject
- (void)xb_checkResponse:(id)responseJSONObject;


@end

NS_ASSUME_NONNULL_END
