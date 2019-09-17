//
//  XBAnimationView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/23.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBAnimationView.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation XBAnimationView


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _crofingerSubViews];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
         [self _crofingerSubViews];
    }
    return self;
}
-(void)_crofingerSubViews{
    self.xb_height = self.qmui_height;
    @weakify(self)
    [RACObserve(self, scrollView.contentOffset)subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        NSLog(@"scrollView.contentOffset%lf",self.scrollView.contentOffset.y);
        NSLog(@"%lf",self.qmui_top);
        self.frame = CGRectMake(0, self->_scrollView.contentOffset.y, self.qmui_width, self.xb_height - self->_scrollView.contentOffset.y);
    }];
    [RACObserve(self, scrollView) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        if ([self.scrollView isKindOfClass:[UITableView class]]) {
            UITableView *tab =(UITableView *)self.scrollView;
            tab.tableHeaderView =[[UIView alloc]initWithFrame:self.frame];
        }
    }];
}


- (void)xb_Animationbegin{
    
    
}

@end
