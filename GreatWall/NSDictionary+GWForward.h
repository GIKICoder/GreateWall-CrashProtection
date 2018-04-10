//
//  NSDictionary+GWForward.h
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (GWForward)
+ (instancetype) GW_dictionaryWithObjects:(id const [])objects forKeys:(id<NSCopying> const [])keys count:(NSUInteger)cnt;
+ (instancetype) GW_dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray<id<NSCopying>> *)keys;
- (instancetype) GW_initWithObjects:(id  const [])objects forKeys:(id<NSCopying>  const [])keys count:(NSUInteger)cnt;
@end

@interface NSMutableDictionary (GWForward)
- (void) GW_dictionaryMSetObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (void) GW_dictionaryMRemoveObjectForKey:(id)aKey;
@end

