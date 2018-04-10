//
//  GreateWallUtils.m
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "GreateWallUtils.h"



@implementation GreateWallUtils

+ (BOOL)gw_ValidateOverrideForwardMethod:(Class)clazz
{
    BOOL tf = NO;
    tf = (class_getMethodImplementation([NSObject class], @selector(forwardInvocation:)) != class_getMethodImplementation([self class], @selector(forwardInvocation:))) ||
    (class_getMethodImplementation([NSObject class], @selector(forwardingTargetForSelector:)) != class_getMethodImplementation([self class], @selector(forwardingTargetForSelector:)));
    return tf;
}

@end
