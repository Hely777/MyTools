//
//  UIImage+Image.m
//  03-Runtime(交换方法)
//
//  Created by xmg on 16/1/11.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "UIImage+Image.h"

#import <objc/message.h>

@implementation UIImage (Image)

// 肯定只调用,类加载进内存的时候调用
// 程序一启动就会调用
+ (void)load
{
    // self:UIImage
    // 谁的事情,谁开头 1.发送消息(对象:objc) 2.注册方法(方法编号:sel) 3.交互方法(方法:method) 4.获取方法(类:class)
    // Method:方法名
    
    // 获取方法,方法保存到类
    // Class:获取哪个类方法
    // SEL:获取哪个方法
    // imageName
   Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    
   // xmg_imageNamed
   Method xmg_imageNamedMethod = class_getClassMethod(self, @selector(xmg_imageNamed:));
    
    // 交互方法
    method_exchangeImplementations(imageNamedMethod, xmg_imageNamedMethod);
    
}

//+ (UIImage *)imageNamed:(NSString *)name
//{
//    
//}

// 1.加载图片 2.判断
+ (UIImage *)xmg_imageNamed:(NSString *)name
{
    UIImage *image = [UIImage xmg_imageNamed:name];
    
    if (!image) {
        NSLog(@"图片不存在");
    }
    
    return image;
    
}

@end
