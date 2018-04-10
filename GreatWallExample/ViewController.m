//
//  ViewController.m
//  GreatWallExample
//
//  Created by GIKI on 2018/4/9.
//  Copyright © 2018年 GIKI. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+GWForward.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(20, 100, 100, 60);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = [UIColor redColor];
    btn2.frame = CGRectMake(20, 220, 100, 60);
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(btnclick2) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnclick2
{
    int a = 3;
    NSString *b = nil;
    NSDictionary * dict = @{b:@(a),@(a):b};
    NSLog(@"%@",dict);
    
    NSMutableArray * array = nil;
    [array insertObject:b atIndex:2];
    array = [NSMutableArray array];
    [array addObject:b];
    [array indexOfObject:b];
    
}

- (void)btnclick
{
    NSArray * array = @[@1,@2,@3];
    NSString *a = array[4];
    NSString *b = array[2];
    if ([a isEqualToString:@"3"]) {
        NSLog(@"testaa");
    } else {
        NSLog(@"jhahhahahahahahahhahah");
    }
    NSMutableArray * arrayM = array.mutableCopy;
    NSString * aa = nil;
    [arrayM insertObject:aa atIndex:3];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
