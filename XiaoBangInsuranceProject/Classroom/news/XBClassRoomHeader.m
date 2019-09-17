//
//  XBClassRoomHeader.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/15.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBClassRoomHeader.h"
#import "XBCollectionView.h"
#import "XBCardCollectionCell.h"
@interface XBClassRoomHeader()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) NSArray *iconList;


@end

@implementation XBClassRoomHeader
+(instancetype)initWithXib{
    XBClassRoomHeader *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    [view awakeFromNib];
    
    return view;
}
- (void)awakeFromNib{
    [super awakeFromNib];
  self.iconList = @[@"good_accident",@"good_cancer",@"good_life",@"good_medical",@"good_Serious_Illness"];
    
    
//    https://insurance-qa.xiaobangbaoxian.com/pages/#/course/insurance?type=medical
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    QMUICollectionViewPagingLayout *layOut =(QMUICollectionViewPagingLayout *) self.collectionView.collectionViewLayout;
    layOut.itemSize = CGSizeMake(140, 80);
    [self.collectionView registerNib:[UINib nibWithNibName:@"XBCardCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"XBCardCollectionCell"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   
    return self.iconList.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XBCardCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XBCardCollectionCell" forIndexPath:indexPath];
    cell.iconName = [self.iconList objectAtIndexSafely:indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.headerDelegate respondsToSelector:@selector(xb_homeHeader:selectInsuranceItemAtIndex:)]) {
        [self.headerDelegate xb_homeHeader:self selectInsuranceItemAtIndex:indexPath.row];
    }
}
- (IBAction)searchAction:(id)sender {
    if ([self.headerDelegate respondsToSelector:@selector(xb_homeHeader:selectSearchTarget:)]) {
        [self.headerDelegate xb_homeHeader:self selectSearchTarget:sender];
    }
}
- (IBAction)bannerAction:(id)sender {
    if ([self.headerDelegate respondsToSelector:@selector(xb_homeHeader:selectBannerTarget:)]) {
        [self.headerDelegate xb_homeHeader:self selectBannerTarget:sender];
    }
}

@end
