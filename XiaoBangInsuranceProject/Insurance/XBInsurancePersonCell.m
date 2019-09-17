//
//  XBInsurancePersonCell.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/27.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBInsurancePersonCell.h"

@interface XBInsurancePersonCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation XBInsurancePersonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = 27.5f;
    self.iconView.layer.masksToBounds = YES;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:self];
    if (selected) {
        self.iconView.alpha = 1;
        self.nameLabel.alpha = 1;
    }else{
        self.iconView.alpha = 0.5;
        self.nameLabel.alpha = 0.5;
    }
}
- (void)xb_configerIcon:(NSString *)iconUrl userName:(NSString *)name{
    [self.iconView setImageWithURL:[NSURL URLWithString:iconUrl] placeholder:UIImageMake(@"user_father")];
    self.nameLabel.text = name;
}
@end
