//
//  NSString+GWForward.m
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "NSString+GWForward.h"

@implementation NSString  ( GWForward)

- (unichar) GW_characterAtIndex:(NSUInteger)index
{
    if (index>=self.length) {
        unichar characteristic = 0;
        
        return characteristic;
    }
    return [self  GW_characterAtIndex:index];
}

- (NSString *) GW_substringFromIndex:(NSUInteger)from
{
    if (from>=self.length) {
        
        return nil;
    }
    return [self  GW_substringFromIndex:from];
}

- (NSString *) GW_substringToIndex:(NSUInteger)to
{
    if (to>=self.length) {
        
        return [self  GW_substringToIndex:self.length-1];
    }
    return [self  GW_substringToIndex:to];
}

- (NSString *) GW_substringWithRange:(NSRange)range
{
    if (range.location+range.length>self.length) {
        
        if (range.location<self.length) {
            return [self  GW_substringFromIndex:range.location];
        }
        return nil;
    }
    return [self  GW_substringWithRange:range];
}


- (NSString *) GW_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement
{
    if (range.location+range.length>self.length) {
        
        if (range.location<self.length) {
            return [self  GW_stringByReplacingCharactersInRange:NSMakeRange(range.location, self.length-range.location) withString:replacement];
        }
        return nil;
    }
    return [self  GW_stringByReplacingCharactersInRange:range withString:replacement];
}

@end

@implementation NSMutableString  (GWForward)

- (void) GW_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString
{
    if (range.location+range.length > self.length) {
        
        if (range.location < self.length) {
            [self  GW_replaceCharactersInRange:NSMakeRange(range.location, self.length-range.location) withString:aString];
        }
    }else{
        [self  GW_replaceCharactersInRange:range withString:aString];
    }
}

- (void) GW_insertString:(NSString *)aString atIndex:(NSUInteger)loc
{
    if (loc > self.length) {
        
    }else{
        [self  GW_insertString:aString atIndex:loc];
    }
}

- (void) GW_deleteCharactersInRange:(NSRange)range
{
    if (range.location+range.length > self.length) {
        
        if (range.location < self.length) {
            [self  GW_deleteCharactersInRange:NSMakeRange(range.location, self.length-range.location)];
        }
    }else{
        [self  GW_deleteCharactersInRange:range];
    }
}
@end
