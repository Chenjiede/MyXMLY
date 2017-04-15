//
//  JDTabBarController.swift
//  MyFFM
//
//  Created by BaoLuniOS-3 on 2017/2/18.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit

// tag的累积值
let kTagPlus : Int = 100

// TabBar的高度
let kTabBarH : CGFloat = 49

class JDTabBarController: UITabBarController {
    // MARK:- 普通属性
    /// 后方的背景生图片
    lazy var bgImagView : UIImageView = {
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: kScreenH - kTabBarH, width: kScreenW, height: kTabBarH))
        imageView.image = UIImage(named: "tabbar_bg")
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    /// 按钮正常状态下的图片数组
    lazy var normalImageArray : [UIImage] = {
        var imageArray = [UIImage]()
        imageArray.append(UIImage(named: "tabbar_find_n")!)
        imageArray.append(UIImage(named: "tabbar_sound_n")!)
        imageArray.append(UIImage(named: "tabbar_np_playnon")!)
        imageArray.append(UIImage(named: "tabbar_download_n")!)
        imageArray.append(UIImage(named: "tabbar_me_n")!)
        
        return imageArray
    }()
    
    /// 按钮选中状态下的图片数组
    lazy var selectImageArray : [UIImage] = {
        var imageArray = [UIImage]()
        imageArray.append(UIImage(named: "tabbar_find_h")!)
        imageArray.append(UIImage(named: "tabbar_sound_h")!)
        imageArray.append(UIImage(named: "tabbar_np_playnon")!)
        imageArray.append(UIImage(named: "tabbar_download_h")!)
        imageArray.append(UIImage(named: "tabbar_me_h")!)
        
        return imageArray
    }()
    
    // MARK:- 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()

        // 自定义TabBar
        createCustomTabBar()
        
        // 配置子控制器
        configSubControllers()
    }
    
}

// MARK:- 初始化
extension JDTabBarController {
    /// 自定义TabBar
    fileprivate func createCustomTabBar() {
        // 隐藏原有TabBar
        tabBar.isHidden = true
        
        view.addSubview(bgImagView)
        
        // 添加按钮
        let btnW = kScreenW / 5.0
        
        for index in 0..<5 {
            let btn = UIButton(type: .custom)
            if index == 2 {
                btn.frame = CGRect(x: (kScreenW - kTabBarH) * 0.5, y: -10, width: kTabBarH + 10, height: kTabBarH + 10)
            } else {
                btn.frame = CGRect(x: btnW * CGFloat(index), y: 0, width: btnW, height: kTabBarH)
            }
            
            btn.tag = kTagPlus + index
            btn.adjustsImageWhenDisabled = false
            // 设置图片
            btn.setImage(normalImageArray[index], for: .normal)
            btn.setImage(selectImageArray[index], for: .selected)
            
            /// 按钮的点击方法监听
            btn.addTarget(self, action: #selector(tabBarItemSelected(_:)), for: .touchUpInside)
            
            bgImagView.addSubview(btn)
        }
        
        // 设置中间按钮阴影
        guard let playBtn = bgImagView.viewWithTag(102) else {
            return
        }
        let img = UIImageView(image: UIImage(named: "tabbar_np_shadow"))
        let width : CGFloat = playBtn.frame.width + 6
        img.frame = CGRect(x: -3, y: -3, width: width, height: btnW * 13.0 / 15.0)
        playBtn.addSubview(img)
        
        // 设置默认选中第一个
        tabBarItemSelected(bgImagView.viewWithTag(kTagPlus) as! UIButton)
    }
    
    fileprivate func configSubControllers() {
        tabBar.isHidden = true
        
        var tempArray = [JDNavigationBaseController]()
        let findNav = navigationController(JDFindController())
        tempArray.append(findNav)
        
        viewControllers = tempArray
    }
    
    private func navigationController(_ vc : UIViewController) -> JDNavigationBaseController {
        let nav = JDNavigationBaseController(rootViewController: vc)
        nav.delegate = self
        
        return nav
    }
}

// MARK: - 事件监听
extension JDTabBarController {
    @objc func tabBarItemSelected(_ btn : UIButton) {
        print(btn.tag)
    }
}

// MARK: - 导航控制器的代理
extension JDTabBarController : UINavigationControllerDelegate {
    
}
