//
//  XBParallaxHeader.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/1.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 The parallac header mode.
 */
typedef NS_ENUM(NSInteger, XBParallaxHeaderMode) {
    /**
     The option to scale the content to fill the size of the header. Some portion of the content may be clipped to fill the header’s bounds.
     */
    XBParallaxHeaderModeFill = 0,
    /**
     The option to scale the content to fill the size of the header and aligned at the top in the header's bounds.
     */
    XBParallaxHeaderModeTopFill,
    /**
     The option to center the content aligned at the top in the header's bounds.
     */
    XBParallaxHeaderModeTop,
    /**
     The option to center the content in the header’s bounds, keeping the proportions the same.
     */
    XBParallaxHeaderModeCenter,
    /**
     The option to center the content aligned at the bottom in the header’s bounds.
     */
    XBParallaxHeaderModeBottom
};

@protocol XBParallaxHeaderDelegate;

/**
 The XBParallaxHeader class represents a parallax header for UIScrollView.
 */
@interface XBParallaxHeader : NSObject

/**
 The content view on top of the UIScrollView's content.
 */
@property (nonatomic,readonly) UIView *contentView;

/**
 Delegate instance that adopt the MXScrollViewDelegate.
 */
@property (nonatomic,weak,nullable) IBOutlet id<XBParallaxHeaderDelegate> delegate;

/**
 The header's view. 背景 View
 */
@property (nonatomic,strong,nullable) IBOutlet UIView *view;


/**
 The header's default height. 0 0 by default.
 */
@property (nonatomic) IBInspectable CGFloat height;

/**
 The header's minimum height while scrolling up. 0 by default.
 */
@property (nonatomic) IBInspectable CGFloat minimumHeight;

/**
 The parallax header behavior mode.
 */
@property (nonatomic) XBParallaxHeaderMode mode;

/**
 The parallax header progress value.
 */
@property (nonatomic,readonly) CGFloat progress;

@property(nonatomic, strong) UIActivityIndicatorView *refreshView;


///头
@property(nonatomic, strong) UIView *headerView;

/** 进入刷新状态 */
- (void)beginRefreshing;
- (void)refreshingWithCompletionBlock:(void (^)(void))completionBlock;
- (void)stopRefreshing;
/**
 Loads a `view` from the nib file in the specified bundle.
 
 @param name The name of the nib file, without any leading path information.
 @param bundleOrNil The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle.
 @param optionsOrNil A dictionary containing the options to use when opening the nib file. For a list of available keys for this dictionary, see NSBundle UIKit Additions.
 */
- (void)loadWithNibName:(NSString *)name bundle:(nullable NSBundle *)bundleOrNil options:(nullable NSDictionary<UINibOptionsKey, id> *)optionsOrNil;

@end

/**
 The method declared by the XBParallaxHeaderDelegate protocol allow the adopting delegate to respond to scoll from the XBParallaxHeader class.
 */
@protocol XBParallaxHeaderDelegate <NSObject>

@optional

/**
 Tells the header view that the parallax header did scroll.
 The view typically implements this method to obtain the change in progress from parallaxHeaderView.
 
 @param parallaxHeader The parallax header that scrolls.
 */
- (void)parallaxHeaderDidScroll:(XBParallaxHeader *)parallaxHeader;

@end

DEPRECATED_MSG_ATTRIBUTE("Use the XBParallaxHeader's delegate property instead.")
@protocol XBParallaxHeader <XBParallaxHeaderDelegate>
@end

/**
 A UIScrollView category with a XBParallaxHeader.
 */
@interface UIScrollView (XBParallaxHeader)

/**
 The parallax header.
 */
@property (nonatomic, strong) IBOutlet XBParallaxHeader *parallaxHeader;

@end

NS_ASSUME_NONNULL_END

