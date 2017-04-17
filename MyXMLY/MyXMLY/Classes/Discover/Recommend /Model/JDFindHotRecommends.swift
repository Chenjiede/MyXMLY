//
//  JDFindHotRecommends.swift
//  MyFFM
//
//  Created by chen on 2017/4/12.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit
import HandyJSON

class JDFindHotRecommends: HandyJSON {
    var ret: Int = 0
    
    var title: String?
    
    var list: [JDFindHotRecommendsList]?
    
    required init() {}
}
