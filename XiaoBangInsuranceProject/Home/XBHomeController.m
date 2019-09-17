//
//  XBHomeController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/8.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBHomeController.h"
#import "XBTimeLine.h"
#import <Masonry.h>
#import "XBHomeSessionHeaderView.h"
#import <WebKit/WebKit.h>
#import "XBInsuranceMangerCell.h"
#import "XBOptimizationItemCell.h"
#import "XBClassRoomArticleItemCell.h"
#import "XBOptimizationViewHeaderView.h"
#import "XBHomeNetWork.h"
#import "XBInsuranceCodeListModel.h"
#import "XBGoodsThemeTypeModel.h"
#import "XBArticleListModel.h"
#import "XBCommunityTagModel.h"
#import "XBHomeScheduleCell.h"
//#import <MXParallaxHeader/MXParallaxHeader.h>
#import "XBHomeHeader.h"
#import "XBHomeWelcomeCell.h"
#import "XBHomeControllerManage.h"
#import <MJRefresh/MJRefresh.h>
#import "XBParallaxHeader.h"
#import "XBHomeFootView.h"
#import "XBUserDataManger.h"
@interface XBHomeController ()<UITableViewDelegate,UITableViewDataSource,XBOptimizationHeaderDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign)NSInteger optimization;
@property (nonatomic, strong)XBOptimizationViewHeaderView *tableViewHeader;
@property(nonatomic, strong) XBHomeNetWork *netWork;
@property(nonatomic, strong)XBHomeWelcomeCell *homeWelocmecell;
@property(nonatomic, strong)XBInsuranceMangerCell *insuranceMangerCell;
@property(nonatomic, strong)XBHomeScheduleCell  *scheduleCell;
@property(nonatomic, strong) XBHomeHeader *homeHeader;
@property(nonatomic, strong) XBHomeControllerManage *ctrManger;
@property(nonatomic, strong)XBHomeFootView *footView;

@end

@implementation XBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";

    if (@available(iOS 11.0, *)){
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets =NO;
    }
    self.optimization = 0;
 
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    @weakify(self);
    self.netWork.requestSucessBlock = ^{
       @strongify(self);
        [self xb_reloadData];
        [self.tableView reloadData];
    };
