//
//  XHWLogInView.m
//  XHW_APP
//
//  Created by 韩冰 on 2019/1/7.
//  Copyright © 2019 韩冰. All rights reserved.
//

#import "XBTextField.h"
#import <Masonry/Masonry.h>

@implementation XBTextField

- (instancetype)initWithPlaceHoder:(NSString *)placeholder floatingTitle:(NSString *)floatingTitle rightViewTitle:(NSString *)title rightViewImage:(UIImage *)image
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
//        self = [[XBTextField alloc] initWithFrame:CGRectZero];
        self.font = [UIFont systemFontOfSize:18];
        // 浮动式标签的正常字体颜色
        self.floatingLabelTextColor = [UIColor blackColor];
        // 输入框成为第一响应者时,浮动标签的文字颜色.
        self.floatingLabelActiveTextColor = [UIColor blackColor];
        // 指明当输入文字时,是否下调基准线(baseline).设置为YES(非默认值),意味着占位内容会和输入内容对齐.
        self.keepBaseline = YES;
        // 设置占位符文字和浮动式标签的文字.
        [self setPlaceholder:placeholder
               floatingTitle:floatingTitle];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        
//        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        leftBtn.frame = CGRectMake(0, 0, 30, 40);
//        [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
//        [leftBtn setImage:UIImageMake(@"edit") forState:UIControlStateNormal];
//        self.leftView = leftBtn;
//        self.leftViewMode = UITextFieldViewModeAlways;

        UIView *line = [[UIView alloc] init];
        line.backgroundColor = QMUICMI.separatorColor;
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.equalTo(@0.5);
        }];
        
        /// 右侧按钮
        if (title.length > 0 || image) {
            self.rightViewMode = UITextFieldViewModeAlways;
            _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_rightBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:(UIControlStateNormal)];
            if (image) {
                [_rightBtn setImage:image forState:(UIControlStateNormal)];
            }else if (title){
                _rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
                [_rightBtn setTitle:title forState:(UIControlStateNormal)];
                _rightBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            }
            self.rightView = _rightBtn;
        }
    }
    return self;
}

- (void)xbTextFieldChangeRightViewBtn:(BOOL)isSelect WithTitle:(NSString *)title {
    [_rightBtn setTitle:title forState:UIControlStateNormal];
    if (isSelect == NO) {
        [_rightBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:(UIControlStateNormal)];
    }else{
        [_rightBtn setTitleColor:[UIColor colorWithHexString:@"#2C8FFF"] forState:(UIControlStateNormal)];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
//    CGFloat h = self.bounds.size.height/2.0;
    int top = 0;
    int right = 0;
    NSString *title = _rightBtn.titleLabel.text;
    UIImage *image = _rightBtn.imageView.image;
    if (title) {
        CGSize size = [title sizeWithAttributes:@{
                                                  NSFontAttributeName:[UIFont systemFontOfSize:18]
                                                  }];
        _rightBtn.frame = CGRectMake(self.bounds.size.width- size.width - 18, (self.bounds.size.height - size.height) /2.0,size.width + 12,size.height +12);
        
    }else if (image){
        top = (_rightBtn.bounds.size.height-image.size.height)/2;
        right = (_rightBtn.bounds.size.width-image.size.width)/2+5;
        _rightBtn.imageEdgeInsets = UIEdgeInsetsMake(top, 0, 0, -right);
    }
}

@end
