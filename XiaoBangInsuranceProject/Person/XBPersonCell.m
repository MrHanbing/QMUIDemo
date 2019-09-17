//
//  XBPersonCell.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/14.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBPersonCell.h"
#import "XBInsuranceBtnItem.h"
#import "XBUserDataManger.h"
#import "AppDelegate.h"
#import "AppDelegate+XBRootController.h"
#import "XBWebViewController.h"
@interface XBPersonCell ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *myInsuranceBgView;

@property (weak, nonatomic) IBOutlet UIView *sessionOneBgView;
@property (weak, nonatomic) IBOutlet UIView *sessionTwoBgView;

@property (weak, nonatomic) IBOutlet UIView *insuranceTipView;
@property (weak, nonatomic) IBOutlet UIView *aboutView;
@property (weak, nonatomic) IBOutlet UIButton *logOutBtn;
@property (weak, nonatomic) IBOutlet UIView *line;

@end


@implementation XBPersonCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"XBPersonCell";
    XBPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:ID bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}

- (void)awakeFromNib {
        [super awakeFromNib];
    self.line.backgroundColor  = QMUICMI.separatorColor;

}

- (void)layoutSubviews{
    [super layoutSubviews];

}
- (IBAction)myManager:(id)sender {
    [QMUITips showInfo:@"暂无顾问"];
}

- (IBAction)myFamily:(id)sender {
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make(@"pages/#/family/index")];//@"https://insurance-qa.xiaobangbaoxian.com/pages/#/family/index"];
    [self.viewController.navigationController pushViewController:web animated:YES];
}

- (IBAction)insuranceList:(id)sender {
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make(@"pages/#/policys")];
    [self.viewController.navigationController pushViewController:web animated:YES];
}


- (IBAction)insuranceTipAction:(id)sender {
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make(@"pages/#/remind")];
    [self.viewController.navigationController pushViewController:web animated:YES];
}

- (IBAction)aboutAction:(id)sender {
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:@"https://www.xiaobangbaoxian.com/about-us"];
    [self.viewController.navigationController pushViewController:web animated:YES];
}
- (IBAction)callUsAction:(id)sender {
    [QMUITips showInfo:@"即将开放该功能"];
    
}
- (IBAction)logOutAction:(id)sender {
    
    AppDelegate *app = (AppDelegate *)THEAPP;
    [[XBUserDataManger defultManger]deleteToken];
    app.isWeb = NO;
    [app xb_appdelegateConfigurationRootController];

}

@end
