//
//  XBInsuranceHeader.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class  XBInsuranceHeader;

@protocol XBInsuranceHeaderDelegate <NSObject>

- (NSInteger )xb_numberOfSectionsInXBInsuranceHeader :(XBInsuranceHeader *)header;

- (NSDictionary *)xb_insuranceheader:(XBInsuranceHeader *)header configerFamilyDataAtIndex:(NSInteger )index;

- (void)xb_insuranceheader:(XBInsuranceHeader *)header selectFamilyAtIndex:(NSInteger )index;

-(void)xb_insuranceheaderSelectAddMoreFamily:(XBInsuranceHeader *)header;

- (void)xb_insuranceheader:(XBInsuranceHeader *)header selectCorrelationAtIndex:(NSInteger )index;

-(void)xb_insuranceheaderSelectAllOrderOfInsurance:(XBInsuranceHeader *)header;

@end

@interface XBInsuranceHeader : UIView

@property(nonatomic, weak) id <XBInsuranceHeaderDelegate> delegate;
@property(nonatomic, assign) NSInteger selectIndex;
+(instancetype)initWithXib;

- (void)xb_reloadView;
@end

NS_ASSUME_NONNULL_END
