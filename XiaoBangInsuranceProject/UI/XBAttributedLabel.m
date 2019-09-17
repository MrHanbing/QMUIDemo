//
//  XBPriceLabel.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/8/26.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBAttributedLabel.h"

@implementation XBAttributedLabel

- (void)xb_HighlightText:(NSString *)highLightText withDefultText:(NSString *)defultText{
    
    if (highLightText.length == 0) {
        return;
    }
    NSMutableAttributedString * highLight = [[NSMutableAttributedString alloc]initWithString:highLightText];
    [highLight addAttributes:@{
                               NSForegroundColorAttributeName :[UIColor qmui_colorWithHexString:@"#FF6619"],
                               NSFontAttributeName :self.highLightFont
                               } range:NSMakeRange(0, highLightText.length)];



    NSMutableAttributedString * defult = [[NSMutableAttributedString alloc]initWithString:defultText];
    [defult addAttributes:@{
                         NSForegroundColorAttributeName :QMUICMI.grayColor,
                         NSFontAttributeName :self.OtherFont
                         } range:NSMakeRange(0, defultText.length)];
    
    [highLight appendAttributedString:defult];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:self.textAlignment];
    [highLight addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [highLight length])];
    [self setAttributedText: highLight];
}
@end
