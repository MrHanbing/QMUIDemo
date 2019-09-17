//
//  XBTimeLine.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/9.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBTimeLine.h"
#import <UIView+YYAdd.h>
#import <CALayer+YYAdd.h>
#import <Masonry.h>

#define RippleAnimationAvatarSize CGSizeMake(16, 16)
#define RippleAnimationExpandSizeValue 12
#define RippleAnimationDuration 1.0
#define RippleAnimationLineWidth 2.0

@interface XBTimeLineItem()
@property (nonatomic, strong)CALayer *defultLayer;
@property (nonatomic, strong)CALayer *selectLayer;
@property (nonatomic, strong)CATextLayer *textLayer;
@property (nonatomic, strong)CAShapeLayer *animalLayer;
@property (nonatomic, assign)XBTimeLineItemState state;

@end

@implementation XBTimeLineItem

///1. 创建灰色背景色
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor].CGColor;
        self.frame = frame;
        [self createTimeLineItem];
    }
    return self;
}


-(void)createTimeLineItem{

}

- (void)setState:(XBTimeLineItemState)state{
    _state = state;
    if (_state == XBTimeLineItemStateDefult) {
        [self addSublayer:self.defultLayer];
        [self addSublayer:self.textLayer];
        self.defultLayer.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"].CGColor;
         self.textLayer.fontSize = 16;
         self.textLayer.frame =  CGRectMake(0, self.frame.size.height/2.0 - 18, self.frame.size.width, 25);
        self.textLayer.foregroundColor = [UIColor colorWithHexString:@"#666666"].CGColor;
        
    } else if(_state == XBTimeLineItemStateSelect){
        self.selectLayer.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"].CGColor;
        
        self.textLayer.foregroundColor =   [UIColor colorWithHexString:@"#666666"].CGColor;
         self.textLayer.fontSize = 16;
        [self addSublayer:self.selectLayer];
        self.textLayer.fontSize = 16;
        self.textLayer.frame =  CGRectMake(0, self.frame.size.height/2.0 - 18, self.frame.size.width, 25);
        self.textLayer.foregroundColor = [UIColor colorWithHexString:@"#666666"].CGColor;
        
        [self addSublayer:self.textLayer];
        
    }else{
        self.animalLayer.backgroundColor = QMUICMI.yellowColor.CGColor;
        self.textLayer.foregroundColor = QMUICMI.blackColor.CGColor;
        self.textLayer.fontSize = 20;
        self.textLayer.frame =  CGRectMake(0, self.frame.size.height/2.0 - 24, self.frame.size.width, 25);
        
        [self addSublayer:self.animalLayer];
        [self addSublayer:self.textLayer];
    }
}
- (CALayer *)selectLayer{
    if (!_selectLayer) {
        _selectLayer = [CALayer  layer];
        _selectLayer.frame = CGRectMake(0, 0, 12, 12);
        _selectLayer.cornerRadius = 6;
        _selectLayer.masksToBounds = YES;
        _selectLayer.frame =   CGRectMake(self.frame.size.width/2.0 - 2, self.frame.size.height - 11-6, 12, 12);
        _selectLayer.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"].CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth     = 2;
        path.lineCapStyle  = kCGLineCapRound;
        path.lineJoinStyle = kCGLineCapRound;;
        [path moveToPoint:CGPointMake(3, 6)];
        [path addLineToPoint:CGPointMake(6, 8)];
        [path addLineToPoint:CGPointMake(9, 4)];
//        [path stroke];
//        _selectLayer.accessibilityPath = path;
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        layer.strokeColor =QMUICMI.whiteColor.CGColor;
        layer.fillColor = UIColorClear.CGColor;
        layer.lineWidth = RippleAnimationLineWidth;
        [_selectLayer addSublayer:layer];
        ////添加b白色对勾
        
    }
    return _selectLayer;
}
- (CALayer *)defultLayer{
    if (!_defultLayer) {
        _defultLayer = [CALayer  layer];
        _defultLayer.frame = CGRectMake(0, 0, 8, 8);
        _defultLayer.cornerRadius = 4;
        _defultLayer.masksToBounds = YES;
        _defultLayer.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"].CGColor;
        _defultLayer.frame =   CGRectMake(self.frame.size.width/2.0 - 2, self.frame.size.height -  11 - 3, 8, 8);
    }
    return _defultLayer;
}
-(CATextLayer *)textLayer{
    if (!_textLayer) {
        _textLayer = [CATextLayer layer];
        _textLayer.fontSize = 16;
        _textLayer.string = @"哈哈";
        _textLayer.alignmentMode = kCAAlignmentCenter;
        _textLayer.contentsScale = [UIScreen mainScreen].scale;
        _textLayer.foregroundColor = [UIColor colorWithHexString:@"#666666"].CGColor;
        _textLayer.frame =  CGRectMake(0, self.frame.size.height/2.0 - 30, self.frame.size.width, 25);
    }
    return _textLayer;
}

