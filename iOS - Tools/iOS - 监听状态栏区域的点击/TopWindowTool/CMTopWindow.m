//
//  CMTopWindow.m
//  监听状态栏区域的点击
//
//  Created by cm on 15/1/27.
//  Copyright © 2015年 cm. All rights reserved.
//

#import "CMTopWindow.h"
/**
 *  类方法内不能使用成员变量,所以用static保存
 */
static CMTopWindow *window_;
static BOOL hidden_;
static UIStatusBarStyle style_;

/***** CMTopViewController - begin *****/
@interface CMTopViewController : UIViewController
@property (nonatomic, copy) void (^statusBarClickBlock)();
@end

@implementation CMTopViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.statusBarClickBlock) self.statusBarClickBlock();
    //    !self.statusBarClickBlock ? : self.statusBarClickBlock();
}

#pragma mark - 状态栏控制
- (BOOL)prefersStatusBarHidden
{
    return hidden_;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return style_;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationFade;
}

@end
/***** CMTopViewController - end *****/




/***** CMTopWindow - begin *****/
@implementation CMTopWindow

+ (void)setStatusBarHidden:(BOOL)hidden
{
    hidden_ = hidden;
    
    // 重新调用控制器的preferXXX方法，刷新状态栏
    [UIView animateWithDuration:0.25 animations:^{
        [window_.rootViewController setNeedsStatusBarAppearanceUpdate];
    }];
}

+ (void)setStatusBarStyle:(UIStatusBarStyle)style
{
    style_ = style;
    
    // 重新调用控制器的preferXXX方法，刷新状态栏
    [window_.rootViewController setNeedsStatusBarAppearanceUpdate];
}

+ (void)showWithStatusBarClickBlock:(void (^)())block
{
    if (window_) return;
    
    window_ = [[CMTopWindow alloc] init];
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor clearColor];
    // 先显示window
    window_.hidden = NO;
    
    // 设置根控制器
    CMTopViewController *topVc = [[CMTopViewController alloc] init];
    topVc.view.backgroundColor = [UIColor clearColor];
    topVc.view.frame = [UIApplication sharedApplication].statusBarFrame;
    topVc.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    topVc.statusBarClickBlock = block;
    window_.rootViewController = topVc;
}

/**
 *  当用户点击屏幕时，首先会调用这个方法，询问谁来处理这个点击事件
 *
 *  @return 如果返回nil，代表当前window不处理这个点击事件
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 如果触摸点的y值 > 20，当前window不处理
    if (point.y > 20) return nil;
    
    // 如果触摸点的y值 <= 20，按照默认做法处理
    return [super hitTest:point withEvent:event];
}

@end
/***** CMTopWindow - end *****/

