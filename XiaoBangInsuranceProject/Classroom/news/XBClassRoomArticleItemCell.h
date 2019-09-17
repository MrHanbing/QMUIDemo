//
//  XBClassRoomArticleItemCell.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/13.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBClassRoomArticleItemCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)xb_cellConfigureArticleTitle:(NSString *)title withArticleAuth:(NSString *)articleAuth withCoverUrl:(NSString *)url withReadCount:(NSInteger)count withStatus:(NSInteger)status withtagName:(NSString *)tagName;
@end

NS_ASSUME_NONNULL_END
