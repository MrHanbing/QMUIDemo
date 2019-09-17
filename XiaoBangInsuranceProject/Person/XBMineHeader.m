//
//  XBMineHeader.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/22.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBMineHeader.h"


@interface XBMineHeader ()

@property (weak, nonatomic) IBOutlet UIImageView *userIconView;
@property (weak, nonatomic) IBOutlet UIButton *userLogBtn;
@property (weak, nonatomic) IBOutlet UIButton *tipBtn;


@end

@implementation XBMineHeader
+(instancetype)initWithXib{
    XBMineHeader *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    return view;
}

-(void)setUserName:(NSString *)userName{
    _userName = userName;
    [self.userLogBtn setTitle:_userName forState:UIControlStateNormal];
}


@end
