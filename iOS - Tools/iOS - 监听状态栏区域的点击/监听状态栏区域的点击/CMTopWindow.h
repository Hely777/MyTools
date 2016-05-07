//
//  CMTopWindow.h
//  监听状态栏区域的点击
//
//  Created by cm on 15/1/27.
//  Copyright © 2015年 cm. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  用于点击顶部状态栏,tableView回到顶部
 */
@interface CMTopWindow : UIWindow

/**
 *  设置statusBar是否隐藏
 *
 *  @param hidden <#hidden description#>
 */
+ (void)setStatusBarHidden:(BOOL)hidden;

/**
 *  设置statusBar显示的样式颜色
 *
 *  @param style <#style description#>
 */
+ (void)setStatusBarStyle:(UIStatusBarStyle)style;

/**
 *  显示顶层window
 *
 *  @param block 这个block会在状态栏区域被点击的时候调用
 */
+ (void)showWithStatusBarClickBlock:(void (^)())block;

@end


