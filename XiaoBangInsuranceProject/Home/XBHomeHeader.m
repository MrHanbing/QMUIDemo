//
//  XBHomeHeader.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/30.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBHomeHeader.h"
@interface XBHomeHeader()
@property (weak, nonatomic) IBOutlet UIButton *serviceBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleHeaderLabel;

@end

@implementation XBHomeHeader

+(instancetype)initWithXib{
    XBHomeHeader *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    [view awakeFromNib];
    return view;
}
- (IBAction)serviceAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(xb_homeHeader:selectServiceTarget:)]) {
        [self.delegate xb_homeHeader:self selectServiceTarget:sender];
    }
}
-(void)setUserName:(NSString *)userName{
    _userName = userName;
    if (_userName.length >= 0) {
        self.titleHeaderLabel.text = [NSString stringWithFormat:@"Hi,%@",_userName];
    }else{
       self.titleHeaderLabel.text = @"Hi";
    }
}

- (IBAction)searchAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(xb_homeHeader:selectSearchTarget:)]) {
        [self.delegate xb_homeHeader:self selectSearchTarget:sender];
    }
}

@end
