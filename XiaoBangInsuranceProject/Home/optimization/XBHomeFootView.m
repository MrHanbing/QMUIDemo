//
//  XBHomeFootView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/4.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBHomeFootView.h"
#import "XBWebViewController.h"
@implementation XBHomeFootView
+(instancetype)initWithXib{
    XBHomeFootView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    [view awakeFromNib];
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.aboutBtn.layer.cornerRadius = 10;
    self.aboutBtn.layer.masksToBounds = YES;
    self.aboutBtn.layer.borderWidth = 0.5;
    self.aboutBtn.layer.borderColor = QMUICMI.separatorColor.CGColor;
    
}
- (IBAction)aboutAction:(id)sender {
    //
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:@"https://www.xiaobangbaoxian.com/about-us"];
    [self.viewController.navigationController pushViewController:web animated:YES];
}
@end
