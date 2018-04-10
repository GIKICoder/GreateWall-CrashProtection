//
//  NSObject+GWForward.h
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GWForward)
- (id)GW_EXForwardingTargetForSelector:(SEL)selector;
@end
