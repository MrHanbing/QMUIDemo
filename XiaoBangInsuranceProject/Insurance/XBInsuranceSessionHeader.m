//
//  XBInsyranceSessionHeader.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/27.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBInsuranceSessionHeader.h"

@interface XBInsuranceSessionHeader()
@property (weak, nonatomic) IBOutlet UILabel *bigTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *big_H;
@property (weak, nonatomic) IBOutlet UILabel *sessionTitle;

@end

@implementation XBInsuranceSessionHeader

+(instancetype)initWithXib{
    XBInsuranceSessionHeader *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    [view awakeFromNib];
    return view;
}
-(void)awakeFromNib{
    [super awakeFromNib];
}

-(void)setTitle:(NSString *)title{
    if (_title != title) {
        _title = title;
        self.sessionTitle.text = _title;
    }
}
-(void)setIsBigHeader:(BOOL)isBigHeader{
    _isBigHeader = isBigHeader;
    if (_isBigHeader == YES) {
        self.big_H.constant = 40;
        self.bigTitleLabel.hidden = NO;
    }else{
        self.big_H.constant = 0;
        self.bigTitleLabel.hidden = YES;
    }
}

@end
