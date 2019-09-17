//
//  XBTimeLine.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/9.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XBTimeLineItemState) {
 
   XBTimeLineItemStateDefult = 1,
    
   XBTimeLineItemStateSelect,

   XBTimeLineItemStateAnimal,

};
NS_ASSUME_NONNULL_BEGIN

@interface XBTimeLineItem  : CALayer

- (instancetype)initWithFrame:(CGRect)frame ;
@end


@interface XBTimeLine : UIView

@property (nonatomic, copy)NSArray *titleArr;



@end

NS_ASSUME_NONNULL_END
