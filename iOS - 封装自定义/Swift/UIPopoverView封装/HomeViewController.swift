
//
//  HomeViewController.swift
//  CaiMingWeiBo
//
//  Created by 蔡明 on 16/2/27.
//  Copyright © 2016年 MrCai. All rights reserved.
//

 /// 外部控制器的调用

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK:- 懒加载属性
    lazy var popoverAnimtor : CMPopoverAnimator = {
        /*
        - 这里是利用闭包方式创建一个对象,也可以直接赋值创建,只不过闭包创建可以在里面做一些额外的操作.
        - 在这里动画创建属性是为了强引用自己本身,因为代理属性是weak,所以就做不到强引用我们这个控制器.需要这自己手动引用.
        - 在Swift中默认情况下所有属性都是强引用的,如果想要若引用可以在最前加weak修饰
        - 闭包内用self容易造成循环引用,所以 [unowned self] 修饰self会使闭包内self变为弱引用
        */
        let animator = CMPopoverAnimator(startAnimate: {[unowned self] (isPresented) -> () in
            self.titleBtn.selected = isPresented
            })
        animator.presentedFrame = CGRect(x: 100, y: 60, width: 180, height: 250)
        return animator
    }()
    
    lazy var titleBtn : TitleButton = {
        let titleBtn = TitleButton(type: .Custom)
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: .TouchUpInside)
        
        return titleBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.执行转盘动画
        visitorView?.addRotationalAnimation()
        
        // 2.设置导航栏items
        setUpVisitorNavigationItems()
        if !isLogin { // 如果没登录直接返回
            return
        }
        
        // 3.设置登录后的导航栏items
        setUpHomeNavigationItems()
    }
    
    // MARK:- 设置导航栏item
   private func setUpHomeNavigationItems() {
        // 1.左侧item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: "leftItemClick")
    
        // 2.右侧item
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: "rightItemClick")
    
        // 3.设置导航栏中间titleView为自定义的titleButton

        navigationItem.titleView = titleBtn
        
    }
    
    // MARK:- 事件监听函数
    @objc private func leftItemClick() {
        print("leftItemClick")
    }
    
    @objc private func rightItemClick() {
        print("rightItemClick")
    }
    
    @objc private func titleBtnClick(titleBtn : TitleButton) {
        // titleBtn.selected = !titleBtn.selected
        
        // 1.创建PopoverVc
        let popoverVc = PopoverViewController()
        
        // 2.设置PopoverVc的弹出样式
        // 默认情况下model出一个控制器后,会将之前显示的控制器移除掉
        // 如果不希望移除控制器,可以将modalPresentationStyle设置成Custom类型
        popoverVc.modalPresentationStyle = .Custom
        
        // 3.自定义modal,需要设置转场的代理
        // 代理是若引用,所以popoverAnimitor需要强引用
        popoverVc.transitioningDelegate = popoverAnimtor
        
        // 弹出控制器
        presentViewController(popoverVc, animated: true, completion: nil)
    }
}
