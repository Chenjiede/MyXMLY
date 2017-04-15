//
//  JDPageViewController.swift
//  MyFFM
//
//  Created by BaoLuniOS-3 on 2017/2/23.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit

protocol JDPageViewControllerDelegate : NSObjectProtocol {
    // MARK: 获取当前子控制器的角标
    func pageCurrentSubControllerIndex( index: NSInteger, pageViewController: JDPageViewController)
}

class JDPageViewController: UIViewController {

    var delegate : JDPageViewControllerDelegate?
    // MARK:- 定义属性
    var controllers: [UIViewController] = [UIViewController]()
    /// 父控制器
    var superController: UIViewController!
    var pageVc: UIPageViewController!
    
    // MARK:- init
    init(superController : UIViewController, controllers : [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        
        // 赋值数据
        self.superController = superController
        self.controllers = controllers
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

}

// MARK:- 初始化
extension JDPageViewController {
    fileprivate func setup() {
        if controllers.count == 0 {
            return
        }

        let options : [String : Any] = [UIPageViewControllerOptionSpineLocationKey : NSNumber(integerLiteral:UIPageViewControllerSpineLocation.none.rawValue)]
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
        pageVC.delegate = self
        pageVC.dataSource = self
        pageVC.setViewControllers([controllers.first!], direction: .forward, animated: false, completion: nil)
        
        pageVC.view.frame = self.view.frame
        
        self.view.addSubview(pageVC.view)
        
        pageVc = pageVC
    }
}

// MARK:- 向外提供的方法
extension JDPageViewController {
    // MARK: 设置当前子控制器
    func setCurrentSubController(index : NSInteger) {
        pageVc.setViewControllers([controllers[index]], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: 代理与数据源
extension JDPageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    /// 前一个控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.index(of: viewController) else {
            return nil
        }
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        return controllers[index - 1]
    }
    
    /// 后一个控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.index(of: viewController) else {
            return nil
        }
        if index == NSNotFound || index == controllers.count - 1 {
            return nil
        }
        
        return controllers[index + 1]
    }
    
    /// 返回控制器数量
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    /// 获取当前子控制器的角标
    func indexForViewController(controller : UIViewController) -> Int {
        return controllers.index(of: controller)!
    }
    
    /// 跳转到另一个控制器界面时调用
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let vc = pageViewController.viewControllers?[0] else {
            return
        }
        
        let index = indexForViewController(controller: vc)
        
        delegate?.pageCurrentSubControllerIndex(index: index, pageViewController: self)
    }
}
