//
//  NSDictionary+GWForward.m
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "NSDictionary+GWForward.h"

@implementation NSDictionary (GWForward)

+ (instancetype) GW_dictionaryWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt
{
    return [self  GW_dictionaryWithObjects:objects forKeys:keys count:cnt];
}

+ (instancetype) GW_dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray<id<NSCopying>> *)keys
{
    if (objects.count != keys.count) {
        return nil;//huicha
    }
    NSUInteger index = 0;
    id _Nonnull objectsNew[objects.count];
    id <NSCopying> _Nonnull keysNew[keys.count];
    for (int i = 0; i<keys.count; i++) {
        if (objects[i] && keys[i]) {
            objectsNew[index] = objects[i];
            keysNew[index] = keys[i];
            index ++;
        }else{

            
        }
    }
    return [self  GW_dictionaryWithObjects:[NSArray arrayWithObjects:objectsNew count:index] forKeys: [NSArray arrayWithObjects:keysNew count:index]];
}

- (instancetype) GW_initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt
{
    NSUInteger index = 0;
    id _Nonnull objectsNew[cnt];
    id <NSCopying> _Nonnull keysNew[cnt];
    //'*** -[NSDictionary initWithObjects:forKeys:]: count of objects (1) differs from count of keys (0)'
    for (int i = 0; i<cnt; i++) {
        if (objects[i] && keys[i]) {//可能存在nil的情况
            objectsNew[index] = objects[i];
            keysNew[index] = keys[i];
            index ++;
        }else{
           
            
        }
    }
    return [self  GW_initWithObjects:objectsNew forKeys:keysNew count:index];
}
@end

@implementation NSMutableDictionary (GWForward)

//setObject:forKey:
- (void) GW_dictionaryMSetObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject && aKey) {
        [self  GW_dictionaryMSetObject:anObject forKey:aKey];
    }else{
    
    }
}

//removeObjectForKey:
- (void) GW_dictionaryMRemoveObjectForKey:(id)aKey
{
    if (aKey) {
        [self  GW_dictionaryMRemoveObjectForKey:aKey];
    }else{
    }
}

@end




