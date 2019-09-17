//
//  XBTabBarViewController.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/8.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBTabBarViewController.h"
#import "XBNavigationController.h"
#import "XBUserDataManger.h"
#import "XBLogInViewController.h"
@interface XBTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation XBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}


-(void)xb_createTabBarCtrConfigerChildsCtr:(NSArray *)childs withTitles:(NSArray *)titles withDefultIcon:(NSArray *)defultIcons withSelectIcons:(NSArray *)selectIcons{

    for (int i = 0; i < childs.count; i ++) {
        UIViewController *child = [childs objectAtIndexSafely:i];
        NSString *title = [titles objectAtIndexSafely:i];
        
        UIImage *defultImage =
        [UIImageMake([defultIcons objectAtIndexSafely:i]) imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        UIImage *selectImage =
        [UIImageMake([selectIcons objectAtIndexSafely:i])imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        
        XBNavigationController *nav =  [[XBNavigationController alloc]initWithRootViewController:child];
        
        nav.tabBarItem = [QDUIHelper tabBarItemWithTitle:title image:defultImage selectedImage:selectImage tag:i];
            [self addChildViewController:nav];
    }
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([XBUserDataManger defultManger].isLogIn) {
        
        return YES;
    }else{
        UINavigationController *navCtrl = (UINavigationController *)viewController;
        NSInteger index = [self.viewControllers indexOfObject:navCtrl];
        if (index == 2 ||index == 3) {
            XBLogInViewController *logIn = [[XBLogInViewController alloc]init];
            XBNavigationController *nav = [[XBNavigationController alloc]initWithRootViewController:logIn];
            [self.view.window.rootViewController presentViewController:nav animated:YES completion:nil];
           return NO;
        }else{
            
            return YES;
        }
       
    }
   
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
      NSLog(@"12345678");
}


@end
