//
//  UIImage+Image.h
//  03-Runtime(交换方法)
//
//  Created by xmg on 16/1/11.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

/**
 *  给imageNamed添加额外功能的分类,  ps :待需改进
 *
 *  @param Image <#Image description#>
 *
 *  @return <#return value description#>
 */
#import <UIKit/UIKit.h>

@interface UIImage (Image)

// 1.加载图片 2.判断
// 如果跟系统方法差不多功能,可以采取添加前缀,与系统方法区分
+ (UIImage *)xmg_imageNamed:(NSString *)name;

@end
