//
//  GreateWallUtils.h
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef NSString *GWSelectorName;

static inline int GWActivityMethodIMP(id self,SEL _cmd,...){
    return 0;
}

static inline void GW_ExchangeInstanceMethod(Class oriClass,SEL oriSel, Class targetClass, SEL targetSel) {
    
    Method oriMethod = class_getInstanceMethod(oriClass, oriSel);
    Method targetMethod = class_getInstanceMethod(targetClass, targetSel);
    
    BOOL hasAdd = class_addMethod(oriClass, oriSel, method_getImplementation(targetMethod), method_getTypeEncoding(targetMethod));
    if (hasAdd) {
        class_replaceMethod(oriClass, targetSel, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    } else {
        method_exchangeImplementations(oriMethod, targetMethod);
    }
}

static inline void GW_EXChangeClassMethod(Class targetClass ,SEL originalSel,SEL exchangeSel){
    Method methodOriginal = class_getClassMethod(targetClass, originalSel);
    Method targetMethod = class_getClassMethod(targetClass, exchangeSel);
    method_exchangeImplementations(methodOriginal, targetMethod);
}

static inline BOOL GW_ValidateOverrideForwardMethod(Class clazz) {
    BOOL tf = NO;
    tf = (class_getMethodImplementation([NSObject class], @selector(forwardInvocation:)) != class_getMethodImplementation(clazz, @selector(forwardInvocation:))) ||
    (class_getMethodImplementation([NSObject class], @selector(forwardingTargetForSelector:)) != class_getMethodImplementation(clazz, @selector(forwardingTargetForSelector:)));
    return tf;
}

static inline void GW_AddMethod(Class clazz, SEL selector){
    class_addMethod(clazz, selector, (IMP)GWActivityMethodIMP, "v@:");
}

@interface GreateWallUtils : NSObject

@end


