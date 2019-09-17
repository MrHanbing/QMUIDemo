//
//  XBInsuranceController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/23.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBInsuranceController.h"
#import "XBInsturanceCell.h"
#import "XBHomePageApi.h"
#import "XBInsuranceNetWork.h"
#import "XBInsuranceHeader.h"
//#import <MXParallaxHeader/MXParallaxHeader.h>
#import "XBHeader.h"
#import "XBMyInsuranceCardCell.h"
#import "XBMyInsuranceCardView.h"
#import "XBInsuranceSessionHeader.h"
#import "XBInsuranceHeaderP.h"
#import "XBInsuranceCardDatasoure.h"
#import "XBInsuranceHomePageModel.h"
#import <SGPagingView/SGPagingView.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "XBWebViewController.h"


@interface XBInsuranceController ()<QMUITableViewDelegate,QMUITableViewDataSource, XBParallaxHeaderDelegate,SGPageTitleViewDelegate>
@property (weak, nonatomic) IBOutlet QMUITableView *tableView;
@property(nonatomic, strong)XBInsuranceNetWork *netWork;
@property(nonatomic, strong) XBInsuranceHeaderP *headerP;
@property(nonatomic, strong) XBInsuranceHeader *insuranceHeader;
@property(nonatomic, strong)XBInsuranceCardDatasoure *cardDataSoure;
@property(nonatomic,strong)UIView *navView;
@property(nonatomic, strong)SGPageTitleView *titlePageView;

@end

@implementation XBInsuranceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    XBHeader *header = [[XBHeader alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,  230)];
   _insuranceHeader = [XBInsuranceHeader initWithXib];
    [header xb_headerSetContentView:_insuranceHeader];
    self.tableView.parallaxHeader.view = header;
    self.tableView.parallaxHeader.height = 230 + 20;
    self.tableView.parallaxHeader.mode = XBParallaxHeaderModeFill;
    self.tableView.parallaxHeader.delegate = self;
    self.tableView.parallaxHeader.minimumHeight = 0;
    _insuranceHeader.delegate = self.headerP;
    
    
    @weakify(self);
    self.netWork.xbInsuranceNetWorkSuccessBlock = ^(NSArray *dataList) {
        @strongify(self);
        [self.headerP xb_insuranceHeaderP_configer_data:self.netWork.familyList];
        [self.navView removeFromSuperview];
        [self.view addSubview:self.navView];
    };
    [RACObserve(self, headerP.selectIndex) subscribeNext:^(id x) {
        NSInteger index = [x integerValue];
        if (index > -1) {
            [self xb_reloadData];
        }
    }];
    
}
-(void)xb_reloadData{
    self.netWork.selectIndex = self.headerP.selectIndex;
    self.cardDataSoure.insuranceList =self.netWork.homePageModel.insurances;
    self.insuranceHeader.selectIndex = self.headerP.selectIndex;
     [self.titlePageView setPageTitleViewWithProgress:1 originalIndex:self.titlePageView .selectedIndex targetIndex:self.headerP.selectIndex];
    [self.insuranceHeader xb_reloadView];
    [self.tableView reloadData];
}
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    if ( self.headerP.selectIndex != selectedIndex) {
           self.headerP.selectIndex = selectedIndex;
    }
 
}

- (void)parallaxHeaderDidScroll:(XBParallaxHeader *)parallaxHeader{
    if (self.netWork.familyList.count == 0) {

        return;
    }
    if (parallaxHeader.progress >= 1) {
        self.navView.alpha = 0;
   
    }else{
        self.navView.alpha = 1- parallaxHeader.progress;
    }
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     [self.netWork xb_startRequestHomePage];
}
- (id)cachedKeyAtIndexPath:(NSIndexPath *)indexPath {

    NSString *str = [NSString stringWithFormat:@"XBInsurance-%ld-%ld",indexPath.section,indexPath.row];
    return str;// 这里简单处理，认为只要长度不同，高度就不同（但实际情况下长度就算相同，高度也有可能不同，要注意）
}


