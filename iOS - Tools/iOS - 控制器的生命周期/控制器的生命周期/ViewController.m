//
//  ViewController.m
//  控制器的生命周期
//
//  Created by 蔡明on 15/5/22.
//  Copyright © 2015年 cm. All rights reserved.
//

#define XMGFunc NSLog(@"%s",__func__)

#import "ViewController.h"
#import "SubViewController.h"
@interface ViewController ()

@end

@implementation ViewController
/*
 loadView与viewDidLoad的区别：当loadView时，还没有view；而viewDidLoad时，view已经创建好了。详细的加载循环：
 1:程序请求ViewController的view属性
 
 2：如果view在内存中，则直接加载；如果不存在，则调用loadView方法
 
 3：loadView方法执行如下方法：
 
 如果重载了这个方法，则必须创建必要的UIView并且将一个非nil值传给ViewController的view属性。
 如果没有重载这个方法，ViewController会默认使用自己的nibName和nibBundle属性尝试从nib文件加载view。如果没有找到nib文件，它尝试寻找一个与ViewController类名匹配的nib文件。
 如果没有可用的nib文件，那么它创建一个空的UIView作为它的view。
 */



/*
ViewController的初始化：
从Storyboards中加载的时候，会调用initWithCode，如果不存在则调用init。之后对里面的每个对象调用awakeFromNib方法。
从内存中alloc出来的情况下，调init方法。
ViewController查找与其关联的view，其顺序是：
1 先判断子类是否重写了loadView，如果有直接调用。之后调viewDidLoad完成View的加载。
 
2 如果是外部通过调用initWithNibName:bundle指定nib文件名的话，ViewController记载此nib来创建View。
3 如果initWithNibName:bundle的name参数为nil，则ViewController会通过以下两个步骤找到与其关联的nib。
A 如果类名包含Controller，例如ViewController的类名是MyViewController，则查找是否存在MyView.nib；
B 找跟ViewController类名一样的文件，例如MyViewController，则查找是否存在MyViewController.nib。
4  如果子类没有重写的loadView，则ViewController会从StroyBoards中找或者调用其默认的loadView，默认的loadView返回一个空白的UIView对象。
注意第一步，ViewController 是判断子类是否重写了loadView，而不是判断调用子类的loadView之后ViewController的View是否为空。就是说，如果子类重 写了loadView的话，不管子类在loadView里面能否获取到View，ViewController都会直接调viewDidLoad完成 View的加载。

ViewController的卸载View的步骤：
1 系统发出内存警告或者ViewController本身调用导致didReceiveMemoryWarning被调用
2 如果此时view没有被加入到任何视图树上，则调用viewWillUnload之后释放View
3 调用viewDidUnload

注意view的Load和Unload不是成对调用的。
因为viewWillUnload和viewDidUnload这两个函数只在内存警告时被调用。
就算强制将viewController的view设为nil也不会触发。
如果viewController从创建到销毁期间都没有内存警告，那么这两个函数将始终不会被调用。
更新：
iOS6已将viewWillUnload和viewDidUnload废弃，原因是UIKit在内存警告的时候已经不会自动释放无用的视图。
详见：http://blog.csdn.net/wihing/article/details/8769715
*/

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
 *  视图载入完成，可以进行自定义数据以及动态创建其他控件
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    XMGFunc;
    self.title = @"MainVC";
}
/**
 *  视图将出现在屏幕之前，马上这个视图就会被展现在屏幕上了，每次视图消失再出现都会再次调用,通常我们会利用这个方法，对即将显示的视图做进一步的设置。例如，我们可以利用这个方法来设置设备不同方向时该如何显示。在视图间切换时，并不会再次载入viewDidLoad方法，所以如果在调入视图时，需要对数据做更新，就只能在这个方法内实现了。

     注意 : 该方法可以拿到UI控件的最真实尺寸
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    XMGFunc;
}
/**
 *  视图已在屏幕上渲染完成,有时候，由于一些特殊的原因，我们不能在viewWillApper方法里，对视图进行更新。那么可以重写这个方法，在这里对正在显示的视图进行进一步的设置
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
 *  视图将被从屏幕上移除之前执行,在视图变换时，当前视图在即将被移除、或者被覆盖时，会调用这个方法进行一些善后的处理和设置。
 */
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    XMGFunc;
}
/**
 *  视图已经被从屏幕上移除，用户看不到这个视图了,我们可以重写这个方法，对已经消失，或者被覆盖，或者已经隐藏了的视图做一些其他操作。
 

 */
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
/**
 *  当程序收到内存警告的时候，会调用每一个ViewController的didReceiveMemoryWarning方法，我们需要做出相应，释放程序中暂时不需要的资源；通常都会重写该方法，但记得重写的时候要调用super的该方法。
    iOS3.0 - iOS6.0期间，didReceiveMemoryWarning方法会判断当前ViewController的view是否显示在window上，如果没有显示在window上，则didReceiveMemoryWarning会自动将ViewController的view以及其所有子view全部销毁，然后调用View Controller的viewDidUnload方法。但是从iOS6.0开始，viewDidUnload和viewWillUnload这两个方法已被废除，收到low-memory时系统不会释放view，而只是释放controller的resource。
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    XMGFunc;
    //当前iOS系统的版本号
    float ver = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (ver >= 6.0f) {
        //判断视图是否被装载进内存，并且是否为当前视图
        if (self.isViewLoaded && !self.view.window) {
            //将self.view置为nil，确保调用该viewController时，loadView和viewDidLoad再次调用
            self.view = nil;//确保下次重新加载
        }
    }
}

- (void)dealloc
{
    XMGFunc;
}
- (IBAction)Push:(id)sender {
    SubViewController *sub = [[SubViewController alloc] init];
    [self.navigationController pushViewController:sub animated:YES];
}

@end
