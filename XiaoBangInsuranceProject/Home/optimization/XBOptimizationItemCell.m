//
//  XBOptimizationItemCell.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/12.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBOptimizationItemCell.h"
@interface XBOptimizationItemCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation XBOptimizationItemCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"XBOptimizationItemCell";
    XBOptimizationItemCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:ID bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.icon.layer.cornerRadius = 4;
    self.icon.layer.masksToBounds = YES;
    // Initialization code
}

-(void)xb_cellConfigureIcon:(NSString *)iconUrl withName:(NSString *)name withMarketingTags:(NSString *)marketingTags{
    
//    NSString *charactersToEscape = @"!$&'()*+,-./:;=?@_~%#[]";
//    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
//    NSString *encodedUrl = [iconUrl stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
////    NSLog(@"\n%@\n%@",encodedUrl,encodedString1);

    NSString *urlStr = (NSString *)



    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
    
                                                              (CFStringRef)iconUrl, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    [self.icon setImageWithURL:[NSURL URLWithString:urlStr] placeholder:nil];
    self.nameLabel.text = name;
    self.tipLabel.text = marketingTags;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