- (id<NSCopying>)qmui_tableView:(UITableView *)tableView cacheKeyForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *keyName = [self cachedKeyAtIndexPath:indexPath];
    return keyName;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.netWork.homePageModel.list.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    XBInsuranceGoodTypeList *list = [self.netWork xb_goodTypeListAtIndex:section -1];;
    return list.list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 ) {
        XBMyInsuranceCardCell *cell = [XBMyInsuranceCardCell cellWithTableView:tableView];
        if ( !cell.cardView.delegate) {
             cell.cardView.delegate = self.cardDataSoure;
        }else{
            [cell.cardView xb_reloadData];
        }
        
        return cell;
    }else{
         XBInsturanceCell *cell = [XBInsturanceCell cellWithTableView:tableView];
          XBInsuranceGoodTypeList *list = [self.netWork xb_goodTypeListAtIndex:indexPath.section -1];
        XBInsuranceGoodTypeListItem *item =[list.list objectAtIndexSafely:indexPath.row];
        [cell xb_cellConfigerTitle:item.name insuranceSource:item.source insuranceBaseCredit:item.baseCredit insuranceSuggest:item.suggest insuranceTags:item.tags];
           return cell;
    }
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 ) {
        NSString *urlString = [NSString stringWithFormat:@"pages/#/case/analysis?active=%ld",self.headerP.selectIndex];
        XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make(urlString)];
        [self.navigationController pushViewController:web animated:YES];
    }else{
        
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return [UIView new];
    }else{
        XBInsuranceSessionHeader *header  = [XBInsuranceSessionHeader initWithXib];
        if (section == 1) {
            header.isBigHeader = YES;
        }else{
            header.isBigHeader = NO;
        }
       XBInsuranceGoodTypeList *list = [self.netWork xb_goodTypeListAtIndex:section -1];
        header.title = list.goodsType;
        return header;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 2 *((SCREEN_WIDTH - 48 )/4.0)+ 50;
    }

    return -1;// 返回一个小于0的值，表示交给 QMUICellHeightKeyCache
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.0001;
    }else if(section == 1){
        return 80;
    }else{
        return 40;
    }

    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.00001;
}

- (BOOL)preferredNavigationBarHidden{
    
    return YES;
}
- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable{
    return YES;
}

-(XBInsuranceNetWork *)netWork{
    if (!_netWork) {
        _netWork =[[XBInsuranceNetWork alloc]init];
    }
   return  _netWork;
}


- (XBInsuranceHeaderP *)headerP{
    if (!_headerP) {
        _headerP = [[XBInsuranceHeaderP alloc]init];
        _headerP.ctr = self;
    }
    return _headerP;
}

- (XBInsuranceCardDatasoure *)cardDataSoure{
    if (!_cardDataSoure) {
        _cardDataSoure = [[XBInsuranceCardDatasoure alloc]init];
    }
    return _cardDataSoure;
}

-(UIView *)navView{
    if (!_navView ) {
        _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SafeAreaTopHeight)];
        _navView.backgroundColor = [UIColor whiteColor];
        _navView.alpha = 0;
        [_navView addSubview:self.titlePageView];
    }
    return _navView;
}
- (SGPageTitleView *)titlePageView{
    if (!_titlePageView) {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for (XBInsuranceFamilyDTO *model  in self.netWork.familyList) {
            [arr addObjectSafely:model.name];
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
        CGFloat w = 80 *arr.count > SCREEN_WIDTH?SCREEN_WIDTH:80 *arr.count;
        _titlePageView = [[SGPageTitleView alloc]initWithFrame:CGRectMake(0, StatusHeight, w, 44) delegate:self titleNames:arr configure:configure];
        _titlePageView.selectedIndex = self.headerP.selectIndex;
    }
    return _titlePageView;
}
@end
