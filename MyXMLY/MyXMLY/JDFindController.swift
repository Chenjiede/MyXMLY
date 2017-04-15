//
//  JDFindController.swift
//  MyFFM
//
//  Created by BaoLuniOS-3 on 2017/2/18.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit

class JDFindController: JDBaseController {

    // MARK: - 懒加载
    /// 子标题
    lazy var subTitle : [String] = {
       return ["推荐", "分类", "广播", "榜单", "主播"]
    }()
    
    /// 子控制器
    lazy var controllers : [UIViewController] = {[unowned self] in
        var cons = [JDFindBaseController]()
        for title in self.subTitle {
            let con : JDFindBaseController = JDSubFindFactory.subFindVC(identifier: title)
            cons.append(con)
        }
        return cons
    }()
    
    /// 子标题视图
    lazy var subTitleView : JDFindSubTitleView = { [unowned self] in
        let view = JDFindSubTitleView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 40))
        self.view.addSubview(view)
        
        return view
    }()
    
    /// 控制多个子控制器
    lazy var myPageVc : JDPageViewController = { [unowned self] in
        let pageVc : JDPageViewController = JDPageViewController(superController: self, controllers: self.controllers)
        pageVc.delegate = self
        self.view.addSubview(pageVc.view)
        return pageVc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置背景颜色
        view.backgroundColor = UIColor(red: 0.92, green: 0.93, blue: 0.93, alpha: 1.0)
        title = "发现"
        
        subTitleView.titleArray = subTitle
        subTitleView.delegate = self
        
        // 配置子标题视图
        myPageVc.view.snp.makeConstraints { (make) in
            make.top.equalTo(subTitleView.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(view.snp.bottom).offset(-49)
        }
    }
    
}

// MARK: - JDPageViewControllerDelegate代理方法
extension JDFindController : JDPageViewControllerDelegate {
    func pageCurrentSubControllerIndex(index: NSInteger, pageViewController: JDPageViewController) {
        subTitleView.jump2show(at: index)
    }
}

// MARK: - JDFindSubTitleViewDelegate代理方法
extension JDFindController : JDFindSubTitleViewDelegate {
    func findSubTitleViewDidSelected(_ titleView: JDFindSubTitleView, atIndex: Int, title: String) {
        myPageVc.setCurrentSubController(index: atIndex)
    }
}
