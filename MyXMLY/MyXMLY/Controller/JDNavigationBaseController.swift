//
//  JDNavigationBaseController.swift
//  MyFFM
//
//  Created by BaoLuniOS-3 on 2017/2/27.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit

class JDNavigationBaseController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 隐藏退回按钮
        navigationItem.hidesBackButton = true
        
        let attributes = [NSForegroundColorAttributeName : UIColor.hexInt(0x333333),
                          NSFontAttributeName : UIFont.systemFont(ofSize: 18)]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().tintColor = UIColor.hexInt(0x333333)
        
        let img = UIImage(named: "btn_back_n")?.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 0, 18, 0))
        // 让导航条返回键带的title消失!
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-1000, 0), for: .default)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(img, for: .normal, barMetrics: .default)
        
    }

}
