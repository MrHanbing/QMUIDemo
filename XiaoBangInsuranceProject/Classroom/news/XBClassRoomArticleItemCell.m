//
//  XBClassRoomArticleItemCell.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/13.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBClassRoomArticleItemCell.h"

@interface XBClassRoomArticleItemCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet QMUILabel *authLabel;
@property (weak, nonatomic) IBOutlet QMUILabel *redCountLabel;
@property (weak, nonatomic) IBOutlet UIView *line;

@end

@implementation XBClassRoomArticleItemCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"XBClassRoomArticleItemCell";
    XBClassRoomArticleItemCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:ID bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}

- (void)xb_cellConfigureArticleTitle:(NSString *)title withArticleAuth:(NSString *)articleAuth withCoverUrl:(NSString *)url withReadCount:(NSInteger)count withStatus:(NSInteger)status withtagName:(NSString *)tagName{
    self.nameLabel.text = title;
    [self.icon setImageWithURL:[NSURL URLWithString:url] placeholder:nil];
    self.authLabel.text = [NSString stringWithFormat:@"%@·%@",tagName,articleAuth];
    self.redCountLabel.text = [NSString stringWithFormat:@"%ld阅读",count];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.icon.layer.cornerRadius = 4;
    self.icon.layer.masksToBounds = YES;
    self.line.backgroundColor = QMUICMI.separatorColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
