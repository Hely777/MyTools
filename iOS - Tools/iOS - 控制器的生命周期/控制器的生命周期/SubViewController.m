//
//  SubViewController.m
//  控制器的生命周期
//
//  Created by 闫栋辉 on 16/1/22.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#define XMGFunc NSLog(@"%s",__func__)

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SubVC";
    self.view.backgroundColor = [UIColor greenColor];
    XMGFunc;
}

/**
 *  从nib载入视图 ，通常这一步不需要去干涉。除非你没有使用xib文件创建视图
 */
- (void)loadView
{
    [super loadView];
    XMGFunc;
}
/**
 *  1 init函数 初始化对象
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        XMGFunc;
    }
    return self;
}
/**
 *  视图将出现在屏幕之前，马上这个视图就会被展现在屏幕上了，每次视图消失再出现都会再次调用
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    XMGFunc;
}
/**
 *  视图已在屏幕上渲染完成
 */
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    XMGFunc;
    
}
/**
 *  完成对子视图布局
 */
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    XMGFunc;
    
}
/**
 *  将要要对子视图进行布局
 */
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    XMGFunc;
    
}
/**
 *  在loadView之前的工作放在这里
 */
- (void)awakeFromNib
{
    XMGFunc;
}
/**
 *  视图将被从屏幕上移除之前执行
 */
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    XMGFunc;
}
/**
 *  视图已经被从屏幕上移除，用户看不到这个视图了
 */
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    XMGFunc;
}
/**
 *  收到内存警告的时候调用
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    XMGFunc;
}
- (void)dealloc
{
    XMGFunc;
}

@end
