//
//  XBBaseViewController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/8.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBBaseViewController.h"
#import "XBLoadingView.h"
#import "XBEmptyView.h"
@interface XBBaseViewController ()

@property(nonatomic, strong) XBLoadingView *loadingView;

@end

@implementation XBBaseViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.emptyView = [[XBEmptyView alloc] initWithFrame:self.view.bounds];
    self.emptyView.actionButtonInsets = UIEdgeInsetsMake(12, -26, 12, 26);
    self.emptyView.actionButtonTitleColor = [UIColor blackColor];
    self.emptyView.actionButton.backgroundColor = QMUICMI.yellowColor;
    self.emptyView.actionButton.qmui_height = 40;
}

-(UIImage *)loadingImage{
    if (!_loadingImage) {
        _loadingImage = [UIImage qmui_animatedImageWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"loading"ofType:@"gif"]] scale:0];
    }
    return _loadingImage;
}
@end
