//
//  ViewController.m
//  监听scrollView的静止
//
//  Created by xmg on 16/1/27.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.frame = CGRectMake(100, 100, 200, 200);
    scrollView.contentSize = CGSizeMake(400, 400);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 左上角
    [scrollView addSubview:[[UISwitch alloc] init]];
    
    // 右下角
    UIView *tempView = [[UIView alloc] init];
    tempView.backgroundColor = [UIColor blueColor];
    tempView.frame = CGRectMake(350, 350, 50, 50);
    [scrollView addSubview:tempView];
    
    // 中间
    UIView *centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor orangeColor];
    centerView.frame = CGRectMake(0, 0, 50, 50);
    centerView.center = CGPointMake(200, 200);
    [scrollView addSubview:centerView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.contentOffset = CGPointMake(150, 150);
        [self.scrollView setContentOffset:CGPointMake(150, 150)];
    } completion:^(BOOL finished) {
        NSLog(@"减速完毕----");
    }];
    
//    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, 20, 20) animated:YES];
    
//    [self.scrollView scrollRectToVisible:CGRectMake(350, 350, 25, 25) animated:NO];
}

#pragma mark - <UIScrollViewDelegate>
/**
 *  当用户停止拖拽scrollView的时候调用（手松开）
 *  如果参数decelerate为YES，手松开后会继续滚动，滚动完毕后会调用scrollViewDidEndDecelerating:代理方法.
 *  如果参数decelerate为NO，手松开后不再滚动，马上静止，也不会调用scrollViewDidEndDecelerating:代理方法.
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate) {
        NSLog(@"用户停止拖拽scrollView，scrollView会继续滚动");
    } else {
        NSLog(@"用户停止拖拽scrollView，scrollView不再滚动");
    }
}

/**
 *  当scrollView停止滚动的时候调用
 *  前提：人为手动让scrollView产生滚动
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"用户停止拖拽scrollView后滚动完毕");
}

/**
 *  当scrollView停止滚动的时候调用
 *  前提：当使用setContentOffset:animated:或者scrollRectToVisible:animated:方法让scrollView产生了滚动动画,动画结束时调用这个代理方法.如果没有动画就不会调用.
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"通过setContentOffset:animated:或者scrollRectToVisible:animated:方法让scrollView产生滚动动画，然后停止滚动");
}
@end
