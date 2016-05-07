//
//  TestViewController.m
//  监听状态栏区域的点击
//
//  Created by cm on 16/1/27.
//  Copyright © 2016年 cm. All rights reserved.
//

#import "TestViewController.h"
#import "CMTopWindow.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [CMTopWindow setStatusBarHidden:NO];
    [CMTopWindow setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [CMTopWindow setStatusBarHidden:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 状态栏控制
//- (BOOL)prefersStatusBarHidden
//{
//    return NO;
//}
//
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
