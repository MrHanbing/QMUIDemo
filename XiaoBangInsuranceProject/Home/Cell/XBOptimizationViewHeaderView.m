//
//  XBOptimizationTableViewHeaderView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/14.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBOptimizationViewHeaderView.h"
#import "XBGhostButton.h"
#import <Masonry.h>

@interface XBOptimizationViewHeaderView()
@property (weak, nonatomic) IBOutlet QMUILabel *leftTitleLabel;
@property (weak, nonatomic) IBOutlet QMUILabel *rightTitleLabel;
@property (weak, nonatomic) IBOutlet QMUIFloatLayoutView *floatLayOutView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layView_H;
@property (nonatomic, copy)NSMutableArray *tagArray;
@property (nonatomic, assign)NSInteger selectIndex;


@end

@implementation XBOptimizationViewHeaderView
+(instancetype)initWithXib{
    XBOptimizationViewHeaderView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    [view awakeFromNib];
    return view;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    self.leftTitleLabel.contentEdgeInsets = UIEdgeInsetsMake(0, 16, 4, 12);
    self.rightTitleLabel.contentEdgeInsets = UIEdgeInsetsMake(0, 16, 4, 12);
    self.floatLayOutView.padding= UIEdgeInsetsMake(4, 12, 4, 12);
    self.floatLayOutView.itemMargins =UIEdgeInsetsMake(4, 4, 4, 4);
    self.floatLayOutView. minimumItemSize = CGSizeMake(84, 32);

}
- (void)xb_OptimizationHeaderView:(NSArray *)titleArr tips:(NSArray *)tipsArray{
    [self.tagArray removeAllObjects];
    [self.floatLayOutView removeAllSubviews];
    for (NSInteger i  = 0; i < titleArr.count; i ++) {
        XBGhostButton *button = [[XBGhostButton alloc] init];
        [button setTitle:titleArr [i] forState:UIControlStateNormal];
        if (i == self.defultSelect) {
            self.selectIndex = i;
            button.fillColor = QMUICMI.yellowColor;
            button.titleTextColor = [UIColor blackColor];
            button.layer.borderColor = [QMUICMI.yellowColor CGColor];
            button.layer.borderWidth = 1;
        }
        button.index = i;
        [self.floatLayOutView addSubview:button];
        [button addTarget:self action:@selector(tagAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tagArray addObject:button];
    }
    CGSize floatLayoutViewSize = [self.floatLayOutView sizeThatFits:CGSizeMake(SCREEN_WIDTH, CGFLOAT_MAX)];
    self.layView_H.constant = floatLayoutViewSize.height;
    
}

-(void)tagAction:(XBGhostButton *)btn{
    @weakify(self);
    [self.tagArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        XBGhostButton *button = obj;
        button.fillColor = UIColor.whiteColor;
        button.titleTextColor = [UIColor colorWithHexString:@"#666666"];
        button.layer.borderColor = [[UIColor colorWithHexString:@"#EDEDED"] CGColor];
        button.layer.borderWidth = 1;
    }];
    btn.fillColor = QMUICMI.yellowColor;
    btn.titleTextColor = [UIColor blackColor];
    btn.layer.borderColor = [QMUICMI.yellowColor CGColor];
    btn.layer.borderWidth = 1;
    
    if ([self.delegate respondsToSelector:@selector(xb_optimizationHeader:didSelectTagIndex:)]) {
        [self.delegate xb_optimizationHeader:self didSelectTagIndex:btn.index];
    }
}


-(NSMutableArray *)tagArray{
    if (!_tagArray) {
        _tagArray = [NSMutableArray array];
    }
    return _tagArray;
}


@end
