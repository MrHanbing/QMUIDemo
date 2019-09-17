//
//  QDCommonUI.h
//  qmuidemo
//
//  Created by QMUI Team on 16/8/8.
//  Copyright © 2016年 QMUI Team. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Colors

#define UIColorGray1 UIColorMake(53, 60, 70)
#define UIColorGray2 UIColorMake(73, 80, 90)

////文本深灰
#define UIColorGray3 UIColorMake(102, 102, 102)
#define UIColorGray4 UIColorMake(113, 120, 130)
#define UIColorGray5 UIColorMake(133, 140, 150)
#define UIColorGray6 UIColorMake(153, 160, 170)

////文本浅灰
#define UIColorGray7 UIColorMake(153, 153, 153)
#define UIColorGray8 UIColorMake(196, 200, 208)
#define UIColorGray9 UIColorMake(216, 220, 228)

#define UIColorTheme1 UIColorMake(239, 83, 98) // Grapefruit
#define UIColorTheme2 UIColorMake(254, 109, 75) // Bittersweet
#define UIColorTheme3 UIColorMake(255, 207, 71) // Sunflower
#define UIColorTheme4 UIColorMake(159, 214, 97) // Grass
#define UIColorTheme5 UIColorMake(63, 208, 173) // Mint
#define UIColorTheme6 UIColorMake(49, 189, 243) // Aqua
#define UIColorTheme7 UIColorMake(90, 154, 239) // Blue Jeans
#define UIColorTheme8 UIColorMake(172, 143, 239) // Lavender
#define UIColorTheme9 UIColorMake(238, 133, 193) // Pink Rose

#define UI_isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断设备型号
#define UI_IS_IOS8_AND_HIGHER   ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)

#define UI_IS_IPHONE            ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)


//判断iPhone4系列
#define UI_IS_IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)
//判断iPhone5系列
#define UI_IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)
//判断iPhone6系列
#define UI_IS_IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)
//判断iphone6+系列
#define UI_IS_IPHONEPLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)
#define UI_isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断设备型号
#define UI_IS_IOS8_AND_HIGHER   ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)

#define UI_IS_IPHONE            ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)


//判断iPhone4系列
#define UI_IS_IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)
//判断iPhone5系列
#define UI_IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)
//判断iPhone6系列
#define UI_IS_IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)
//判断iphone6+系列
#define UI_IS_IPHONEPLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)

#define UI_IS_IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)
//判断iPHoneXr
#define UI_IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)
//判断iPhoneXs
#define UI_IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)
//判断iPhoneXs Max
#define UI_IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !UI_isPad : NO)
///
#define THEAPP          [UIApplication sharedApplication].delegate
#define SafeAreaTopHeight       ((UI_IS_IPHONEX  == YES ||UI_IS_IPHONE_Xr == YES||UI_IS_IPHONE_Xs == YES||UI_IS_IPHONE_Xs_Max == YES) ? 88 : 64)

#define SafeAreaBottomHeight    (( UI_IS_IPHONEX == YES|| UI_IS_IPHONE_Xr == YES ||UI_IS_IPHONE_Xs== YES ||UI_IS_IPHONE_Xs_Max == YES)  ? 34 : 0)

#define StatusHeight            (( UI_IS_IPHONEX == YES ||UI_IS_IPHONE_Xr == YES ||UI_IS_IPHONE_Xs == YES ||UI_IS_IPHONE_Xs_Max == YES)  ? 44 : 20)


#define ScaleLayOutW   kScreenWidth/375.0
#define ScaleLayOutH  kScreenHeight/738.0

extern NSString *const QDSelectedThemeClassName;

#define CodeFontMake(_pointSize) [UIFont fontWithName:@"Menlo" size:_pointSize]
#define CodeAttributes(_fontSize) @{NSFontAttributeName: CodeFontMake(_fontSize), NSForegroundColorAttributeName: [QDThemeManager sharedInstance].currentTheme.themeCodeColor}

/// QMUIButton 系列 Demo 里的一行高度
extern const CGFloat QDButtonSpacingHeight;

@interface QDCommonUI : NSObject

+ (void)renderGlobalAppearances;
@end

@interface QDCommonUI (ThemeColor)

+ (UIColor *)randomThemeColor;
@end

@interface QDCommonUI (Layer)

+ (CALayer *)generateSeparatorLayer;
@end
