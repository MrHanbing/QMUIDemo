//
//  XBBaseTableView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/31.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBBaseTableView.h"
#import "XBParallaxHeader.h"
//#import <MXParallaxHeader/MXParallaxHeader.h>

@interface XBBaseTableView ()<XBParallaxHeaderDelegate>

@property (nonatomic, strong)UIView *review;

@end

@implementation XBBaseTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.parallaxHeader.delegate = self;
    }
    return self;
}
-(void)setContentHeader:(UIView *)contentHeader{
    if (contentHeader == nil) {
        return;
    }
    _contentHeader = contentHeader;
    self.parallaxHeader.view = _contentHeader;
}
- (void)setContentHeaderView:(UIView *)contentHeaderView{
    if (self.contentHeader == nil) {
        self.contentHeader = [[UIView alloc]init];
    }
    _contentHeaderView = contentHeaderView;
    [self.contentHeader addSubview:_contentHeaderView];
}
- (void)parallaxHeaderDidScroll:(XBParallaxHeader *)parallaxHeader{
    
}

@end
