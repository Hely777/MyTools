//
//  XMGPopoverAnimator.swift
//  DSWB
//
//  Created by 蔡明 on 16/2/28.
//  Copyright © 2016年 蔡明. All rights reserved.
//

import UIKit

class CMPopoverAnimator: NSObject {
    var presentedFrame : CGRect? // 数据的传递,间接由外部控制器决定UIPresentationController的View的frame
    
    // 传给home,决定titleButton的箭头方向
    // 强引用闭包
    var startAnimate : (isPresented : Bool) -> ()
    // MARK:- 自定义构造函数
    init(startAnimate : (isPresented : Bool) -> ()) {
        self.startAnimate = startAnimate
    }
}

extension CMPopoverAnimator : UIViewControllerTransitioningDelegate {
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        // UIPresentationController : 决定弹出的View长什么样子
        // presented: 弹出控制器(modal出来的控制器)
        // presenting: 发起控制器
        
        let presentationController = CMPresentationController(presentedViewController: presented, presentingViewController: presenting)
        presentationController.presentedFrame = presentedFrame
        
        return presentationController
    }
    
    // 自定义弹出动画,并且告诉系统弹出动画交给谁来处理.必须自定义弹出动画
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // 闭包回调
        self.startAnimate(isPresented: true)
        
        return self
    }
    
    // 自定义消失动画,并且告诉系统消失动画交给谁来处理.必须自定义消失动画
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // 闭包回调
        self.startAnimate(isPresented: false)
        
        return self
    }
}

// MARK: - 自定义View的弹出和消失动画的代理方法
extension CMPopoverAnimator : UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    // 弹出和消失动画都会执行方法
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // UITransitionContextFromViewKey : 做消失动画:取出消失的View
        // UITransitionContextToViewKey : 做弹出动画:取出弹出的View
        if let presentedView = transitionContext.viewForKey  (UITransitionContextToViewKey) {
            // 1.将弹出的View添加到容器视图中(containerView)
            transitionContext.containerView()?.addSubview(presentedView)
            
            // 2.动画
            // 2.1.改变presentedView的transform属性
            presentedView.transform = CGAffineTransformMakeScale(1.0, 0.0)
            presentedView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            // 2.2.执行动画
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                presentedView.transform = CGAffineTransformIdentity
                }, completion: { (isFinished) -> Void in
                    // 如果自定义动画,在动画结束后必须告诉系统已经完成了动画
                    transitionContext.completeTransition(true)
            })
        } else { // 由于弹出的View和消失的View是一个View所以不需要再添加到containerView中
            
            // 1.取出消失的View
            let dismissView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
            
            // 2.执行动画
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                // 如果动画不显示,那么就是精度问题所以赋值0.0000001
                dismissView.transform = CGAffineTransformMakeScale(1.0, 0.000001)
                }, completion: { (isFinished) -> Void in
                    transitionContext.completeTransition(true)
                    dismissView.removeFromSuperview()
            })
        }
    }
}

