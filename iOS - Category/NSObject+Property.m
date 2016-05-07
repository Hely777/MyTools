//
//  NSObject+Property.m
//  06-Runtime(动态添加属性)
//
//  Created by xmg on 16/1/11.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/message.h>
//NSString *_name;

@implementation NSObject (Property)

- (void)setName:(NSString *)name
{
    // name保存起来
//    _name = name;
    // 保存属性到系统的类
    // 产生关联,让某个对象(name)与当前对象的属性(name)产生关联
    // object:给哪个对象添加属性
    // key:属性名
    // value:属性值
    // policy:策略
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
}

- (NSString *)name
{
    
    return objc_getAssociatedObject(self, @"name");
//    return _name;
}

@end