- (CAShapeLayer *)animalLayer{
    if (!_animalLayer) {
        _animalLayer =[self animationLayerWithPath:[UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(self.frame.size.width/2.0 - 4, self.frame.size.height- 11 -5, 12, 12),RippleAnimationLineWidth,RippleAnimationLineWidth)]];
        _animalLayer.fillColor = QMUICMI.yellowColor.CGColor;
        _animalLayer.strokeColor = QMUICMI.yellowColor.CGColor;
        [self animationReplicatorAvatarAnimated:YES];
    }
    return _animalLayer;
}
- (void)animationReplicatorAvatarAnimated:(BOOL)animated {

    if (!animated) {
        return;
    }
    ///贝塞尔
     UIBezierPath *  _initPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(self.frame.size.width/2.0 - 4, self.frame.size.height -11 -5, 12, 12),RippleAnimationLineWidth,RippleAnimationLineWidth)];
    
    UIBezierPath *_finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.frame.size.width/2.0 - 6, self.frame.size.height-11 - 7, 16, 16)];
    CAShapeLayer *layer2 = [self animationLayerWithPath:_initPath];
    [self addSublayer:layer2];
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.fromValue = (id)_initPath.CGPath;
    pathAnimation.toValue = (id)_finalPath.CGPath;
//
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @1;
    opacityAnimation.toValue = @0;
//
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[pathAnimation, opacityAnimation];
    groupAnimation.duration = RippleAnimationDuration;
    groupAnimation.repeatCount = HUGE_VALF;
    groupAnimation.removedOnCompletion = NO;
    
    groupAnimation.beginTime = CACurrentMediaTime() + RippleAnimationDuration / 3;
    [layer2 addAnimation:groupAnimation forKey:nil];
    groupAnimation.beginTime = CACurrentMediaTime() + 2 * RippleAnimationDuration / 3;
}
- (CAShapeLayer *)animationLayerWithPath:(UIBezierPath *)path {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.strokeColor =QMUICMI.yellowColor.CGColor;
    layer.fillColor = UIColorClear.CGColor;
    layer.lineWidth = RippleAnimationLineWidth;
    return layer;
}


@end


@interface XBTimeLine()

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)CALayer *defultLayer;
@property (nonatomic, strong)CALayer *selectLayer;
@property (nonatomic, strong)NSArray *itemArr;
@end

@implementation XBTimeLine

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createTimeLine];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTimeLine];
    }
    return self;
    
}

-(void)createTimeLine{

    double W = SCREEN_WIDTH/4;
    double lineW = SCREEN_WIDTH - SCREEN_WIDTH/4;
    [self.layer addSublayer:self.defultLayer];
    self.defultLayer.frame = CGRectMake( SCREEN_WIDTH/4/2.0,self.height - 10, lineW, 1);
    [self.layer addSublayer:self.selectLayer];
    self.selectLayer.frame = CGRectMake( SCREEN_WIDTH/4/2.0,self.height - 10, lineW *2/3, 1);
    for (int i = 0; i < 4; i ++) {
        XBTimeLineItem *item = [[XBTimeLineItem alloc]initWithFrame:CGRectMake(W * i, 0, W, self.height)];
        item.textLayer.string = self.titleArr[i];
        [self.layer addSublayer:item];
     
        if (i <2) {
            item.state = XBTimeLineItemStateSelect;
        } else  if (i == 2){
                item.state = XBTimeLineItemStateAnimal;
        }else{
                item.state = XBTimeLineItemStateDefult;
        }
    }
}

-(NSArray *)titleArr{
    
    return @[@"购买服务",@"问卷提交",@"对接顾问",@"方案设计"];
}

- (CALayer *)defultLayer{
    if (!_defultLayer) {
        _defultLayer = [CALayer  layer];
        _defultLayer.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"].CGColor;
    }
    return _defultLayer;
}

- (CALayer *)selectLayer{
    if (!_selectLayer) {
        _selectLayer = [CALayer  layer];
        _selectLayer.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"].CGColor;
    }
    return _selectLayer;
}



@end
