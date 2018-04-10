//
//  GreatWallCrashProcessor.m
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "GreatWallCrashProcessor.h"

@implementation GreatWallCrashProcessor
+ (instancetype) sharedInstanced
{
    static GreatWallCrashProcessor *INST = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        INST = [[GreatWallCrashProcessor alloc] init];
    });
    return INST;
}

- (void)processErrorMethodWithInfo:(NSDictionary*)info
{
    NSLog(@"test");
}
@end
