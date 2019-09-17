//
//  XBInsuranceNetWork.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBInsuranceNetWork.h"
#import "XBInsuranceHomePageModel.h"
#import "XBHomePageApi.h"
#import <MJExtension/MJExtension.h>
@interface XBInsuranceNetWork() <XBBaseRequestProtol>
@property(nonatomic, strong)NSArray *dataList;
@property(nonatomic, strong) XBHomePageApi *homeApi;

@end

@implementation XBInsuranceNetWork

-(void)xb_startRequestHomePage
{
    [self.homeApi xb_startRequest];
}

-(void)xb_request:(id)request successResponse:(id)responseData{

    NSDictionary *dic = responseData;
    self.dataList = [XBInsuranceHomePageModel mj_objectArrayWithKeyValuesArray:[dic objectForKeySafely:@"list"]];
    
    if (!self.familyList) {
        self.familyList =[NSMutableArray array];
    }else{
        [self.familyList removeAllObjects];
    }
    for (XBInsuranceHomePageModel * model  in self.dataList ) {
        [self.familyList addObjectSafely:model.familyDTO];
    }
    if (self.xbInsuranceNetWorkSuccessBlock) {
        self.xbInsuranceNetWorkSuccessBlock(self.dataList);
    }
}
- (XBInsuranceHomePageModel *)homePageModel{
    
    XBInsuranceHomePageModel *model =   [self.dataList objectAtIndex:self.selectIndex];
    return model;
}
-(XBInsuranceGoodTypeList *)xb_goodTypeListAtIndex:(NSInteger)index{
    
    return [self.homePageModel.list objectAtIndexSafely:index];
}


-(void)xb_request:(id)request  requestFailed:(NSString *)message{
    
}

-(XBHomePageApi *)homeApi{
    if (!_homeApi) {
        _homeApi = [[XBHomePageApi alloc]init];
        _homeApi.xb_Requestdelegate= self;
    }
    return _homeApi;
}
@end
