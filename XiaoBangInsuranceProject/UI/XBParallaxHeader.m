//
//  XBParallaxHeader.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/1.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBParallaxHeader.h"
#import <MJRefresh/MJRefresh.h>
#import <objc/runtime.h>

@interface XBParallaxView : UIView
@property (nonatomic,weak) XBParallaxHeader *parent;
@end

@implementation XBParallaxView

static void * const kXBParallaxHeaderKVOContext = (void*)&kXBParallaxHeaderKVOContext;

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if ([self.superview isKindOfClass:[UIScrollView class]]) {
        [self.superview removeObserver:self.parent forKeyPath:NSStringFromSelector(@selector(contentOffset)) context:kXBParallaxHeaderKVOContext];
    }
}

- (void)didMoveToSuperview{
    if ([self.superview isKindOfClass:[UIScrollView class]]) {
        [self.superview addObserver:self.parent
                         forKeyPath:NSStringFromSelector(@selector(contentOffset))
                            options:NSKeyValueObservingOptionNew
                            context:kXBParallaxHeaderKVOContext];
    }
}

@end

@interface XBParallaxHeader ()


@property (nonatomic,weak) UIScrollView *scrollView;
//@property (nonatomic, strong)
@property (nonatomic, copy)dispatch_block_t refreshBlock;

@end

@implementation XBParallaxHeader {
    BOOL _isObserving;
}

@synthesize contentView = _contentView;

#pragma mark Properties

- (UIView *)contentView {
    if (!_contentView) {
        XBParallaxView *contentView = [XBParallaxView new];
        contentView.parent = self;
        contentView.clipsToBounds = YES;
//        contentView.backgroundColor = [UIColor redColor];
        _contentView = contentView;
    }
    return _contentView;
}

- (void)setView:(UIView *)view {
    if (view != _view) {
        [_view removeFromSuperview];
        
        _view = view;
        [self updateConstraints];
    }
}

- (void)setMode:(XBParallaxHeaderMode)mode {
    if (_mode != mode) {
        _mode = mode;
        [self updateConstraints];
    }
}

- (void)setHeight:(CGFloat)height {
    if (_height != height) {
        
        //Adjust content inset
        [self adjustScrollViewTopInset:self.scrollView.contentInset.top - _height + height];
        
        _height = height;
        [self updateConstraints];
        [self layoutContentView];
    }
}

- (void)setMinimumHeight:(CGFloat)minimumHeight {
    _minimumHeight = minimumHeight;
    [self layoutContentView];
}

- (void)setScrollView:(UIScrollView *)scrollView {
    if (_scrollView != scrollView) {
        _scrollView = scrollView;
        
        //Adjust content inset
        [self adjustScrollViewTopInset:scrollView.contentInset.top + self.height];
        [scrollView addSubview:self.contentView];
        
        //Layout content view
        [self layoutContentView];
        _isObserving = YES;
    }
}

- (void)setProgress:(CGFloat)progress {
    if(_progress != progress) {
        _progress = progress;
        
        if ([self.delegate respondsToSelector:@selector(parallaxHeaderDidScroll:)]) {
            [self.delegate parallaxHeaderDidScroll:self];
        }
    }
}

- (void)loadWithNibName:(NSString *)name bundle:(nullable NSBundle *)bundleOrNil options:(nullable NSDictionary<UINibOptionsKey, id> *)optionsOrNil {
    UINib *nib = [UINib nibWithNibName:name bundle:bundleOrNil];
    [nib instantiateWithOwner:self options:optionsOrNil];
}

#pragma mark Constraints

- (void)updateConstraints {
    if (!self.view) {
        return;
    }
    
    [self.view removeFromSuperview];
    [self.contentView addSubview:self.view];
    self.refreshView.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    switch (self.mode) {
        case XBParallaxHeaderModeFill:
            [self setFillModeConstraints];
            break;
            
        case XBParallaxHeaderModeTopFill:
            [self setTopFillModeConstraints];
            break;
            
        case XBParallaxHeaderModeTop:
            [self setTopModeConstraints];
            break;
            
        case XBParallaxHeaderModeBottom:
            [self setBottomModeConstraints];
            break;
            
        default:
            [self setCenterModeConstraints];
            break;
    }
}

