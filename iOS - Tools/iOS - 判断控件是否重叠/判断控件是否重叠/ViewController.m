//
//  ViewController.m
//  判断控件是否重叠
//
//  Created by xmg on 16/1/27.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // rect1,rect2 转换到以Window为左上角坐标原点
    CGRect rect1 = [self.blueView convertRect:self.blueView.bounds toView:nil];
    CGRect rect2 = [self.redView convertRect:self.redView.bounds toView:nil];
    
    // 判断是否重叠
    BOOL result = CGRectIntersectsRect(rect1, rect2);
    NSLog(@"%zd", result);
}

/*
 计算控件A在window中的x\y\width\height
 CGRect rect = [A.superview convertRect:A.frame toView:window];
 CGRect rect = [A.superview convertRect:A.frame toView:nil];
 CGRect rect = [A convertRect:A.bounds toView:window];
 CGRect rect = [A convertRect:A.bounds toView:nil];
 CGRect rect = [window convertRect:A.frame fromView:A.superview];
 CGRect rect = [window convertRect:A.bounds fromView:A];
 */
- (void)test3
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 计算self.redView在window中的x\y\width\height
    
    // CGRectMake(50, 50, 100, 100)
    
//    CGRect rect = [self.redView.superview convertRect:self.redView.frame toView:window];
    //    CGRect rect = [self.redView convertRect:self.redView.bounds toView:window];
    //    CGRect rect = [window convertRect:self.redView.frame fromView:self.redView.superview];
    //    CGRect rect = [window convertRect:self.redView.bounds fromView:self.redView];
    //    CGRect rect = [self.redView.superview convertRect:self.redView.frame toView:nil];
    
    
    /**
     *  nil表示keyWindow,fromView:方法中不可用
     */
    CGRect rect = [self.redView convertRect:self.redView.bounds toView:nil];
    
    
    NSLog(@"%@", NSStringFromCGRect(rect));
}

- (void)test2
{
    /**
     *  将传入参数的矩形框从以redView的左上角坐标原点转换到以blueView左上角坐标原点的坐标系,矩形框的x,y会发生改变.宽高不变.
     
     将传入的矩形框参数，从【self.redView坐标系】 转换到 【self.blueView坐标系】
     */
//    CGRect rect = [self.redView convertRect:CGRectMake(50, 50, 60, 60) toView:self.blueView];
    
//    CGRect rect = [self.blueView convertRect:CGRectMake(50, 50, 60, 60) toView:self.redView];
    
    
    CGRect rect = [self.redView convertRect:CGRectMake(50, 50, 60, 60) fromView:self.blueView];
    NSLog(@"%@", NSStringFromCGRect(rect));
}

- (void)test
{
    CGRect rect1 = self.blueView.frame; // 50,50,100,100
    CGRect rect2 = self.redView.frame; // 0,0,100,100
    
    BOOL result = CGRectIntersectsRect(rect1, rect2);
    
    
    NSLog(@"%zd", result);
    
    // 判断rect1是否包含了rect2
    CGRectContainsRect(rect1,rect2);
    
    // 判断rect是否包含了point
}

@end
