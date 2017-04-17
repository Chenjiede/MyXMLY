//
//  JDFindCellStyleFee.swift
//  MyFFM
//
//  Created by chen on 2017/4/11.
//  Copyright © 2017年 BaoLuniOS-3. All rights reserved.
//

import UIKit
import SDWebImage

protocol JDFindCellStyleFeeDelegate {
    
    func findCellStyleFeeMoreClickOn(_ cell : JDFindCellStyleFee)
}

class JDFindCellStyleFee: UITableViewCell {

    // MARK:- 连线属性
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var iconImgLeft: UIImageView!
    @IBOutlet weak var contentLeft: UILabel!
    @IBOutlet weak var subContentLeft: UILabel!
    @IBOutlet weak var iconImgMiddle: UIImageView!
    @IBOutlet weak var contentMiddle: UILabel!
    @IBOutlet weak var subContentMiddle: UILabel!
    @IBOutlet weak var iconImgRight: UIImageView!
    @IBOutlet weak var contentRight: UILabel!
    @IBOutlet weak var subContentRight: UILabel!
    
    // 代理
    var delegate : JDFindCellStyleFeeDelegate?
    
    // MARK:- 模型属性
    /// 小编推荐模型
    var recommendModel: JDFindEditorRecommendAlbum? {
        didSet {
            setRecommendModel()
        }
    }
    /// 城市模型
    var cityColumnModel: JDFindCityColumn? {
        didSet{
            setCityColumnModel()
        }
    }
    /// 猜你喜欢模型
    var guessModel: JDFindGuess? {
        didSet{
            setGuessModel()
        }
    }
    /// 热门推荐模型
    var hotRecommendsList: JDFindHotRecommendsList? {
        didSet{
            setHotRecommendsList()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

// MARK:- 模型方法
extension JDFindCellStyleFee {
    func setRecommendModel() {
        guard (recommendModel != nil) else { return }
        titleL.text = recommendModel?.title
        setSubDetailsWith(list: (recommendModel?.list)!)
    }
    
    func setCityColumnModel() {
        guard (cityColumnModel != nil) else { return }
        titleL.text = cityColumnModel?.title
        setSubDetailsWith(list: (cityColumnModel?.list)!)
    }
    
    func setGuessModel() {
        guard (guessModel != nil) else { return }
        titleL.text = guessModel?.title
        setSubDetailsWith(list: (guessModel?.list)!)
    }
    
    func setHotRecommendsList() {
        guard (hotRecommendsList != nil) else { return }
        titleL.text = hotRecommendsList?.title
        setSubDetailsWith(list: (hotRecommendsList?.list)!)
    }
    
    
    
    func setSubDetailsWith(list: [JDFindFeeDetailModel]) {
        for index in 0..<list.count {
            let model = list[index]
            let picUrl = URL(string: model.coverLarge ?? "")
            switch index {
            case 0:
                iconImgLeft.sd_setImage(with: picUrl)
                contentLeft.text = model.intro
                subContentLeft.text = model.title
            case 1:
                iconImgMiddle.sd_setImage(with: picUrl)
                contentMiddle.text = model.intro
                subContentMiddle.text = model.title
            case 2:
                iconImgRight.sd_setImage(with: picUrl)
                contentRight.text = model.intro
                subContentRight.text = model.title
            default:
                return
            }
        }
    }
}

// MARK:- 事件监听
extension JDFindCellStyleFee {
    
    @IBAction func moreClick() {
        
        delegate?.findCellStyleFeeMoreClickOn(self)
    }
}
