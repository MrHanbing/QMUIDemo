//
//  XBInsuranceHeaderP.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/28.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBInsuranceHeaderP.h"
#import "XBInsuranceHeader.h"
#import "XBInsuranceHomePageModel.h"
#import "XBWebViewController.h"

@interface XBInsuranceHeaderP ()
@property(nonatomic, copy) NSArray *datalist;
@end

@implementation XBInsuranceHeaderP

-(instancetype)init{
   self =  [super init];
    if (self) {
        _selectIndex = -1;
    }
    return self;
}

- (void)xb_insuranceHeaderP_configer_data:(NSArray *)dataArr{
    self.datalist = dataArr;
    if (self.selectIndex == -1) {
        self.selectIndex = 0;
    }

}
-(void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
}

- (NSInteger)xb_numberOfSectionsInXBInsuranceHeader :(XBInsuranceHeader *)header{
    
    return self.datalist.count;
}


- (NSDictionary *)xb_insuranceheader:(XBInsuranceHeader *)header configerFamilyDataAtIndex:(NSInteger )index{
    XBInsuranceFamilyDTO *family = [self.datalist objectAtIndexSafely:index];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObjectSafely:family.name forKey:@"name"];
    [dic setObjectSafely:family.icon forKey:@"icon"];
    return dic;
}

- (void)xb_insuranceheader:(XBInsuranceHeader *)header selectFamilyAtIndex:(NSInteger )index{
    self.selectIndex = index;
}

-(void)xb_insuranceheaderSelectAddMoreFamily:(XBInsuranceHeader *)header{
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString: XBURL_H5Make(@"pages/#/family/edit")];
    [self.ctr.navigationController pushViewController:web animated:YES];
    
}

- (void)xb_insuranceheader:(XBInsuranceHeader *)header selectCorrelationAtIndex:(NSInteger )index{
    ///关联保单
    XBInsuranceFamilyDTO *family = [self.datalist objectAtIndexSafely:index];
    NSString *str = [NSString stringWithFormat:@"pages/#/family/connect?id=%ld&name=%@&role=%ld&insurantName=",family.ID,family.name,family.role];
    NSString *strUrl = XBURL_H5Make(str);
    
    NSString *urlStr = (NSString *)



    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,

                                                              (CFStringRef)strUrl, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:urlStr];
    [self.ctr.navigationController pushViewController:web animated:YES];
}

-(void)xb_insuranceheaderSelectAllOrderOfInsurance:(XBInsuranceHeader *)header{
    XBWebViewController *web = [[XBWebViewController alloc]initWithURLString:XBURL_H5Make(@"pages/#/policys")];
    [self.ctr.navigationController pushViewController:web animated:YES];
}

@end
