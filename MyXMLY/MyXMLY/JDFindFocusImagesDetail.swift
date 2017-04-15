//
//  JDFindFocusImagesDetail.swift
//  MyFFM
//
//  Created by chen on 2017/4/12.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit
import HandyJSON

class JDFindFocusImagesDetail: HandyJSON {
    
    var uid: Int = 0
    
    var shortTitle: String?
    
    var ID: Int = 0
    
    var pic: String?
    
    var albumId: Int = 0
    
    var isShare: Bool = false
    
    var is_External_url: Bool = false
    
    var type: Int = 0
    
    var longTitle: String?
    
    required init() {}
}
