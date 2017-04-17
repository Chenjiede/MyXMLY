//
//  JDFindRecHeaderView.swift
//  MyFFM
//
//  Created by BaoLuniOS-3 on 2017/3/2.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit
import SDCycleScrollView

let cycleViewH: CGFloat = 150   // 播视图高度
let cateIconW: Double = 71
let cateIconH: Double = 90

class JDFindRecHeaderView: UIView {
    // MARK: - 连线属性
    /// 上方广告轮播图
    @IBOutlet weak var adverView: UIView!
    /// 下方分类图
    @IBOutlet weak var cateScrollView: UIScrollView!
    
    // MARK: - 属性
    /// 图片数组
    var focusImages : [String]! {
        didSet{
            setupCycleView()
        }
    }
    
    /// 分类数组
    var cateArray :[JDFindDiscoveryColumnsList]! {
        didSet {
            setupCategorys()
        }
    }
    
    /// 类构造方法
    class func findHeaderView() -> JDFindRecHeaderView? {
        
        guard let view = Bundle.main.loadNibNamed("JDFindRecHeaderView", owner: nil, options: nil)?.first as? JDFindRecHeaderView else {
            return nil
        }
        
        return view
    }
}

// MARK:- viewModel被设置后调用
extension JDFindRecHeaderView {
    /// 设置广告轮播图片
    fileprivate func setupCycleView() {
        // 移除所有子视图
        _ = adverView.subviews.map {
            $0.removeFromSuperview()
        }
        
        // 添加轮播视图
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: cycleViewH)
        if let cycleView = SDCycleScrollView(frame: frame, delegate: self, placeholderImage: nil) {
            cycleView.showPageControl = true
            cycleView.imageURLStringsGroup = focusImages
            adverView.addSubview(cycleView)
        }
    }
    
    /// 设置分类
    fileprivate func setupCategorys() {
        // 移除所有子视图
        _ = cateScrollView.subviews.map {
            $0.removeFromSuperview()
        }
        
        let cateCount = Double(cateArray.count)
        
        if cateCount == 0 {
            return
        }
        
        // 添加控件
        cateScrollView.contentSize = CGSize(width: cateIconW * cateCount, height: cateIconH)
        for index in 0..<cateArray.count {
            guard let cateView = JDFindHeaderIconView.findIconView() else {return}
            
            cateView.frame = CGRect(x: Double(index) * cateIconW, y: 0, width: cateIconW, height: cateIconH)
            cateView.model = cateArray[index]
            
            cateScrollView.addSubview(cateView)
        }
    }
}

// MARK: - SDCycleScrollViewDelegate
extension JDFindRecHeaderView : SDCycleScrollViewDelegate {
    /// 点击图片的监听方法
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print("点击了\(index)张图片")
    }
}
