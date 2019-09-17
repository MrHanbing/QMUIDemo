//
//  XBClassRoomHeader.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/15.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SwipeTableView/SwipeTableView.h>

@class XBClassRoomHeader;

@protocol XBClassRoomHeaderDelegate <NSObject>

-(void)xb_homeHeader:(XBClassRoomHeader *)header selectSearchTarget:(id)target;
-(void)xb_homeHeader:(XBClassRoomHeader *)header selectBannerTarget:(id)target;
-(void)xb_homeHeader:(XBClassRoomHeader *)header selectInsuranceItemAtIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_BEGIN

@interface XBClassRoomHeader : STHeaderView
@property(nonatomic, weak) id <XBClassRoomHeaderDelegate> headerDelegate;

+(instancetype)initWithXib;
@end

NS_ASSUME_NONNULL_END
