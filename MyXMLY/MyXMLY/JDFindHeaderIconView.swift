//
//  JDFindHeaderIconView.swift
//  MyFFM
//
//  Created by BaoLuniOS-3 on 2017/3/2.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit
import SDWebImage

class JDFindHeaderIconView: UIView {

    // MARK: - 连线属性
    /// icon图片
    @IBOutlet weak var imageView: UIImageView!
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - 属性
    // TODO: 这里是不对的,有待修改
    var model : JDFindDiscoveryColumnsList! {
        didSet {
            setupDetailModel()
        }
    }
    
    /// 类构造方法
    class func findIconView() -> JDFindHeaderIconView? {
        if let view = Bundle.main.loadNibNamed("JDFindHeaderIconView", owner: nil, options: nil)?.first as? JDFindHeaderIconView {
            return view
        }
        
        return nil
    }
}

// MARK:- viewModel被设置后调用
extension JDFindHeaderIconView {
    /// 设置数据
    fileprivate func setupDetailModel() {
        titleLabel.text = model.title
        guard let imageUrl = model.coverPath else {
            return
        }
        imageView.sd_setImage(with: URL(string: imageUrl))
    }
}
