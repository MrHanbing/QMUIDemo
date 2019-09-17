//
//  XBRequest.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/8.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XBBaseRequestProtol <NSObject>

-(void)xb_request:(id)request  successResponse:(id)responseData;

-(void)xb_request:(id)request  requestFailed:(NSString *)message;

@end

@interface XBRequest : YTKRequest


@property (nonatomic, strong)NSDictionary *parameter;

///是否显示加载动画
@property (nonatomic, assign)BOOL isLoadingAnimate;

//是否显示错误提示
@property (nonatomic, assign)BOOL iSShowErrorTip;


////是否请求需要Token
@property (nonatomic, assign)BOOL isHasToken;

@property (nonatomic, weak)id <XBBaseRequestProtol> xb_Requestdelegate;

- (void)xb_startRequest;


@end

NS_ASSUME_NONNULL_END
