//
//  XBGhostButton.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/12.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBGhostButton.h"

@implementation XBGhostButton
-(instancetype)init{
    
    self = [super init];
    if (self) {
        self.titleLabel.font = UIFontMake(14);
        self.contentEdgeInsets = UIEdgeInsetsMake(4, 12, 4, 12);
        self.fillColor = UIColor.whiteColor;
        self.titleTextColor = [UIColor colorWithHexString:@"#666666"];
        self.layer.borderColor = [[UIColor colorWithHexString:@"#EDEDED"] CGColor];
        self.layer.borderWidth = 1;
    }
    return self;
}
@end
