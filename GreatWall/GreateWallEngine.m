//
//  GreateWallEngine.m
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "GreateWallEngine.h"
#import <objc/runtime.h>
#import "GreateWallUtils.h"
#import "NSObject+GWForward.h"
#import "NSArray+GWForward.h"
#import "NSDictionary+GWForward.h"
#import "NSString+GWForward.h"

@implementation GreateWallEngine

+ (void)load
{
    
}

#pragma mark - public Method

+ (void) StartGreateWallEngine
{
    [GreateWallEngine processExchangeSelecotr];
    [GreateWallEngine processArrayExchangeMethod];
    [GreateWallEngine processMutableArrayExchangeMethod];
    [GreateWallEngine processDictionaryExchangeMethod];
    [GreateWallEngine processMutableDictionaryExchangeMethod];
    [GreateWallEngine processStringExchangeMethod];
    [GreateWallEngine processMutableStringExchangeMethod];
    
}

+ (void) processExchangeSelecotr
{
    SEL oriSel = @selector(forwardingTargetForSelector:);
    SEL targetSel = @selector(GW_EXForwardingTargetForSelector:);
    GW_ExchangeInstanceMethod(NSObject.class, oriSel, NSObject.class,targetSel);
}

+ (void) processArrayExchangeMethod
{
    Class __NSArray =   NSClassFromString(@"NSArray");
    Class __NSArrayI = NSClassFromString(@"__NSArrayI");
    Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
    Class __NSArray0 = NSClassFromString(@"__NSArray0");
    //insertNil
    GW_EXChangeClassMethod(__NSArray, @selector(arrayWithObjects:count:), @selector(GW_ArrayWithObjects:count:));
    //objectsAtIndexes:
    GW_ExchangeInstanceMethod(__NSArray, @selector(objectsAtIndexes:), __NSArray, @selector(GW_objectsAtIndexes:));
    //objectAtIndex:
    GW_ExchangeInstanceMethod(__NSArrayI, @selector(objectAtIndex:), __NSArrayI, @selector(GW_NSArrayIObjectAtIndex:));
#if TARGET_IPHONE_SIMULATOR  //模拟器
    GW_ExchangeInstanceMethod(__NSArrayI, @selector(objectAtIndexedSubscript:), __NSArrayI, @selector(GW_objectAtIndexedSubscript:));
#elif TARGET_OS_IPHONE      //真机
    
#endif
    GW_ExchangeInstanceMethod(__NSSingleObjectArrayI, @selector(objectAtIndex:), __NSSingleObjectArrayI, @selector(GW_NSSingleObjectArrayIObjectAtIndex:));
    GW_ExchangeInstanceMethod(__NSArray0, @selector(objectAtIndex:), __NSArray0, @selector(GW_NSArray0ObjectAtIndex:));
}


+ (void) processMutableArrayExchangeMethod
{
    Class arrayMClass = NSClassFromString(@"__NSArrayM");
    GW_ExchangeInstanceMethod(arrayMClass, @selector(objectAtIndex:), arrayMClass, @selector(GW_objectAtIndex:));
#if TARGET_IPHONE_SIMULATOR  //模拟器
    GW_ExchangeInstanceMethod(arrayMClass, @selector(objectAtIndexedSubscript:), arrayMClass, @selector(GW_objectAtIndexedSubscript:));
#elif TARGET_OS_IPHONE      //真机
    
#endif
    //remove
    GW_ExchangeInstanceMethod(arrayMClass, @selector(removeObjectAtIndex:), arrayMClass, @selector(GW_removeObjectAtIndex:));
    GW_ExchangeInstanceMethod(arrayMClass, @selector(removeObjectsInRange:), arrayMClass, @selector(GW_removeObjectsInRange:));
    
    
    GW_ExchangeInstanceMethod(arrayMClass, @selector(removeObjectsAtIndexes:), arrayMClass, @selector(GW_removeObjectsAtIndexes:));
    
    //insert
    GW_ExchangeInstanceMethod(arrayMClass, @selector(insertObject:atIndex:), arrayMClass, @selector(GW_insertObject:atIndex:));
    GW_ExchangeInstanceMethod(arrayMClass, @selector(insertObjects:atIndexes:), arrayMClass, @selector(GW_insertObjects:atIndexes:));
    //replace
    GW_ExchangeInstanceMethod(arrayMClass, @selector(replaceObjectAtIndex:withObject:), arrayMClass, @selector(GW_replaceObjectAtIndex:withObject:));
    GW_ExchangeInstanceMethod(arrayMClass, @selector(replaceObjectsAtIndexes:withObjects:), arrayMClass, @selector(GW_replaceObjectsAtIndexes:withObjects:));
    GW_ExchangeInstanceMethod(arrayMClass, @selector(replaceObjectsInRange:withObjectsFromArray:), arrayMClass, @selector(GW_replaceObjectsInRange:withObjectsFromArray:));
}

+ (void) processDictionaryExchangeMethod
{
    Class dictionaryClass = NSClassFromString(@"NSDictionary");
    Class __NSPlaceholderDictionaryClass = NSClassFromString(@"__NSPlaceholderDictionary");
    GW_EXChangeClassMethod(dictionaryClass, @selector(dictionaryWithObjects:forKeys:count:), @selector(GW_dictionaryWithObjects:forKeys:count:));
    GW_ExchangeInstanceMethod(__NSPlaceholderDictionaryClass, @selector(initWithObjects:forKeys:count:), __NSPlaceholderDictionaryClass, @selector(GW_initWithObjects:forKeys:count:));
}

+ (void) processMutableDictionaryExchangeMethod
{
    Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
    GW_ExchangeInstanceMethod(dictionaryM, @selector(setObject:forKey:), dictionaryM, @selector(GW_dictionaryMSetObject:forKey:));
    GW_ExchangeInstanceMethod(dictionaryM, @selector(removeObjectForKey:), dictionaryM, @selector(GW_dictionaryMRemoveObjectForKey:));
}

+ (void) processStringExchangeMethod
{
    Class stringClass = NSClassFromString(@"__NSCFConstantString");
    GW_ExchangeInstanceMethod(stringClass, @selector(characterAtIndex:), stringClass, @selector(GW_characterAtIndex:));
    GW_ExchangeInstanceMethod(stringClass, @selector(substringFromIndex:), stringClass, @selector(GW_substringFromIndex:));
    GW_ExchangeInstanceMethod(stringClass, @selector(substringToIndex:), stringClass, @selector(GW_substringToIndex:));
    GW_ExchangeInstanceMethod(stringClass, @selector(substringWithRange:), stringClass, @selector(GW_substringWithRange:));
    GW_ExchangeInstanceMethod(stringClass, @selector(stringByReplacingCharactersInRange:withString:), stringClass, @selector(GW_stringByReplacingCharactersInRange:withString:));
}

+ (void) processMutableStringExchangeMethod
{
    Class stringClass = NSClassFromString(@"__NSCFString");
    GW_ExchangeInstanceMethod(stringClass, @selector(replaceCharactersInRange:withString:), stringClass, @selector(GW_replaceCharactersInRange:withString:));
    GW_ExchangeInstanceMethod(stringClass, @selector(insertString:atIndex:), stringClass, @selector(GW_insertString:atIndex:));
    GW_ExchangeInstanceMethod(stringClass, @selector(deleteCharactersInRange:), stringClass, @selector(GW_deleteCharactersInRange:));
}

@end
