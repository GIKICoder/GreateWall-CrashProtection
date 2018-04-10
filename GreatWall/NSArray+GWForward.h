//
//  NSArray+GWForward.h
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (GWForward)
+ (instancetype)GW_ArrayWithObjects:(id const [])objects count:(NSUInteger)cnt;
- (id)GW_objectAtIndexedSubscript:(NSUInteger)idx;
- (NSArray *)GW_objectsAtIndexes:(NSIndexSet *)indexes;
- (id)GW_NSArrayIObjectAtIndex:(NSUInteger)index;
- (id)GW_NSSingleObjectArrayIObjectAtIndex:(NSUInteger)index;
- (id)GW_NSArray0ObjectAtIndex:(NSUInteger)index;
@end

@interface NSMutableArray(GWForward)
- (id)GW_objectAtIndex:(NSUInteger)index;
- (id)GW_objectAtIndexedSubscript:(NSUInteger)idx;
- (void)GW_removeObjectAtIndex:(NSUInteger)index;
- (void)GW_removeObjectsAtIndexes:(NSIndexSet *)indexes;
- (void)GW_removeObjectsInRange:(NSRange)range;
- (void)GW_insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)GW_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;
- (void)GW_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)GW_replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects;
-(void)GW_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray;
@end
