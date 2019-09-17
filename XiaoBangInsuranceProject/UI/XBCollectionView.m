//
//  XBCollectionView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBCollectionView.h"

@interface XBCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *collectionView;

@end


@implementation XBCollectionView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self =  [super initWithCoder:aDecoder];
    if (self) {
        [self _createSubViews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
     self =   [super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
    }
    return self;
}

-(void)_createSubViews{
    [self addSubview:self.collectionView];
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView =  [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:[[QMUICollectionViewPagingLayout alloc]initWithStyle:QMUICollectionViewPagingLayoutStyleDefault]];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}
-(void)xb_CollectionViewRegisterClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier{
    
   [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}

@end
