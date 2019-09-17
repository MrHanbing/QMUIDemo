//
//  XBDeVice.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰冰 on 2019/9/6.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBDeVice.h"

@implementation XBDeVice
+(CGFloat)pixelPerInchScal{
    
    if (IS_55INCH_SCREEN) {
        ///PPI 401 5.5 英寸
        return 401/458.0;
    }else if (IS_35INCH_SCREEN||IS_40INCH_SCREEN||IS_47INCH_SCREEN||IS_61INCH_SCREEN){
       
        return 326/458.0;
        
    }else if (IS_58INCH_SCREEN||IS_65INCH_SCREEN){
        return 458/458.0;
    }
    return 1.0;
}

@end
