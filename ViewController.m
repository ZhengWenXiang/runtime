//
//  ViewController.m
//  Runtime
//
//  Created by wenxiang'Z on 2017/9/7.
//  Copyright © 2017年 wenxiang'Z. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Image.h"
#import "NSObject+Property.h"
#import "Movie.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //特性一：动态交换两个方法的实现
    // 方案一：先搞个分类，定义一个能加载图片并且能打印的方法+ (instancetype)imageWithName:(NSString *)name;
    // 方案二：交换 imageNamed 和 ln_imageNamed 的实现，就能调用 imageNamed，间接调用 ln_imageNamed 的实现。
    UIImage *image = [UIImage imageNamed:@""];
    
    
    //特性二：动态添加属性
    NSObject *objc = [[NSObject alloc]init];
    objc.name = @"zhengwenxiang";
    objc.height = @"175cm";
    NSLog(@"runtime动态添加属性name==%@\nheight==%@",objc.name,objc.height);
    
    
    Movie *movie = [[Movie alloc]init];
    movie.name = @"zhengwenxiang";
    //文件路径
    NSString *filePath =[ NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"stu.data"];
    //归档
    [NSKeyedArchiver archiveRootObject:movie toFile:filePath];
    
    //文件路径
    NSString *filePath1 =[ NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"stu.data"];
    //反归档
    Movie *stu = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath1];
    NSLog(@"%@",stu.name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
