//
//  XBLoginView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/3.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBLoginView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "XBUserDataManger.h"

@interface XBLoginView ()
@property (weak, nonatomic) IBOutlet UIView *leftLine;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UIView *phoneLine;
@property (weak, nonatomic) IBOutlet UIView *codeLine;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UILabel *navTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logIn_H;

@property (weak, nonatomic) IBOutlet QMUIButton *otherLogInBtn;
@property (weak, nonatomic) IBOutlet UIView *rightLine;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(nonatomic, assign) NSInteger time;
@property(nonatomic, strong) RACDisposable *dispoable;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;

@end

@implementation XBLoginView
+(instancetype)initWithXib{
    XBLoginView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    [view awakeFromNib];
    return view;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.leftLine.backgroundColor = QMUICMI.separatorColor;
    self.codeLine.backgroundColor = QMUICMI.separatorColor;
    self.phoneLine.backgroundColor = QMUICMI.separatorColor;
    self.phoneTextField.text = [[XBUserDataManger defultManger]accessPhone].length == 11?[[XBUserDataManger defultManger]accessPhone]:@"";
   
    self.rightLine.backgroundColor = QMUICMI.separatorColor;
    self.loginBtn.backgroundColor = QMUICMI.yellowColor;
     self.loginBtn.alpha = 0.5;
    [ self.loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
 
    self.otherLogInBtn.imagePosition =  QMUIButtonImagePositionTop;
    @weakify(self);
    [self.phoneTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        @strongify(self);
        if (x.length == 11) {
            [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            [self.codeBtn setTitleColor:[UIColor colorWithHexString:@"#2C8FFF"] forState:UIControlStateNormal];
        }else{
            [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            [self.codeBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        }
    }];
  [[RACSignal combineLatest:@[self.phoneTextField.rac_textSignal,self.codeTextField.rac_textSignal] reduce:^id (NSString *phone,NSString *pwd){
        return @(phone.length > 0 && pwd.length > 0);
    }] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.loginBtn.enabled = [x boolValue];
        if (self.loginBtn.enabled) {
            self.loginBtn.alpha = 1;
        }else{
            self.loginBtn.alpha = 0.5;
        }
    }];
        
    self.loginBtn.layer.cornerRadius = self.logIn_H.constant/2.0;
    self.loginBtn.layer.masksToBounds = YES;
    
}

-(NSString *)phone{
    return self.phoneTextField.text;
}
-(NSString *)code{
    return self.codeTextField.text;
}

-(void)xb_startChangeTimerInCodeBtn{
     self.time = 60;
    @weakify(self);
    self.dispoable =  [[RACSignal interval:1.0 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
        @strongify(self);
        self.time --;
        NSString * title =  self.time > 0 ? [NSString stringWithFormat:@"%lds", self.time] : @"获取验证码";
        [self.codeBtn setTitle:title forState:UIControlStateNormal | UIControlStateDisabled];
        UIColor *color = self.time > 0 ? [UIColor colorWithHexString:@"#999999"]:[UIColor colorWithHexString:@"#999999"];
        [self.codeBtn setTitleColor:color forState:UIControlStateNormal];
        self.codeBtn.enabled = (self.time==0)? YES : NO;
        if (self.time == 0) {
            [self.dispoable dispose];
        }
    }];
}

- (IBAction)codeAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(xb_LoginView:selectGetCodeAction:)]) {
        [self.delegate xb_LoginView:self selectGetCodeAction:sender];
    }
}

- (IBAction)otherLogInAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(xb_LoginView:selectWeiXinLogINAction:)]) {
        [self.delegate xb_LoginView:self selectWeiXinLogINAction:sender];
    }
}

- (IBAction)logInAction:(id)sender {
    if (!self.selectBtn.selected) {
        [QMUITips showInfo:@"请勾选用户协议"];
        return;
    }
    if ([self.delegate respondsToSelector:@selector(xb_LoginView:selectLogINAction:)]) {
        [self.delegate xb_LoginView:self selectLogINAction:sender];
    }
}
- (IBAction)userProcol:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(xb_LoginView:selectUserProtocolAction:)]) {
        [self.delegate xb_LoginView:self selectUserProtocolAction:sender];
    }
}
- (IBAction)selectAction:(id)sender {
    self.selectBtn.selected = !self.selectBtn.selected;
    
}


-(void)nextRegisterResponse{
    [self.codeTextField becomeFirstResponder];
}

@end
