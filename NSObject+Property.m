//
//  NSObject+Property.m
//  Runtime
//
//  Created by wenxiang'Z on 2017/9/7.
//  Copyright © 2017年 wenxiang'Z. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/message.h>

@implementation NSObject (Property)

- (void)setName:(NSString *)name
{
    // objc_setAssociatedObject（将某个值跟某个对象关联起来，将某个值存储到某个对象中）
    // object:给哪个对象添加属性
    // key:属性名称
    // value:属性值
    // policy:保存策略
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHeight:(NSString *)height
{
    objc_setAssociatedObject(self, @"height", height, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name
{
    return objc_getAssociatedObject(self, @"name");
}

- (NSString *)height
{
    return objc_getAssociatedObject(self, @"height");
}

@end
