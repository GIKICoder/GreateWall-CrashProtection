//
//  NSObject+GWForward.m
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "NSObject+GWForward.h"
#import "GreateWallUtils.h"
#import "GreatWallCrashProcessor.h"
@implementation NSObject (GWForward)

- (id)GW_EXForwardingTargetForSelector:(SEL)selector
{
    if ([self isEqual:[NSNull null]]) {
        
    }
    //检测方法是否被重写
    BOOL temp = !GW_ValidateOverrideForwardMethod(self.class);
    if (temp) {
        GW_AddMethod([GreatWallCrashProcessor class],selector);
        [GreatWallCrashProcessorINST processErrorMethodWithInfo:nil];
        return GreatWallCrashProcessorINST;
    }
    return [self GW_EXForwardingTargetForSelector:selector];
}
@end
