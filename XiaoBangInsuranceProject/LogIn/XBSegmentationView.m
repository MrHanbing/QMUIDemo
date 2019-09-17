//
//  XBSegmentationView.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/16.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBSegmentationView.h"

@interface  XBSegmentationView()

@property (weak, nonatomic) IBOutlet UIView *rightV;
@property (weak, nonatomic) IBOutlet UIView *leftV;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;


@end

@implementation XBSegmentationView

+(instancetype)initWithXib{
    XBSegmentationView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    [view awakeFromNib];
    return view;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
  self =  [super initWithCoder:aDecoder];
     if (self) {

     }
     return self;
 }
- (void)awakeFromNib{
    [super awakeFromNib];
    self.rightV.backgroundColor = QMUICMI.separatorColor;
    self.leftV.backgroundColor = QMUICMI.separatorColor;
    self.tipLabel.textColor = QMUICMI.separatorColor;
}
@end
