//
//  XBRequest.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/8.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBRequest.h"
#import "XBDataParse.h"
#import "XBUserDataManger.h"
@interface XBRequest()<XBDataParseDeleagte>
@property (nonatomic, strong)QMUITips *errerToastView;
@property (nonatomic, strong)XBDataParse *dataParse;
@property (nonatomic, strong)QMUIToastView *toastView;
@end

@implementation XBRequest
- (instancetype)init{
    self = [super init];
    if (self) {
        self.dataParse = [[XBDataParse alloc]init];
        self.dataParse.delegate = self;
    }
    return self;
}

-(YTKResponseSerializerType)responseSerializerType{
    return  YTKResponseSerializerTypeJSON;
}

- (id)requestArgument {
    return self.parameter;
}


-(NSTimeInterval)requestTimeoutInterval{
    
    return 10;
}
- (void)xb_startRequest{

    if (self.isLoadingAnimate) {
        [self.toastView showAnimated:YES];
    }
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@ --%@\n%@",request.requestUrl,request.requestArgument, request.responseJSONObject);
        if (self.isLoadingAnimate) {
            [self.toastView hideAnimated:NO];
        }
        [self.dataParse xb_checkResponse:self.responseJSONObject];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        if (self.isLoadingAnimate) {
            [self.toastView hideAnimated:NO];
        }
        [self showTips:@"网络异常"];
    }];
}

- (void)xb_dateParseSuccess:(id)responseDic{
    if ([self.xb_Requestdelegate respondsToSelector:@selector(xb_request:successResponse:)]) {
        [self.xb_Requestdelegate xb_request:self successResponse:responseDic];
    }
}

- (void)xb_dataPareseFail:(NSString *)message{
    [self showTips:message];
    if ([self.xb_Requestdelegate respondsToSelector:@selector(xb_request:requestFailed:)]) {
        [self.xb_Requestdelegate xb_request:self requestFailed:message];
    }
}

-(void)showTips:(NSString *)tips{
    if (self.iSShowErrorTip) {
        [self.errerToastView showError:tips hideAfterDelay:1];
    }
}

- (QMUITips *)errerToastView{
    if (!_errerToastView) {
        _errerToastView =  [QMUITips createTipsToView:THEAPP.window];
        QMUIToastBackgroundView *backView = _errerToastView.backgroundView;
//        backView.styleColor = [UIColor whiteColor];
        QMUIToastContentView *contentView = _errerToastView.contentView;
        contentView.tintColor = [UIColor whiteColor];
    }
    return _errerToastView;
    
}


- (QMUIToastView *)toastView{
    if (!_toastView) {
        _toastView = [[QMUIToastView alloc]initWithView:THEAPP.window];
        _toastView.toastPosition =  QMUIToastViewPositionCenter;
        _toastView.contentView = [self animationView];
        QMUIToastBackgroundView *backView = _toastView.backgroundView;
        backView.styleColor = [UIColor whiteColor];
        [THEAPP.window addSubview:_toastView];
    }
    return _toastView;
}


- (UIView *)animationView {
      UIImage * loadingImage = [UIImage qmui_animatedImageWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"loading"ofType:@"gif"]] scale:0];
    UIView *animationView = [[UIImageView alloc] initWithImage:loadingImage];
    return animationView;
}

@end
