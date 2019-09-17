//
//  XBDataParse.m
//  XiaoBangInsuranceProject
//
//  Created by 韩冰 on 2019/8/9.
//  Copyright © 2019 www.xiaobangtouzi.com. All rights reserved.
//

#import "XBDataParse.h"

@implementation XBDataParse

- (void)xb_checkResponse:(id)responseJSONObject{
    NSInteger status = [[responseJSONObject objectForKeySafely:@"status"] integerValue];
    NSInteger code =  [[responseJSONObject objectForKeySafely:@"code"] integerValue];
    if (status == 200 && (code == 200 || code == 0)) {
        if ([self.delegate respondsToSelector:@selector(xb_dateParseSuccess:)]) {
            [self.delegate xb_dateParseSuccess:[responseJSONObject objectForKeySafely:@"data"]];
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(xb_dataPareseFail:)]) {
            [self.delegate xb_dataPareseFail:[responseJSONObject objectForKeySafely:@"message"]];
        }
    }
}

@end
