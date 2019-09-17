//
//  XBOptimizationCell.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/12.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBOptimizationCell.h"
#import "XBGhostButton.h"
#import "XBOptimizationItemCell.h"
@interface XBOptimizationCell ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet QMUIFloatLayoutView *tagsView;
@property (weak, nonatomic) IBOutlet QMUILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tagView_H;
@property (nonatomic, copy)NSMutableArray *tagArray;
@property (nonatomic, assign)CGFloat height;

@end

@implementation XBOptimizationCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"XBOptimizationCell";
    XBOptimizationCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:ID bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.tagsView.itemMargins = UIEdgeInsetsMake(4, 4, 4, 4);
    self.tipsLabel.contentEdgeInsets =  UIEdgeInsetsMake(4, 4, 4, 4);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)setOptimizationDataSource:(id<XBOptimizationCellDataSource>)OptimizationDataSource{
    
    if (_OptimizationDataSource != OptimizationDataSource) {
        _OptimizationDataSource = OptimizationDataSource;
        if ([_OptimizationDataSource respondsToSelector:@selector(xb_OptimizationTagsCount)]) {
            NSInteger Count = [_OptimizationDataSource xb_OptimizationTagsCount];
            for (NSInteger i = 0; i < Count;i ++) {
                if ([_OptimizationDataSource respondsToSelector:@selector(xb_OptimizationTagsTitle:)]){
                    NSString *title = [_OptimizationDataSource xb_OptimizationTagsTitle:i];
                    XBGhostButton *button = [[XBGhostButton alloc] init];
                    [button setTitle:title forState:UIControlStateNormal];
                    button.titleLabel.font = UIFontMake(12);
                    button.contentEdgeInsets = UIEdgeInsetsMake(4, 12, 4, 12);
                    button.fillColor = UIColor.groupTableViewBackgroundColor;
                    button.titleTextColor = [UIColor grayColor];
                    [self.tagsView addSubview:button];
                    [button addTarget:self action:@selector(tagAction:) forControlEvents:UIControlEventTouchUpInside];
                    [self.tagArray addObject:button];
                }
            }
        }
         CGSize floatLayoutViewSize = [self.tagsView sizeThatFits:CGSizeMake(SCREEN_WIDTH, CGFLOAT_MAX)];
        self.tagView_H.constant = floatLayoutViewSize.height;

        if ([_OptimizationDataSource respondsToSelector:@selector(xb_OptimizationTips:)]) {
            NSString *tips = [_OptimizationDataSource xb_OptimizationTips:0];
            self.tipsLabel.text = tips;
        }
        if ([_OptimizationDataSource respondsToSelector:@selector(xb_OptimizationHeight:)]) {
                [_OptimizationDataSource xb_OptimizationHeight:self.tagsView.qmui_height + self.tipsLabel.qmui_height + 28 + 5*110];
        }
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([self.OptimizationDataSource respondsToSelector:@selector(xb_OptimizationTableView:numberOfRowsInSection:tagIndex:)]) {
     return   [self.OptimizationDataSource xb_OptimizationTableView:tableView numberOfRowsInSection:0 tagIndex:1];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XBOptimizationItemCell *cell = [XBOptimizationItemCell cellWithTableView:tableView];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
}
- (void)tagAction:(XBGhostButton *)button{

  
}


-(NSMutableArray *)tagArray{
    if (!_tagArray) {
        _tagArray = [NSMutableArray array];
    }
    return _tagArray;
}





@end
