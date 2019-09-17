//
//  XBScrollViewController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/16.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBScrollViewController.h"

@interface XBScrollViewController ()

@end

@implementation XBScrollViewController

-(instancetype)init{
    if (self == [super init]) {
        [self.view addSubview:self.scrollView];
   
    }
    return self;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
         [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
