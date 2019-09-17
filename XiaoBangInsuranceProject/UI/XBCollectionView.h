//
//  XBCollectionView.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol XBCollectionViewDataSoure <UICollectionViewDataSource>



@end

@interface XBCollectionView : UIView

@property (nonatomic) CGSize itemSize;

-(void)xb_CollectionViewRegisterClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
