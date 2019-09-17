//
//  XBHomeControllerManage.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/31.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBHomeControllerManage.h"
#import "XBUserDataManger.h"
#import "XBWebViewController.h"
@interface XBHomeControllerManage ()
@property(nonatomic, weak) UIViewController *viewController;
@end

@implementation XBHomeControllerManage
-(instancetype)initWithController:(UIViewController *)ctr{
    self =  [super init];
    if (self) {
        _viewController = ctr;
    }
    return self;
}

#pragma mark - XBHomeHeaderDelegate
-(void)xb_homeHeader:(XBHomeHeader *)header selectSearchTarget:(id)target{
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString: XBURL_H5Make(@"pages/#/analysis")];
    [self.viewController.navigationController pushViewController:web animated:YES];
}
-(void)xb_homeHeader:(XBHomeHeader *)header selectServiceTarget:(id)target{
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:@"https://xiaobang.udesk.cn/im_client/?web_plugin_id=92591&c_cf_open_id=null"];
    [self.viewController.navigationController pushViewController:web animated:YES];
}

#pragma mark - XBInsuranceMangerDelegate
-(void)xb_insuranceMangerCell:(XBInsuranceMangerCell *)cell selectParseInsuranceTarget:(id)target{
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make(@"pages/#/analysis")];
    [self.viewController.navigationController pushViewController:web animated:YES];
}
-(void)xb_insuranceMangerCell:(XBInsuranceMangerCell *)cell selectBuyServersTarget:(id)target{
    
//    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:@"https://xiaobang.udesk.cn/im_client/?web_plugin_id=92591&c_cf_open_id=null"];
//    [self.viewController.navigationController pushViewController:web animated:YES];
}
-(void)xb_insuranceMangerCell:(XBInsuranceMangerCell *)cell selectMangerInsuranceTarget:(id)target{
    if ([[XBUserDataManger defultManger]isLogIn]) {
        XBWebViewController *web = [[XBWebViewController alloc]initWithURLString: XBURL_H5Make(@"pages/#/policys")];
        [self.viewController.navigationController pushViewController:web animated:YES];
    }else{
        [QMUITips showError:@"请登录"];
    }
  
}
-(void)xb_ctrMangagePushArticleDetail:(NSInteger)articleID{
    NSString *url = [NSString stringWithFormat:@"pages/#/article/%ld",articleID];
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make(url)];
    [self.viewController.navigationController pushViewController:web animated:YES];
}

-(void)xb_ctrMangagePushInsuranceDetail:(NSString *)goodsCode{
    NSString *url = [NSString stringWithFormat:@"pages/#/goods/analysis/%@",goodsCode];
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make(url)];
    [self.viewController.navigationController pushViewController:web animated:YES];
}

@end
