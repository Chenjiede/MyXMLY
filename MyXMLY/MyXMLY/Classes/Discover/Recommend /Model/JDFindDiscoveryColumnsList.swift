//
//  JDFindDiscoveryColumnsList.swift
//  MyFFM
//
//  Created by BaoLuniOS-3 on 2017/3/2.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit
import HandyJSON

class JDFindDiscoveryColumnsList: HandyJSON {
    var subtitle: String?
    
    var coverPath: String?
    
    var contentType: String?
    
    var title: String?
    
    var enableShare: Bool = false
    
    var isExternalUrl: Bool = false
    
    var properties: JDFindDiscoveryColumnsProperties?
    
    var sharePic: String?
    
    var url: String?
    
    required init(){}
}
