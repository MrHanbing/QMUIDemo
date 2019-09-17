//
//  XBPersonController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/8.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBPersonController.h"
#import "XBGetCodeApi.h"
#import "XBPersonCell.h"
#import "XBMineHeader.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "XBHeader.h"
#import "XBParallaxHeader.h"
#import "XBUserDataManger.h"
//#import <MXParallaxHeader/MXParallaxHeader.h>
@interface XBPersonController ()<UITableViewDelegate,UITableViewDataSource,XBParallaxHeaderDelegate>
@property (nonatomic, strong)XBGetCodeApi *api;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong , nonatomic)XBMineHeader  *header;

@end

@implementation XBPersonController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.header =  [XBMineHeader initWithXib];
    XBHeader *header = [[XBHeader alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,  144 + StatusHeight)];
    [header xb_headerSetContentView: self.header];
    self.tableView.parallaxHeader.view = header;
    self.tableView.parallaxHeader.height =120 + StatusHeight;
    self.tableView.parallaxHeader.mode = XBParallaxHeaderModeFill;
    self.tableView.parallaxHeader.delegate = self;
    self.tableView.parallaxHeader.minimumHeight = 0;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.header.userName = [[XBUserDataManger defultManger]accessUserName];
}


- (BOOL)preferredNavigationBarHidden{
    
    return YES;
}
- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XBPersonCell *cell = [XBPersonCell cellWithTableView:tableView];
                          
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 500;
}




@end
