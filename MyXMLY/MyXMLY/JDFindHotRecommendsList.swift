//
//  JDFindHotRecommendsList.swift
//  MyFFM
//
//  Created by chen on 2017/4/11.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit
import HandyJSON

class JDFindHotRecommendsList: HandyJSON {
    var hasMore: Bool = false
    
    var isPaid: Bool = false
    
    var contentType: String?
    
    var title: String?
    
    var isFinished: Bool = false
    
    var categoryId: Int = 0
    
    var count: Int = 0
    
    var list: [JDFindFeeDetailModel]?
    
    var categoryType: Int = 0
    
    var filterSupported: Bool = false
    
    required init() {}
}
