//
//  XBURLSchemesManager.h
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/4.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBURLSchemesManager : NSObject
+ (XBURLSchemesManager *)sharedManager;

-(BOOL)openRouteLink:(NSURL *)url;
//-(BOOL)continueUserActivity
@end

NS_ASSUME_NONNULL_END
