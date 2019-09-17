//
//  XBMyInsuranceCardView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/27.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBMyInsuranceCardView.h"
#import "XBAttributedLabel.h"
#import "XBBordeRadiusView.h"

@interface XBMyInsuranceCardItem ()
@property(nonatomic, strong) XBAttributedLabel *moneyLabel;
@property(nonatomic, strong) QMUILabel *nameLabel;
@property(nonatomic,strong) UIButton *clickBtn;
@property(nonatomic, copy) NSString *typeName;
@property(nonatomic, copy) NSString *moneyName;
@end

@implementation XBMyInsuranceCardItem

-(instancetype)init{
   self =  [super init];
    if (self) {
        [self _configerSub];
    }
    return self;
}

-(void)_configerSub{
    [self addSubview:self.nameLabel];
    [self addSubview:self.moneyLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(20);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_centerY);
    }];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(@25);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_centerY).offset(-8);
    }];
    
}
- (void)setTypeName:(NSString *)typeName{
    _typeName = typeName;
    self.nameLabel.text = _typeName;
}
-(void)setMoneyName:(NSString *)moneyName{
    _moneyName = moneyName;
    [self.moneyLabel xb_HighlightText:moneyName withDefultText:@"万"];
}
-(QMUILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[QMUILabel alloc]init];
        _nameLabel.textColor = QMUICMI.separatorColor;
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textAlignment  = NSTextAlignmentCenter;
    }
    return _nameLabel;
}
-(XBAttributedLabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[XBAttributedLabel alloc]init];
        _moneyLabel.highLightFont = [UIFont boldSystemFontOfSize:24];
        _moneyLabel.OtherFont = [UIFont systemFontOfSize:12];
        _moneyLabel.textAlignment  = NSTextAlignmentCenter;
        
    }
    
    return _moneyLabel;
}
@end

@interface XBMyInsuranceCardView ()
@property (weak, nonatomic) IBOutlet XBBordeRadiusView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet QMUIGridView *gridView;
@property (nonatomic, assign)NSInteger count;
@end

@implementation XBMyInsuranceCardView
+(instancetype)initWithXib{
    XBMyInsuranceCardView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    [view awakeFromNib];
    return view;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
   self =  [super initWithCoder:aDecoder];
    if (self) {
 
        [self _configerSubs];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self _configerSubs];
}

- (void)setDelegate:(id<XBMyInsuranceCardViewDelegate>)delegate{
        _delegate = delegate;
}
-(void)xb_reloadData{
     [self _configerData];
}

-(void)_configerData{
    [self.gridView removeAllSubviews];
    if ([self.delegate respondsToSelector:@selector(xb_InsuranceCardConfigerTitle)]) {
        self.titleLabel.text = [self.delegate xb_InsuranceCardConfigerTitle];
    }
    if ([self.delegate respondsToSelector:@selector(xb_InsuranceCardViewConfigerNumber)]) {
        self.count = [self.delegate xb_InsuranceCardViewConfigerNumber];
        for (NSInteger i  = 0 ;i < self.count;i ++) {
            XBMyInsuranceCardItem *item = [[XBMyInsuranceCardItem alloc]init];
            item.typeName = [self.delegate xb_InsuranceCardItemTypeTitleAtIndex:i];
            item.moneyName = [self.delegate xb_insuranceCardItemCoverageAtIndex:i];
            [self.gridView addSubview:item];
        }
    }
}
- (void)_configerSubs{
    self.gridView.columnCount = 4;
    self.gridView.rowHeight = self.qmui_width/4;
    self.line.backgroundColor = QMUICMI.separatorColor;
    self.bgView.layer.cornerRadius = 12;
    self.bgView.layer.qmui_maskedCorners = QMUILayerMinXMinYCorner|QMUILayerMaxXMinYCorner|QMUILayerMinXMaxYCorner|QMUILayerMaxXMaxYCorner;
    self.gridView.layer.cornerRadius = 12;
    self.gridView.layer.qmui_maskedCorners = QMUILayerMinXMaxYCorner|QMUILayerMaxXMaxYCorner;
}




@end