- (void)setCenterModeConstraints {
    [self.view.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [self.view.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [self.view.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
    [self.view.heightAnchor constraintEqualToConstant:self.height].active = YES;
}

- (void)setFillModeConstraints {
    [self.view.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [self.view.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [self.view.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [self.view.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    

}

- (void)setTopFillModeConstraints {
    [self.view.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [self.view.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [self.view.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [self.view.heightAnchor constraintGreaterThanOrEqualToConstant:self.height].active = YES;
    
    NSLayoutConstraint *constraint = [self.view.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor];
    constraint.priority = UILayoutPriorityDefaultHigh;
    constraint.active = YES;
}

- (void)setTopModeConstraints {
    [self.view.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [self.view.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [self.view.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [self.view.heightAnchor constraintEqualToConstant:self.height].active = YES;
}

- (void)setBottomModeConstraints {
    [self.view.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [self.view.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [self.view.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    [self.view.heightAnchor constraintEqualToConstant:self.height].active = YES;
    
    [self.refreshView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [self.refreshView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [self.refreshView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [self.refreshView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

- (UIActivityIndicatorView *)refreshView{
    if(!_refreshView){
        _refreshView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray size:CGSizeMake(30, 30)];
         _refreshView.hidesWhenStopped = NO;
        [_refreshView stopAnimating];
        _refreshView.color = [UIColor blackColor];
        [self.contentView addSubview:_refreshView];
    }
    return _refreshView;
}
#pragma mark Private Methods

- (void)layoutContentView {
    CGFloat minimumHeight = MIN(self.minimumHeight, self.height);
    CGFloat relativeYOffset = self.scrollView.contentOffset.y + self.scrollView.contentInset.top - self.height;
    CGFloat relativeHeight  = -relativeYOffset;
    
    CGRect frame = (CGRect){
        .origin.x       = 0,
        .origin.y       = relativeYOffset,
        .size.width     = self.scrollView.frame.size.width,
        .size.height    = MAX(relativeHeight, minimumHeight)
    };

    
    self.contentView.frame = frame;

    CGFloat div = self.height - self.minimumHeight;
    if (div == 0 && self.height == 0) {
        self.progress = 0;
        return;
    }
    self.progress = (self.contentView.frame.size.height - self.minimumHeight) / (div? : self.height);
    [self beginRefreshing];
   
}

/** 进入刷新状态 */
- (void)beginRefreshing{
    if (!self.scrollView.isDragging &&self.progress > 1 && self.refreshView.isAnimating == NO && self.scrollView.decelerating) {
        [self.refreshView startAnimating];
        [self.scrollView setDirectionalLockEnabled:YES];
        [self.scrollView setContentOffset:self.scrollView.contentOffset animated:YES];
        if ( self.refreshBlock){
            self.refreshBlock();
        }
    }
}

-(void)refreshingWithCompletionBlock:(void (^)(void))completionBlock{
    self.refreshBlock = completionBlock;
}

- (void)stopRefreshing{
  
//    [self.scrollView setContentOffset:CGPointMake(0,  -self.contentView.height) animated:YES];
//    self.scrollView.scrollEnabled = YES;
    [self.refreshView stopAnimating];
}


- (void)adjustScrollViewTopInset:(CGFloat)top {
    UIEdgeInsets inset = self.scrollView.contentInset;
    
    //Adjust content offset
    CGPoint offset = self.scrollView.contentOffset;
    offset.y += inset.top - top;
    self.scrollView.contentOffset = offset;
    
    //Adjust content inset
    inset.top = top;
    self.scrollView.contentInset = inset;
}

#pragma mark KVO

//This is where the magic happens...
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if (context == kXBParallaxHeaderKVOContext) {
        if ([keyPath isEqualToString:NSStringFromSelector(@selector(contentOffset))]) {
            [self layoutContentView];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end

@implementation UIScrollView (XBParallaxHeader)

- (XBParallaxHeader *)parallaxHeader {
    XBParallaxHeader *parallaxHeader = objc_getAssociatedObject(self, @selector(parallaxHeader));
    if (!parallaxHeader) {
        parallaxHeader = [XBParallaxHeader new];
        [self setParallaxHeader:parallaxHeader];
    }
    return parallaxHeader;
}

- (void)setParallaxHeader:(XBParallaxHeader *)parallaxHeader {
    parallaxHeader.scrollView = self;
    objc_setAssociatedObject(self, @selector(parallaxHeader), parallaxHeader, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
