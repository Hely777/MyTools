//
//  UIImage+Render.m
//  BaiSiBuDeJie
//
//  Created by 蔡明 on 16/1/18.
//  Copyright © 2016年 MrCai. All rights reserved.
//

#import "UIImage+Render.h"

@implementation UIImage (Render)
/**
 *  接收一个图片,渲染成原始样式,并返回
 */
+ (UIImage *)imageWithRenderAsOriginalImage:(UIImage *)image{
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