//    self.tableView.tableFooterView = [XBHomeFootView initWithXib];
//    self.tableView.tableFooterView.height = 200;
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.netWork  chainRequest];
    [self _configureTabViewHeader];
    self.homeHeader.userName = [[XBUserDataManger defultManger]accessUserName];
}
-(void)_configureTabViewHeader{
    self.tableView.parallaxHeader.view = self.homeHeader;
    self.tableView.parallaxHeader.height = SafeAreaTopHeight;
    self.tableView.parallaxHeader.mode = XBParallaxHeaderModeBottom;
    self.tableView.parallaxHeader.minimumHeight = SafeAreaTopHeight;
    self.tableView.parallaxHeader.contentView.layer.zPosition = 1;
    @weakify(self);
    [self.tableView.parallaxHeader refreshingWithCompletionBlock:^{
        @strongify(self);
        [self.netWork  chainRequest];
    }];
    
}
- (void)xb_reloadData{
   
    NSMutableArray *titleArr = [NSMutableArray array];
    NSMutableArray *tipsArr = [NSMutableArray array];
    [self.netWork.tagItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        XBInsuranceCodeListModel *model = obj;
        [tipsArr addObject:model.codeValue];
        [titleArr addObject:model.codeName];
    }];
    self.tableViewHeader.defultSelect = self.optimization;
    [self.tableViewHeader xb_OptimizationHeaderView:titleArr tips:tipsArr];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 2) {
        XBInsuranceCodeListModel *model = [self.netWork.tagItems objectAtIndexSafely:self.optimization];
        return model.xbItem.count;
    }else if (section == 3){
        return self.netWork.articleList.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
    
        return self.homeWelocmecell;
    } else if (indexPath.section == 1) {
       
        
        return self.insuranceMangerCell;
    }else  if (indexPath.section == 2){
        XBOptimizationItemCell *cell = [XBOptimizationItemCell cellWithTableView:tableView];
         XBInsuranceCodeListModel *model = [self.netWork.tagItems objectAtIndexSafely:self.optimization];
        XBGoodsThemeTypeModel *item = [model.xbItem objectAtIndexSafely:indexPath.row];
        [cell xb_cellConfigureIcon:[item.imageUrlList objectAtIndexSafely:0] withName:item.name withMarketingTags:item.marketingTags];
        
        return cell;
    }else{
        XBClassRoomArticleItemCell *cell = [XBClassRoomArticleItemCell cellWithTableView:tableView];
        XBArticleListModel *model = [self.netWork.articleList objectAtIndexSafely:indexPath.row];
        XBCommunityTagModel *tagModel = [model.tagList objectAtIndexSafely:0];
        [cell xb_cellConfigureArticleTitle:model.article.articleTitle withArticleAuth:model.article.articleAuth withCoverUrl:model.article.coverUrl withReadCount:model.article.readCount withStatus:model.article.status withtagName:tagModel.tagName];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    if (indexPath.section == 2) {
        return 100;
    }else if (indexPath.section == 3){
        return 110;
    }else if (indexPath.section == 1){
        return 100;
    }
    return (SCREEN_WIDTH -32)/(343/205.0);
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0 || section == 1)
    {
        return [UIView new];
    }else if (section == 2)
    {
        return self.tableViewHeader;
    }else {
        XBHomeSessionHeaderView *tableViewHeader =  [XBHomeSessionHeaderView initWithXib];
        return tableViewHeader;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 || section == 1)
    {
        return 0.00001;
    }else if (section == 2){
        return [self.tableViewHeader sizeThatFits:CGSizeMake(SCREEN_WIDTH, 200)].height;
    }
    return 65;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 3) {
        return 200;
    }
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 3) {
        return  [XBHomeFootView initWithXib];
    }
    return [UIView new];
}
-(void)xb_optimizationHeader:(XBOptimizationViewHeaderView *)header didSelectTagIndex:(NSInteger)index{
    
    self.optimization = index;
    [UIView performWithoutAnimation:^{
        NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:2];
        [self.tableView reloadSections:indexSet withRowAnimation:(UITableViewRowAnimationNone)];
    }];
  
}
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    
//    return [UIView new];
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        XBInsuranceCodeListModel *model = [self.netWork.tagItems objectAtIndexSafely:self.optimization];
        XBGoodsThemeTypeModel *item = [model.xbItem objectAtIndexSafely:indexPath.row];
        [self.ctrManger xb_ctrMangagePushInsuranceDetail:item.goodsCode];
        ///保险
    }else if (indexPath.section == 3){
        ///文章
        XBArticleListModel *model = [self.netWork.articleList objectAtIndexSafely:indexPath.row];
        [self.ctrManger xb_ctrMangagePushArticleDetail: model.article.articleId];
        
    }else if(indexPath.section == 0){
        [QMUITips showInfo:@"该功能即将开放"];
    }
}

- (XBOptimizationViewHeaderView *)tableViewHeader{
    if (!_tableViewHeader) {
        _tableViewHeader = [XBOptimizationViewHeaderView initWithXib];
        _tableViewHeader.delegate = self;
    }
    return _tableViewHeader;
}

- (BOOL)preferredNavigationBarHidden{
    
    return YES;
}
- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable{
    return YES;
}

-(XBHomeNetWork *)netWork{
    if (!_netWork) {
        _netWork = [[XBHomeNetWork alloc]init];
    }
    return _netWork;
}

-(XBHomeWelcomeCell *)homeWelocmecell{
    if (!_homeWelocmecell) {
        _homeWelocmecell = [XBHomeWelcomeCell cellWithTableView:self.tableView];
    }
    return _homeWelocmecell;
}
- (XBInsuranceMangerCell *)insuranceMangerCell{
    if (!_insuranceMangerCell) {
        _insuranceMangerCell = [XBInsuranceMangerCell cellWithTableView:self.tableView];
        _insuranceMangerCell.delegate = self.ctrManger;
    }
    return _insuranceMangerCell;
}
-(XBHomeScheduleCell *)scheduleCell{
    if (!_scheduleCell) {
        _scheduleCell = [XBHomeScheduleCell cellWithTableView:self.tableView];
    }
    return _scheduleCell;
}
-(XBHomeHeader *)homeHeader{
    if (!_homeHeader) {
        _homeHeader =[XBHomeHeader initWithXib];
        _homeHeader.delegate = self.ctrManger;
    }
    return _homeHeader;
}
-(XBHomeControllerManage *)ctrManger{
    if (!_ctrManger) {
        _ctrManger  =[[XBHomeControllerManage alloc]initWithController:self];
    }
    return _ctrManger;
}
@end
