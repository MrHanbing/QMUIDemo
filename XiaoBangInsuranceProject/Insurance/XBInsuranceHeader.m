//
//  XBInsuranceHeader.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBInsuranceHeader.h"
#import "XBCollectionView.h"
#import "XBInsurancePersonCell.h"


@interface XBInsuranceHeader()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet QMUIButton *allOrderBtn;

@property (weak, nonatomic) IBOutlet UIView *correlationBgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collection_H;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;


@end

@implementation XBInsuranceHeader
+(instancetype)initWithXib{
    XBInsuranceHeader *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    [view awakeFromNib];
    return view;
}

-(void)setDelegate:(id<XBInsuranceHeaderDelegate>)delegate{
    if (_delegate != delegate) {
        _delegate = delegate;
    }
}

- (void)xb_reloadView{
    if ([self.delegate respondsToSelector:@selector(xb_numberOfSectionsInXBInsuranceHeader:)]) {
        NSInteger count =  [self.delegate xb_numberOfSectionsInXBInsuranceHeader:self];
        if (count * 70 > (self.correlationBgView.qmui_width - 70)){
            self.collection_H.constant = self.correlationBgView.qmui_width - 70;
        }else{
            self.collection_H.constant = count * 70;
        }
    }
    [self.allOrderBtn setTitle:@"10张有效的保单" forState:UIControlStateNormal];
    [self.collectionView reloadData];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.selectIndex = 0;
    self.allOrderBtn.spacingBetweenImageAndTitle = 4;
    [self.allOrderBtn setTitle:@"10张有效的保单" forState:UIControlStateNormal];
    self.allOrderBtn.imagePosition =  QMUIButtonImagePositionRight;
    self.addBtn.layer.cornerRadius = 27.5;
    self.addBtn.layer.masksToBounds = YES;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.correlationBgView.layer.cornerRadius = 10;
    self.correlationBgView.layer.masksToBounds = YES;
    QMUICollectionViewPagingLayout *layOut =(QMUICollectionViewPagingLayout *) self.collectionView.collectionViewLayout;
    layOut.itemSize = CGSizeMake(70, 90);
    [self.collectionView registerNib:[UINib nibWithNibName:@"XBInsurancePersonCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"XBInsurancePersonCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(xb_numberOfSectionsInXBInsuranceHeader:)]) {
       return  [self.delegate xb_numberOfSectionsInXBInsuranceHeader:self];
    }
    return 0;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XBInsurancePersonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XBInsurancePersonCell" forIndexPath:indexPath];
    if ([self.delegate respondsToSelector:@selector(xb_insuranceheader:configerFamilyDataAtIndex:)]) {
       NSDictionary * dic = [self.delegate xb_insuranceheader:self configerFamilyDataAtIndex:indexPath.row];
        [cell xb_configerIcon:[dic objectForKeySafely:@"icon"] userName:[dic objectForKeySafely:@"name"]];
        
    }
    if (self.selectIndex == indexPath.row) {
        cell.selected = YES;
    }else{
        cell.selected = NO;
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
 
//    self.selectIndex = indexPath.row;
    if ([self.delegate respondsToSelector:@selector(xb_insuranceheader:selectFamilyAtIndex:)]) {
        [self.delegate xb_insuranceheader:self selectFamilyAtIndex:indexPath.row];
    }
//    [collectionView reloadData];
}
- (IBAction)carrelationAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(xb_insuranceheader:selectCorrelationAtIndex:)]) {
        [self.delegate xb_insuranceheader:self selectCorrelationAtIndex:self.selectIndex];
    }
}
- (IBAction)allOrderAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(xb_insuranceheaderSelectAllOrderOfInsurance:)]) {
        [self.delegate xb_insuranceheaderSelectAllOrderOfInsurance:self];
    }
}
- (IBAction)addAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(xb_insuranceheaderSelectAddMoreFamily:)]) {
        [self.delegate xb_insuranceheaderSelectAddMoreFamily:self];
    }
}

@end
