//
//  UIImage+Image.m
//  Runtime
//
//  Created by wenxiang'Z on 2017/9/7.
//  Copyright © 2017年 wenxiang'Z. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (void)load
{
    //1.获取imageNamed方法地址
    //class_getClassMethod (获取某个类的方法)
    Method imageNameMethod = class_getClassMethod(self, @selector(imageNamed:));
    //2.获取imageNamed方法地址
    Method In_imageNameMethod = class_getClassMethod(self, @selector(In_imageNamed:));
    
    //3.交换方法地址，相当于交换实现方式；
    method_exchangeImplementations(imageNameMethod, In_imageNameMethod);
    
}

+ (UIImage *)In_imageNamed:(NSString *)name
{
    name = @"扁平化头像-03.jpg";
    UIImage *image= [UIImage In_imageNamed:name];
    if (image) {
        NSLog(@"runtime添加额外功能 -- 加载成功");
        
    }else{
        NSLog(@"加载失败");
    }
    return image;
}



@end
