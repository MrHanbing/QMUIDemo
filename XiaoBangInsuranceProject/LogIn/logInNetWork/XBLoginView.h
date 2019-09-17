//
//  XBLoginView.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/3.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XBLoginView;
@protocol XBLoginViewDelegate <NSObject>

-(void)xb_LoginView:(XBLoginView *)view selectWeiXinLogINAction:(UIButton *)target;
-(void)xb_LoginView:(XBLoginView *)view selectLogINAction:(UIButton *)target;
-(void)xb_LoginView:(XBLoginView *)view selectGetCodeAction:(UIButton *)target;
-(void)xb_LoginView:(XBLoginView *)view selectUserProtocolAction:(UIButton *)target;
@end

NS_ASSUME_NONNULL_BEGIN

@interface XBLoginView : UIView

+(instancetype)initWithXib;


@property(nonatomic, copy) NSString *phone;
@property(nonatomic, copy) NSString *code;

-(void)xb_startChangeTimerInCodeBtn;

-(void)nextRegisterResponse;

@property(nonatomic, weak) id<XBLoginViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
