//
//  JDFindCityColumn.swift
//  MyFFM
//
//  Created by chen on 2017/4/11.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit
import HandyJSON

class JDFindCityColumn: HandyJSON {
    var code: String?
    
    var title: String?
    
    var count: Int = 0
    
    var list: [JDFindFeeDetailModel]?
    
    var hasMore: Bool = false
    
    var contentType: String?
    
    required init() {}
}
