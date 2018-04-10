//
//  GreatWallCrashProcessor.h
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GreatWallCrashProcessorINST [GreatWallCrashProcessor sharedInstanced]

@interface GreatWallCrashProcessor : NSObject

+ (instancetype) sharedInstanced;

- (void)processErrorMethodWithInfo:(NSDictionary*)info;

@end
