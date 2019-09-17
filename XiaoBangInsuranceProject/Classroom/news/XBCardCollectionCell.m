//
//  XBCardCollectionCell.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBCardCollectionCell.h"
@interface XBCardCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@end

@implementation XBCardCollectionCell

-(void)setIconName:(NSString *)iconName{
    _iconName = iconName;
    self.icon.image = UIImageMake(_iconName);
}
@end
