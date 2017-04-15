//
//  UIColor+Extension.swift
//  MyFFM
//
//  Created by BaoLuniOS-3 on 2017/2/18.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit

extension UIColor {
    class func hexInt(_ hexValue : Int) -> UIColor {
        return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0,
                       
                       green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0,
                       
                       blue: ((CGFloat)(hexValue & 0xFF)) / 255.0,
                       
                       alpha: 1.0)
    }
    
    class func random() -> UIColor {
        let r = CGFloat(arc4random_uniform(255)) / CGFloat(255.0)
        let g = CGFloat(arc4random_uniform(255)) / CGFloat(255.0)
        let b = CGFloat(arc4random_uniform(255)) / CGFloat(255.0)
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
