//
//  XBClassRoomController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/8.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBClassRoomController.h"
#import "XBClassRoomHeader.h"
#import <SwipeTableView/SwipeTableView.h>
#import <Masonry/Masonry.h>
#import <SGPagingView/SGPagingView.h>
#import "XBTableView.h"
#import "XBCommunityTagModel.h"
#import "XBClassRoomNetWork.h"
#import "XBWebViewController.h"

@interface XBClassRoomController ()<SwipeTableViewDelegate,SwipeTableViewDataSource,SGPageTitleViewDelegate,XBClassRoomHeaderDelegate>
@property (strong, nonatomic)SwipeTableView *swipeTableView;
@property (nonatomic, strong)XBClassRoomHeader *headerView;
@property (nonatomic, strong)SGPageTitleView *pageTitleView;
@property (nonatomic, strong)NSArray *childVCs;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (nonatomic, strong)XBClassRoomNetWork *netWork;
@property (nonatomic, strong)NSMutableArray *tableViewList;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgH;

@end

@implementation XBClassRoomController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.bgH.constant = StatusHeight;
    self.title = @"课堂";
    [self.view addSubview:self.swipeTableView];
    self.swipeTableView.swipeHeaderView = self.headerView;
    [self.view bringSubviewToFront:self.bgView];
  

    self.netWork  =  [[XBClassRoomNetWork alloc] init];
    [self.netWork  chainRequest];
    @weakify(self);
    self.netWork.requestBlock = ^{
        @strongify(self);
        [self  xb_reloadData];
    };
    
}
-(void)xb_reloadData{
    
  
    if (self.netWork.tagList.count > 0 && self.swipeTableView.swipeHeaderBar == nil) {
        self.swipeTableView.swipeHeaderBar = self.pageTitleView;
    }
    if (self.netWork.articleListApiList.count > 0) {
        for (int i = 0; i <self.netWork.articleListApiList.count ; i ++) {
            XBTableView *tab = [[XBTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
            tab.api = [self.netWork.articleListApiList objectAtIndexSafely:i];
            [self.tableViewList addObject:tab];
        }
    }
    [self.swipeTableView reloadData];
}

-(SGPageTitleView *)pageTitleView{
    if (!_pageTitleView) {
        NSMutableArray *titles =  [NSMutableArray array];
        for (XBCommunityTagModel *model in self.netWork.tagList) {
            [titles addObjectSafely:model.tagName];
        }
        SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
        configure.titleSelectedFont = [UIFont boldSystemFontOfSize:20];
        configure.titleSelectedColor = [UIColor blackColor];
        configure.titleFont = [UIFont systemFontOfSize:16];
        configure.titleColor = [UIColor colorWithHexString:@"#666666"];
        configure.indicatorColor = QMUICMI.yellowColor;
        configure.indicatorHeight = 8;
        configure.indicatorCornerRadius = 2;
        configure.indicatorAnimationTime = 0;
        configure.showBottomSeparator = NO;
        configure.indicatorToBottomDistance= 12;
        _pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) delegate:self titleNames:titles configure:configure];
        _pageTitleView.backgroundColor = [UIColor whiteColor];
    }
    return _pageTitleView;
}

- (XBClassRoomHeader *)headerView{
    
    if (!_headerView) {
        _headerView = [XBClassRoomHeader initWithXib];
        _headerView.headerDelegate = self;
        _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, _headerView.height);
    }
    return _headerView;
}


-(void)xb_homeHeader:(XBClassRoomHeader *)header selectSearchTarget:(id)target{
   
//    NSString *url = @"https://insurance-qa.xiaobangbaoxian.com/pages/#/analysis";
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make(@"pages/#/analysis")];
    [self.navigationController pushViewController:web animated:YES];
}
-(void)xb_homeHeader:(XBClassRoomHeader *)header selectBannerTarget:(id)target{
//    NSString *url = @"https://insurance-qa.xiaobangbaoxian.com/pages/#/course/detail";
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make(@"pages/#/course/detail")];
    [self.navigationController pushViewController:web animated:YES];
}
-(void)xb_homeHeader:(XBClassRoomHeader *)header selectInsuranceItemAtIndex:(NSInteger)index{
    NSArray *arr = @[@"pages/#/course/insurance?type=accident",
                     @"pages/#/course/insurance?type=defense_cancer",
                     @"pages/#/course/insurance?type=life",
                     @"pages/#/course/insurance?type=medical",
                     @"pages/#/course/insurance?type=serious",
                     ];
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make([arr objectAtIndexSafely:index])];
    [self.navigationController pushViewController:web animated:YES];
    
}

- (NSInteger)numberOfItemsInSwipeTableView:(SwipeTableView *)swipeView {
    return self.tableViewList.count;
}

- (UIScrollView *)swipeTableView:(SwipeTableView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIScrollView *)view {
    XBTableView *tab =   [self.tableViewList objectAtIndexSafely:index];
    return tab;
}

- (void)swipeTableViewCurrentItemIndexDidChange:(SwipeTableView *)swipeView {
    [self.pageTitleView setPageTitleViewWithProgress:1 originalIndex:self.pageTitleView.selectedIndex targetIndex:swipeView.currentItemIndex];
}
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    [self.swipeTableView scrollToItemAtIndex:selectedIndex animated:NO];
}
// 滚动结束请求数据
- (void)swipeTableViewDidEndDecelerating:(SwipeTableView *)swipeView {
    
}

- (SwipeTableView *)swipeTableView{
    if (!_swipeTableView) {
        _swipeTableView = [[SwipeTableView alloc]initWithFrame:CGRectMake(0, StatusHeight, SCREEN_WIDTH, self.view.qmui_height - StatusHeight)];
        _swipeTableView.delegate = self;
        _swipeTableView.dataSource = self;
        _swipeTableView.shouldAdjustContentSize = YES;
        _swipeTableView.swipeHeaderTopInset = 0;
    }
    return _swipeTableView;
} 
- (BOOL)preferredNavigationBarHidden{
    
    return YES;
}
- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable{
    return YES;
}
-(NSMutableArray *)tableViewList{
    if (!_tableViewList) {
        _tableViewList = [NSMutableArray array];
    }
    return _tableViewList;
}
@end
