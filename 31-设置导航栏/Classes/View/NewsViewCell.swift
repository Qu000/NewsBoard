//
//  NewsViewCell.swift
//  31-设置导航栏
//
//  Created by qujiahong on 2017/11/29.
//  Copyright © 2017年 瞿嘉洪. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {

    // MARK: - 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var replyCountLabel: UILabel!
    
    // MARK: - 定义模型属性
    var newsModel : NewsModel? {
        didSet{
            titleLabel.text = newsModel?.title
            sourceLabel.text = newsModel?.source
            replyCountLabel.text = "\(newsModel?.replyCount ?? 0)人跟帖"
        }
    }
}
