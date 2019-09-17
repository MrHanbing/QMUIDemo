//
//  XBInsuranceCardDatasoure.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/28.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//


#import "XBInsuranceCardDatasoure.h"
#import "XBMyInsuranceCardView.h"

#import "XBInsuranceHomePageModel.h"
@interface XBInsuranceCardDatasoure ()

@end

@implementation XBInsuranceCardDatasoure


-(NSString *)xb_InsuranceCardConfigerTitle{
    
    return @"本人的保障额度";
}

-(NSInteger)xb_InsuranceCardViewConfigerNumber{
    return self.insuranceList.count;
}

- (NSString *)xb_insuranceCardItemCoverageAtIndex:(NSInteger)index{
    XBInsuranceHomePageInsurances *model = [self.insuranceList objectAtIndexSafely:index];
    
    return [NSString stringWithFormat:@"%ld", model.amount];
    
}
-(NSString *)xb_InsuranceCardItemTypeTitleAtIndex:(NSInteger)index{
      XBInsuranceHomePageInsurances *model = [self.insuranceList objectAtIndexSafely:index];
    return model.name;
}

@end
