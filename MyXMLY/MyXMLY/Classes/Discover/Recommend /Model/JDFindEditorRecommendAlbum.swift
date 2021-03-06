//
//  JDFindEditorRecommendAlbum.swift
//  MyFFM
//
//  Created by chen on 2017/4/11.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit
import HandyJSON

class JDFindEditorRecommendAlbum: HandyJSON {
    
    var title: String?
    
    var list: [JDFindFeeDetailModel]?
    
    var hasMore: Bool = false
    
    var ret: Int = 0
    
    required init() {}
}
