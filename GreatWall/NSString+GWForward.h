//
//  NSString+GWForward.h
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GWForward)
- (unichar) GW_characterAtIndex:(NSUInteger)index;
- (NSString *) GW_substringFromIndex:(NSUInteger)from;
- (NSString *) GW_substringToIndex:(NSUInteger)to;
- (NSString *) GW_substringWithRange:(NSRange)range;
- (NSString *) GW_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement;
@end

@interface NSMutableString (GWForward)
- (void) GW_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString;
- (void) GW_insertString:(NSString *)aString atIndex:(NSUInteger)loc;
- (void) GW_deleteCharactersInRange:(NSRange)range;
@end
