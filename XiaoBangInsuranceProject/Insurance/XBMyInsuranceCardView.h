//
//  XBMyInsuranceCardView.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/27.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol XBMyInsuranceCardViewDelegate <NSObject>

-(NSString *)xb_InsuranceCardConfigerTitle;

-(NSInteger)xb_InsuranceCardViewConfigerNumber;

-(NSString *)xb_InsuranceCardItemTypeTitleAtIndex:(NSInteger)index;

-(NSString *)xb_insuranceCardItemCoverageAtIndex:(NSInteger)index;

@end

@interface XBMyInsuranceCardItem : UIView

@end

@interface XBMyInsuranceCardView : UIView

@property(nonatomic, weak)id<XBMyInsuranceCardViewDelegate> delegate;

+(instancetype)initWithXib;

-(void)xb_reloadData;


@end

NS_ASSUME_NONNULL_END
