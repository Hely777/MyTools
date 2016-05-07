//
//  XMGPresentationController.swift
//  DSWB
//
//  Created by 蔡明 on 16/2/28.
//  Copyright © 2016年 蔡明. All rights reserved.
//

import UIKit

class CMPresentationController: UIPresentationController {
    // MARK:- 属性
    var presentedFrame : CGRect? // 希望能够由UIPresentationController决定View的frame
    
    // MARK:- 系统回调函数
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        // 1.设置弹出的View尺寸
        // ?? : ??前面的语句有可选类型,如果其中一个可选类型为nil.则取??后面的值
        presentedView()?.frame = presentedFrame ?? CGRectZero
        
        // 2.添加遮盖
        setupCoverView()
    }
    
    // MARK:- 自定义函数
    /// 添加遮盖
    private func setupCoverView() {
        // 1.创建遮盖
        let coverView = UIView(frame: containerView!.bounds)
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.2)
        
        // 2.给遮盖添加手势
        let tapGes = UITapGestureRecognizer(target: self, action: "coverClick")
        coverView.addGestureRecognizer(tapGes)
        
        // 将遮盖添加到容器视图中(containerView)
        containerView?.insertSubview(coverView, belowSubview: presentedView()!)
    }
    
    // MARK:- 事件监听函数
    @objc private func coverClick() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
