//
//  XBTextField.h
//  XHW_APP
//
//  Created by 韩冰 on 2019/1/7.
//  Copyright © 2019 韩冰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JVFloatLabeledTextField/JVFloatLabeledTextField.h>

@interface XBTextField : JVFloatLabeledTextField

@property(nonatomic,strong,readonly)UIButton *rightBtn;

- (instancetype)initWithPlaceHoder:(NSString *)placeholder
                     floatingTitle:(NSString *)floatingTitle
                    rightViewTitle:(NSString *)title
                    rightViewImage:(UIImage *)image;

- (void)xbTextFieldChangeRightViewBtn:(BOOL)isSelect WithTitle:(NSString *)title;
@end

