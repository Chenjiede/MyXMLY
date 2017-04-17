//
//  JDSubFindFactory.swift
//  MyFFM
//
//  Created by BaoLuniOS-3 on 2017/2/18.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit

enum JDSubFindTyep {
    case JDSubFindTypeRecommend // 推荐
    case JDSubFindTypeCategory // 分类
    case JDSubFindTypeRadio     // 广播
    case JDSubFindTypeRand      // 榜单
    case JDSubFindTypeAnchor    // 主播
    case JDSubFindTypeUnkown    // 未知
}

class JDSubFindFactory {
    
    /// 快速构建子控制器
    class func subFindVC(identifier : String) -> JDFindBaseController {
        var con : JDFindBaseController!
        let type = typeFromTitle(identifier)
        
        switch type {
        case .JDSubFindTypeRecommend:
            con = JDFindRecommendController()
        
        case .JDSubFindTypeCategory:
            con = JDFindCategoryController()
            
        case .JDSubFindTypeRadio:
            con = JDFindRadioController()
            
        case .JDSubFindTypeRand:
            con = JDFindRandController()
            
        case .JDSubFindTypeAnchor:
            con = JDFindAnchorController()
            
        default:
            con = JDFindBaseController()
        }
        
        return con
    }
    
    /// 获取子控制器的类型
    private class func typeFromTitle(_ title : String) -> JDSubFindTyep {
        switch title {
        case "推荐":
            return .JDSubFindTypeRecommend
            
        case "分类":
            return .JDSubFindTypeCategory
            
        case "广播":
            return .JDSubFindTypeRadio
            
        case "榜单":
            return .JDSubFindTypeRand
            
        case "主播":
            return .JDSubFindTypeAnchor
            
        default:
            return .JDSubFindTypeUnkown
        }
    }
}
