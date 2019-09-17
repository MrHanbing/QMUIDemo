//
//  XBInsturanceCell.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBInsturanceCell.h"
#import "XBAttributedLabel.h"
#import "XBBordeRadiusView.h"
@interface XBInsturanceCell ()
@property (weak, nonatomic) IBOutlet QMUILabel *nameLabel;
@property (weak, nonatomic) IBOutlet QMUILabel *tagLabel;
@property (weak, nonatomic) IBOutlet XBAttributedLabel *priceLabel;
@property (weak, nonatomic) IBOutlet QMUILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet QMUILabel *reasonLabel;
@property (weak, nonatomic) IBOutlet UIView *spaceLine;
@property (weak, nonatomic) IBOutlet XBBordeRadiusView *bgView;
@property (weak, nonatomic) IBOutlet QMUILabel *reasonTagLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tag_W;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *price_w;

@end

@implementation XBInsturanceCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"XBInsturanceCell";
    XBInsturanceCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:ID bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self _configerSubs];
    self.spaceLine.backgroundColor = QMUICMI.separatorColor;
}

-(void)_configerSubs{
     self.spaceLine.backgroundColor = QMUICMI.separatorColor;
    self.tagLabel.backgroundColor = [[UIColor qmui_colorWithHexString:@"#FF6619"]colorWithAlphaComponent:0.1];
    self.tagLabel.contentEdgeInsets = UIEdgeInsetsMake(2, 9, 2, 9);
    self.reasonTagLabel.backgroundColor =[UIColor qmui_colorWithHexString:@"#FF8533"];
    self.reasonTagLabel.contentEdgeInsets = UIEdgeInsetsMake(2, 13, 2, 9);
    self.reasonTagLabel.layer.qmui_maskedCorners = QMUILayerMaxXMaxYCorner |QMUILayerMaxXMinYCorner;
     self.reasonTagLabel.layer.cornerRadius = 9;
    self.reasonTagLabel.layer.masksToBounds = YES;
    
    self.priceLabel.highLightFont = [UIFont boldSystemFontOfSize:21];
    self.priceLabel.OtherFont = [UIFont systemFontOfSize:12];
    self.priceLabel.OtherTextColor = [UIColor colorWithHexString:@"#B3B3B3"];
    self.priceLabel.highlightedTextColor = [UIColor colorWithHexString:@"#FF6619"];
    self.reasonLabel.textColor = [UIColor colorWithHexString:@"#808080"];
    self.introduceLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    
}

-(void)xb_cellConfigerTitle:(NSString *)title insuranceSource:(NSInteger)source  insuranceBaseCredit:(CGFloat)baseCredit insuranceSuggest:(NSString *)suggest insuranceTags:(NSString *) tags{
    self.nameLabel.text = title;
    self.introduceLabel.text = tags;
    self.reasonLabel.text = suggest;
//
    [self.priceLabel xb_HighlightText:[NSString stringWithFormat:@"%.2lf",baseCredit] withDefultText:@"元起"];
    CGSize priceSize = [self.priceLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, 25)];
    self.price_w.constant = priceSize.width;
    self.tagLabel.text = source == 1?@"保险师推荐":@"小帮优选";
    self.tag_W.constant = source == 1?60:72;
    [self.tagLabel sizeToFit];
    UIBezierPath *path = [UIBezierPath qmui_bezierPathWithRoundedRect:self.tagLabel.bounds cornerRadiusArray:@[@(9),@(2),@(9),@(9)] lineWidth:0];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.tagLabel.bounds;
    maskLayer.path = path.CGPath;// 轨迹
    maskLayer.fillColor = [UIColor qmui_colorWithHexString:@"#FF6619"].CGColor;
    self.tagLabel.layer.mask = maskLayer;
 
}

- (void)layoutSubviews{
    [super layoutSubviews];
   

    
   
}

@end
