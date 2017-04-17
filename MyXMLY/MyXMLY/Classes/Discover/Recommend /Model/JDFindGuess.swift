//
//  JDFindGuess.swift
//  MyFFM
//
//  Created by chen on 2017/4/11.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit
import HandyJSON

class JDFindGuess: HandyJSON {
    var hasMore: Bool = false
    
    var title: String?
    
    var list: [JDFindFeeDetailModel]?
    
    required init() {}
}
