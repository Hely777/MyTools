//
//  UIBarButtonItem+Item.h
//  BarButtonItem图片
//
//  Created by xmg on 16/1/19.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

/**
 *  创建UIBarButtonItem,高亮
 *
 *  @param image    图片
 *  @param highImage 高亮图片
 *  @param target   监听者
 *  @param action   监听者调用的方法
 *
 */
+ (UIBarButtonItem *)createItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;
/**
 *  创建UIBarButtonItem,选中
 *
 *  @param image    图片
 *  @param highImage 高亮图片
 *  @param target   监听者
 *  @param action   监听者调用的方法
 *
 */
+ (UIBarButtonItem *)createItemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;

@end
