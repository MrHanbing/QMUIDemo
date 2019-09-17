//
//  XBHeader.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/27.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBHeader.h"
#import "XBBordeRadiusView.h"
@interface XBHeader()

@property(nonatomic, strong) UIView *bottomView;
@property(nonatomic, strong) UIView *bottomClipView;
@property(nonatomic,strong)UIImageView *bgImageView;
@end

@implementation XBHeader

-(instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        [self configerSub];
        self.backgroundColor = QMUICMI.yellowColor;
    }
    return self;
}

-(void)xb_headerSetContentView:(UIView *)view{
    
    if (!view) {
        return;
    }
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomView.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_offset(view.qmui_height);
    }];
}

- (void)configerSub{
 
    [self addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_offset(self.qmui_height);
    }];
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_offset(@(24));
    }];
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 24)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        XBBordeRadiusView *view = [[XBBordeRadiusView alloc]initWithFrame:CGRectMake(12, 12, SCREEN_WIDTH-24, 2)];
        [_bottomView addSubview:view];
//        view.layer.shadowColor = UIColorGray.CGColor;
//        view.layer.shadowOpacity = .1;
//        view.layer.shadowRadius = 20;
//        view.layer.shadowOffset = CGSizeMake(0, 10);
//        view.layer.cornerRadius = 12;
//        view.layer.qmui_maskedCorners = QMUILayerMinXMinYCorner|QMUILayerMaxXMinYCorner|QMUILayerMinXMaxYCorner|QMUILayerMaxXMaxYCorner;
////        view.backgroundColor = [QMUICMI.grayColor colorWithAlphaComponent:0.05];
//        view.layer.qmui_maskedCorners = QMUILayerMinXMinYCorner|QMUILayerMaxXMinYCorner;
//        view.layer.cornerRadius = 16;
        _bottomView.layer.qmui_maskedCorners = QMUILayerMinXMinYCorner|QMUILayerMaxXMinYCorner;
        _bottomView.layer.cornerRadius = 16;

    }
    return _bottomView;
}

- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]initWithImage:UIImageMake(@"header_bgIcon")];
    }
    return _bgImageView;
}
@end
