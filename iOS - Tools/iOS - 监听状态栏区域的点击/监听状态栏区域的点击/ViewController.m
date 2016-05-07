//
//  ViewController.m
//  监听状态栏区域的点击
//
//  Created by cm on 16/1/27.
//  Copyright © 2016年 cm. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "CMTopWindow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [CMTopWindow setStatusBarHidden:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self presentViewController:[[TestViewController alloc] init] animated:YES completion:nil];
}

#pragma mark - 状态栏控制
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

@end
