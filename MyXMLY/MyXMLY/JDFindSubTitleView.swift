//
//  JDFindSubTitleView.swift
//  MyFFM
//
//  Created by BaoLuniOS-3 on 2017/2/18.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit

let kSystemOriginColor = UIColor(red: 0.96, green: 0.39, blue: 0.26, alpha: 1.0)
let kSystemBlackColor = UIColor(red: 0.38, green: 0.39, blue: 0.40, alpha: 1.0)

protocol JDFindSubTitleViewDelegate : NSObjectProtocol {
    // 当前选中第index个标题的代理毁掉
    func findSubTitleViewDidSelected(_ titleView : JDFindSubTitleView, atIndex : Int, title : String)
}

class JDFindSubTitleView: UIView {

    // MARK:- 代理
    weak var delegate : JDFindSubTitleViewDelegate?
    
    // MARK:- 自定义属性
    var subTitleBtnArray = [UIButton]()
    var currentSelectedBtn : UIButton?
    
    var titleArray : [String] = [] {
        didSet {
            // 配置子标题
            configSubTitles()
        }
    }
    
    // MARK:- 懒加载属性
    /// 下方的滑块指示器
    lazy var sliderView : UIView = {[unowned self] in
        let view = UIView()
        view.backgroundColor = kSystemOriginColor
        self.addSubview(view)
        
        // 布局
        view.snp.makeConstraints({ (make) in
            make.size.equalTo(CGSize(width: 30, height: 2))
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left).offset(5)
        })
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor.white
    }
}

// MARK: - 外部接口
extension JDFindSubTitleView {
    /// 跳转
    func jump2show(at index : Int) {
        if index < 0 || index >= subTitleBtnArray.count {
            return
        }
        
        // 获取按钮
        let btn = subTitleBtnArray[index]
        
        selectAtBtn(btn, isStartFirst: false)
    }
}

/// 配置子标题
extension JDFindSubTitleView {
    fileprivate func configSubTitles() {
        // 宽度
        let btnW = kScreenW / CGFloat(titleArray.count)
        
        for index in 0..<titleArray.count {
            let title = titleArray[index]
            let btn = UIButton(type: .custom)
            
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(kSystemBlackColor, for: .normal)
            btn.setTitleColor(kSystemOriginColor, for: .selected)
            btn.setTitleColor(kSystemOriginColor, for: [.selected, .highlighted])
            
            btn.frame = CGRect(x: CGFloat(index) * btnW, y: 0, width: btnW, height: 38)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            btn.adjustsImageWhenDisabled = false
            
            // 监听点击
            btn.addTarget(self, action: #selector(titleBtnClick(_:)), for: .touchUpInside)
            
            subTitleBtnArray.append(btn)
            addSubview(btn)
        }
        
        guard let firstBtn = subTitleBtnArray.first else {
            return
        }
        
        // 默认选中第一个按钮
        selectAtBtn(firstBtn, isStartFirst: true)
    }
    
    /// 当前选中了某一个按钮
    fileprivate func selectAtBtn(_ btn : UIButton, isStartFirst : Bool) {
        btn.isSelected = true
        
        currentSelectedBtn?.isSelected = false
        currentSelectedBtn = btn
        
        // 下划线
        sliderView.snp.updateConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(btn.x + btn.width * 0.5 - 15)
        }
        
        // 执行动画
        if !isStartFirst {
            UIView.animate(withDuration: 0.25, animations: { [unowned self] in
                self.layoutIfNeeded()
            })
        }
    }
    
    /// - 监听按钮的点击
    @objc func titleBtnClick(_ btn : UIButton) {
        if btn == currentSelectedBtn {
            return
        }
        
        // 通知代理
        delegate?.findSubTitleViewDidSelected(self, atIndex: subTitleBtnArray.index(of: btn)!, title: (btn.titleLabel?.text)!)
        
        selectAtBtn(btn, isStartFirst: false)
    }
}
