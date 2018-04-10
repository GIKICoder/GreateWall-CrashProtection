//
//  NSArray+GWForward.m
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "NSArray+GWForward.h"

@implementation NSArray (GWForward)
// NSArray/__NSArrayI/__NSSingleObjectArrayI/__NSArray0
//objectsAtIndexes:
+ (instancetype)GW_ArrayWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt
{
    NSUInteger index = 0;
    id _Nonnull objectsNew[cnt];
    for (int i = 0; i<cnt; i++) {
        if (objects[i]) {
            objectsNew[index] = objects[i];
            index++;
        }else{
            //记录错误
            NSString *errorInfo = [NSString stringWithFormat:@"*** -[__NSPlaceholderArray initWithObjects:count:]: attempt to insert nil object from objects[%d]",i];
        }
    }
    return [self GW_ArrayWithObjects:objectsNew count:index];
}

//objectAtIndexedSubscript
- (id)GW_objectAtIndexedSubscript:(NSUInteger)idx
{
    if (idx >= self.count) {
        //记录错误
        NSString *errorInfo = [NSString stringWithFormat:@"*** -[__NSArrayI objectAtIndexedSubscript:]: index %ld beyond bounds [0 .. %ld]'",(unsigned long)idx,(unsigned long)self.count];
        return nil;
    }
    return [self GW_objectAtIndexedSubscript:idx];
}

- (NSArray *)GW_objectsAtIndexes:(NSIndexSet *)indexes
{
    id instance = nil;
    @try {
        instance = [self GW_objectsAtIndexes:indexes];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return instance;
    }
}
//objectAtIndex:
- (id)GW_NSArrayIObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }
    return [self GW_NSArrayIObjectAtIndex:index];
}

- (id)GW_NSSingleObjectArrayIObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }
    return [self GW_NSSingleObjectArrayIObjectAtIndex:index];
}

- (id)GW_NSArray0ObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }
    return [self GW_NSArray0ObjectAtIndex:index];
}
@end

@implementation NSMutableArray (GWForward)
//objectAtIndex:
- (id)GW_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }
    return [self GW_objectAtIndex:index];
}

//objectAtIndexedSubscript
- (id)GW_objectAtIndexedSubscript:(NSUInteger)idx
{
    if (idx >= self.count) {
    
        return nil;
    }
    return [self GW_objectAtIndexedSubscript:idx];
}

//removeObjectAtIndex:
- (void)GW_removeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return;
    }
    [self GW_removeObjectAtIndex:index];
}

- (void)GW_removeObjectsAtIndexes:(NSIndexSet *)indexes
{
    @try{
        [self GW_removeObjectsAtIndexes:indexes];
    }@catch(NSException *exception){
        return;
    }@finally{
        
    }
}

- (void)GW_removeObjectsInRange:(NSRange)range
{
    if (range.location >= self.count || range.location+range.length>self.count) {
        return;
    }
    [self GW_removeObjectsInRange:range];
}

//insertObject:atIndex:
- (void)GW_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject == nil) {
        return;
    }
    if (index > self.count) {
        return;
    }
    [self GW_insertObject:anObject atIndex:index];
}

- (void)GW_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
    if (indexes.firstIndex > self.count) {
        return;
    }else if (objects.count != (indexes.count)){
        return;
    }
    [self GW_insertObjects:objects atIndexes:indexes];
}

//replaceObjectAtIndex
- (void)GW_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject == nil) {
        return;
    }
    if (index >= self.count) {
        return;
    }
    [self GW_replaceObjectAtIndex:index withObject:anObject];
}

- (void)GW_replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects
{
    if (indexes.lastIndex >= self.count||indexes.firstIndex >= self.count) {
       
    }else{
        [self GW_replaceObjectsAtIndexes:indexes withObjects:objects];
    }
}

-(void)GW_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray
{
    if (range.location+range.length > self.count) {
      
    }else{
        [self GW_replaceObjectsInRange:range withObjectsFromArray:otherArray];
    }
}

@end
